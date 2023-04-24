//
//  HapticManager.swift
//  MyTodo
//
//  Created by 廖俊瑶 on 2023/4/21.
//

import UIKit

class HapticManager {
    
    static let instance = HapticManager()
    
    func notificate(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }
    
    func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }
}

