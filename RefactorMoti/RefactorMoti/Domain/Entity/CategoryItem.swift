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
}


// MARK: - Equatable

extension CategoryItem {
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
