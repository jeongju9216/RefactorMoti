//
//  FirebaseStorageStub.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/24/24.
//

import Foundation
@testable import RefactorMoti

struct FirebaseStorageStub: FirebaseStorageProtocol {
    
    // MARK: - Test Value
    
    var isExistUser: Bool = false
    var isAddedAchievementSuccess = true
    
    
    // MARK: - Interface
    
    func configure() { }
    
    func isExistUser() async -> Bool {
        isExistUser
    }
    
    func fetchVersion() async -> (latest: String, forced: String)? {
        ("1.0.0", "1.0.0")
    }
    
    func createDefaultCategories() async -> Bool {
        true
    }
    
    func addCategory(name: String) async -> CategoryItem? {
        CategoryItem(id: "", name: name)
    }
    
    func fetchCategories() async throws -> [CategoryItem] {
        []
    }
    
    func addAchievement(requestValue: AchievementRequestValue) async -> Achievement? {
        if isAddedAchievementSuccess {
            Achievement(
                id: "",
                imageURL: URL(string: requestValue.imageURLString),
                category: requestValue.category,
                title: requestValue.title,
                body: requestValue.body,
                createdAt: Date()
            )
        } else {
            nil
        }
    }
    
    func fetchAllAchievement() async throws -> [Achievement] {
        []
    }
}
