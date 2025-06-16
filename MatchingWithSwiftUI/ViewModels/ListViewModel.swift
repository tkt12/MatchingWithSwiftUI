//
//  ListViewModel.swift
//  MatchingWithSwiftUI
//
//  Created by 木下喬仁 on 2025/06/16.
//

import Foundation

class ListViewModel {
    
    var users = [User]()
    
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
        NotificationCenter.default.post(name: Notification.Name("NOPEACTION"), object: nil, userInfo: [
            "id": "1"
        ])
    }
}
