//
//  Achievement.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/2/24.
//

import Foundation

struct Achievement: Hashable {
    
    let id: String
    let imageURL: URL?
    var category: CategoryItem
    var title: String
    var body: String?
    let createdAt: Date?
}


// MARK: - Information

extension Achievement {
    
    init?(information: [String: Any]) {
        guard let id = information[Key.id] as? String,
              let imageURLString = information[Key.imageURL] as? String,
              let imageURL = URL(string: imageURLString),
              let categoryInformation = information[Key.category] as? [String: Any],
              let category = CategoryItem(information: categoryInformation),
              let title = information[Key.title] as? String,
              let createdAt = information[Key.createdAt] as? Date
        else {
            return nil
        }
        let body = information[Key.body] as? String
        
        self.id = id
        self.imageURL = imageURL
        self.category = category
        self.title = title
        self.body = body
        self.createdAt = createdAt
    }
}


// MARK: - Constant

private extension Achievement {
    
    enum Key {
        
        static let id = "id"
        static let imageURL = "imageURL"
        static let category = "category"
        static let title = "title"
        static let body = "body"
        static let createdAt = "createdAt"
    }
}
