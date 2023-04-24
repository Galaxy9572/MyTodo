//
//  TimeUtils.swift
//  MyTodo
//
//  Created by 廖俊瑶 on 2023/4/24.
//

import Foundation

struct TimeUtils {
    
    static private var dateTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    static func dateFormat(_ date: Date) -> String {
        return dateTimeFormatter.string(from: date)
    }
    
}
