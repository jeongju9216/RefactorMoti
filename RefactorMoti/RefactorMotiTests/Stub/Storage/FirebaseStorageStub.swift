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
    
    func fetchAllAchievement() async throws -> [Achievement] {
        []
    }
}
