//
//  Achievement.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/2/24.
//

import Foundation

struct Achievement: Equatable {
    
    let id: Int
    let userID: Int
    let imageURL: URL?
    var categoryID: Int
    var title: String
    var body: String?
    let createdAt: Date?
}
