//
//  ListViewModel.swift
//  MatchingWithSwiftUI
//
//  Created by tkt on 2025/06/16.
//

import Foundation

class ListViewModel {
    
    var users = [User]()
    
    private var currentIndex = 0
    
    init() {
        self.users = getMockUsers()
    }
    
    private func getMockUsers() -> [User] {
        return [
            User.MOCK_USER1,
            User.MOCK_USER2,
            User.MOCK_USER3,
            User.MOCK_USER4,
            User.MOCK_USER5,
            User.MOCK_USER6,
            User.MOCK_USER7,
        ]
    }
    
    func nopeButtonTapped() {
        if currentIndex >= users.count { return }
        
        NotificationCenter.default.post(name: Notification.Name("NOPEACTION"), object: nil, userInfo: [
            "id": users[currentIndex].id
        ])
        
        currentIndex += 1
    }
    
    func likeButtonTapped() {
        if currentIndex >= users.count { return }
        
        NotificationCenter.default.post(name: Notification.Name("LIKEACTION"), object: nil, userInfo: [
            "id": users[currentIndex].id
        ])
        
        currentIndex += 1
    }
    
    func redoButtonTapped() {
        if currentIndex <= 0 { return }
        
        NotificationCenter.default.post(name: Notification.Name("REDOACTION"), object: nil, userInfo: [
            "id": users[currentIndex - 1].id
        ])
        
        currentIndex -= 1
    }
}
