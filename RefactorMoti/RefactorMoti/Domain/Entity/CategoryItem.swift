//
//  CategoryItem.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

struct CategoryItem: Hashable {
    
    let id: Int
    let name: String
    var continued: Int = 0
    var lastChallenged: Date? = nil
    
    init(
        id: Int = UUID().hashValue,
        name: String,
        continued: Int = 0,
        lastChallenged: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.continued = continued
        self.lastChallenged = lastChallenged
    }
}


// MARK: - Dictionary

extension CategoryItem {
    
    func toInformation() -> [String: Any] {
        var information: [String: Any] = [
            Key.id: id,
            Key.name: name,
            Key.continued: continued
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
    }
}

