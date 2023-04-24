//
//  HomeView.swift
//  MyTodo
//
//  Created by 廖俊瑶 on 2023/4/17.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectdTag = 0
    
    var body: some View {
        TabView (selection: $selectdTag){
            TodoView().tabItem {
                VStack {
                    Image(systemName: "paperplane.fill")
                    Text("待办")
                }
            }.tag(0)
            SettingsView().tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("设置")
                }
            }.tag(1)
        }
        .background(.ultraThinMaterial)
//        .gesture(
//            DragGesture().onChanged{ value in
//                let moveSize = value.translation.width
//                let halfSize = UIScreen.main.bounds.width / 2
//                
//                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
//                    if abs(moveSize) > halfSize && moveSize > 0 {
//                        selectdTag = 0
//                    }
//                    
//                    if abs(moveSize) > halfSize && moveSize < 0 {
//                        selectdTag = 1
//                    }
//                }
//            }
//        )
        .environmentObject(TodoViewModel())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
