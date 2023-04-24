//
//  ContentView.swift
//  MyTodo
//
//  Created by 廖俊瑶 on 2023/4/16.
//

import SwiftUI
import CoreData

struct TodoView: View {
    
    @ObservedObject var todoViewModel = TodoViewModel()
    
    @State private var showAddSheet = false
    
    var body: some View {
        ZStack {
            backgroundView
            listView
            plusButtonView
        }
    }
    
    // MARK: Views
    
    var backgroundView: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .offset(x: 200)
            .opacity(0.2)
    }
    
    var listView: some View {
        VStack {
            Text("待办事项").font(.largeTitle)
            List {
                ForEach (todoViewModel.todoList) { item in
                    ListRowView(vm: todoViewModel, item: item)
                }.onDelete (perform: todoViewModel.deleteItems)
            }.listStyle(.plain)
            
        }.opacity(0.9)
    }
    
    var plusButtonView: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    Group {
                        Circle()
                            .foregroundColor(Color.accentColor)
                            .frame(width: 60, height: 60)
                            .shadow(color: Color.black.opacity(0.5), radius: 10)
                            .onTapGesture {
                                showAddSheet.toggle()
                            }
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(Color.white)
                    }.sheet(isPresented: $showAddSheet) {
                        EditTodoView(todoViewModel: todoViewModel)
                    }
                    
                }
            }.padding(.horizontal, 20)
        }
        .padding()
    }
    
}

struct EditTodoView: View {
    
    @ObservedObject var todoViewModel: TodoViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var model: TodoModel = TodoModel()
    
    @FocusState private var isNoteFocused: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("标题", text: $model.title)
                        .font(.headline)
                        .frame(height: 60)
                        .padding(.top, 10)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $model.content)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                        // 设置为自动换行
                            .lineLimit(nil)
                            .focused($isNoteFocused)
                        if !isNoteFocused && model.content.isEmpty {
                            Text("内容")
                                .foregroundColor(Color(uiColor: .placeholderText))
                                .padding(.top, 10)
                                .allowsHitTesting(false)
                        }
                    }
                    .frame(height: 200)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 10)
                    .padding(.horizontal)
                    
                    Divider().padding()
                    
                    Toggle("提醒", isOn: $model.needNotice)
                        .padding(.horizontal)
                        .onChange(of: model.needNotice) { newState in
                            print(newState)
                            if !newState {
                                model.importantNotice.toggle()
                            }
                        }
                    
                    if model.needNotice {
                        Toggle("发送重要通知", isOn: $model.importantNotice)
                            .padding(.horizontal)
                        DatePicker("请选择时间", selection: $model.noticeDate, in: Date.now..., displayedComponents: [.date])
                            .padding()
                            .datePickerStyle(.graphical)
                    }
                    
                }
            }.navigationBarItems(
                leading: Button("取消") {
                    presentationMode.wrappedValue.dismiss()
                }.foregroundColor(Color.accentColor),
                trailing: Button("保存") {
                    todoViewModel.saveItem(model)
                    presentationMode.wrappedValue.dismiss()
                }.foregroundColor(Color.accentColor)
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("新建待办事项")
        }
        
    }
    
}

struct ListRowView: View {
    
    @ObservedObject var vm: TodoViewModel
    
    var item: Todo
    
    var body: some View {
        HStack {
            Image(systemName: item.isDone ? "checkmark.circle" : "circle")
            VStack (alignment: .leading){
                if item.isDone {
                    Text(item.title ?? "")
                        .font(.title3)
                        .foregroundColor(Color.secondary)
                        .strikethrough()
                        .lineLimit(1)
                    Text(item.content ?? "")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                        .strikethrough()
                        .lineLimit(1)
                } else {
                    Text(item.title ?? "")
                        .font(.title3)
                        .foregroundColor(Color.primary)
                        .lineLimit(1)
                    Text(item.content ?? "")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                        .lineLimit(1)
                }
            }
            Spacer()
            
            if item.needNotice {
                VStack (alignment: .trailing){
                HStack {
                    Spacer()
                    if item.importantNotice {
                        Image(systemName: "exclamationmark.circle")
                            .font(.caption)
                            .foregroundColor(Color.secondary)
                    }
                    Image(systemName: "iphone.radiowaves.left.and.right")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                }
                    if let date = item.noticeDate {
                        Text("\(TimeUtils.dateFormat(date))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 5)
                    }
                }
            }
        }.onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                vm.changeState(item)
                if item.isDone {
                    // 已完成，震动反馈
                    HapticManager.instance.notificate(.success)
                }
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView().preferredColorScheme(.light)
        TodoView().preferredColorScheme(.dark)
    }
}
