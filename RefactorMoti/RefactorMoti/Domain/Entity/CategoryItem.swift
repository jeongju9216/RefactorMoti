//
//  CategoryItem.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

struct CategoryItem: Equatable {
    
    let id: Int
    let name: String
    var continued: Int
    var lastChallenged: Date?
}
