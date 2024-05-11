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
    
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [
            "id": id,
            "name": name,
            "continued": continued
        ]
        if let lastChallenged {
            dict["lastChallenged"] = lastChallenged
        }
        return dict
    }
}


// MARK: - Equatable

extension CategoryItem {
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
