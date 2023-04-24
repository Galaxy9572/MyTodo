//
//  TodoViewModel.swift
//  MyTodo
//
//  Created by 廖俊瑶 on 2023/4/18.
//

import CoreData
import SwiftUI

class TodoViewModel: ObservableObject {
    
    @Published var todoList: [Todo] = []
    
    var context = CoreDataManager.shared.container.viewContext
    
    init() {
        listTodo()
    }
    
    func listTodo() {
        do {
            let request: NSFetchRequest<Todo> = Todo.fetchRequest()
            let sortDescriptor = NSSortDescriptor(keyPath: \Todo.isDone, ascending: true)
            request.sortDescriptors = [sortDescriptor]
            todoList = try context.fetch(request)
        } catch let e {
            fatalError("Unresolved error \(e)")
        }
    }
    
    // MARK: CoreData操作
    
    // 保存到CoreData
    func saveItem(_ entity: TodoModel) {
        let newItem = Todo(context: context)
        newItem.title = entity.title
        newItem.content = entity.content
        newItem.needNotice = entity.needNotice
        newItem.importantNotice = entity.importantNotice
        newItem.noticeDate = entity.noticeDate
        newItem.isDone = false
        newItem.createDate = Date()
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        listTodo()
    }
    
    // 从CoreData删除
    func deleteItems(at offsets: IndexSet) {
        offsets.map { todoList[$0] }.forEach(context.delete)
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        listTodo()
    }
    
    func changeState(_ entity: Todo) {
        entity.isDone.toggle()
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        listTodo()
    }
    
}
