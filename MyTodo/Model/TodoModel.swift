//
//  TodoDTO.swift
//  MyTodo
//
//  Created by 廖俊瑶 on 2023/4/18.
//

import Foundation

struct TodoModel: Equatable{
    
    var id = UUID()
    
    var title = ""
    
    var content = ""
    
    var createDate = Date()
    
    var isDone = false
    
    var needNotice = false
    
    var importantNotice = false
    
    var noticeDate: Date = Date()
    
    // 实现 Equatable 协议
    static func == (lhs: TodoModel, rhs: TodoModel) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.content == rhs.content
        && lhs.createDate == rhs.createDate
        && lhs.isDone == rhs.isDone
        && lhs.needNotice == rhs.needNotice
        && lhs.importantNotice == rhs.importantNotice
    }
    
}
