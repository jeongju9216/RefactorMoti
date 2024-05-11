//
//  CategoryItem.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

struct CategoryItem: Hashable {
    
    let id: String
    let name: String
    var continued: Int = 0
    var lastChallenged: Date? = nil
}


// MARK: - Information

extension CategoryItem {
    
    init?(information: [String: Any]) {
        guard let id = information[Key.id] as? String,
              let name = information[Key.name] as? String,
              let continued = information[Key.continued] as? Int
        else {
            return nil
        }
        let lastChallenged = information[Key.lastChallenged] as? Date
        
        self.id = id
        self.name = name
        self.continued = continued
        self.lastChallenged = lastChallenged
    }
    
    func toInformation() -> [String: Any] {
        var information: [String: Any] = [
            Key.id: id,
            Key.name: name,
            Key.continued: continued,
            Key.createdAt: Date()
        ]
        if let lastChallenged {
            information[Key.lastChallenged] = lastChallenged
        }
        return information
    }
}


// MARK: - Equatable

extension CategoryItem {
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}


// MARK: - Constant

private extension CategoryItem {
    
    enum Key {
        
        static let id = "id"
        static let name = "name"
        static let continued = "continued"
        static let lastChallenged = "lastChallenged"
        static let createdAt = "createdAt"
    }
}

