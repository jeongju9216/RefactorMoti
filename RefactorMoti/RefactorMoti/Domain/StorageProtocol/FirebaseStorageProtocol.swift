//
//  FirebaseStorageProtocol.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/24/24.
//

import Foundation

protocol FirebaseStorageProtocol {
    
    // Configure
    func configure()
    
    // User
    func isExistUser() async -> Bool
    
    // Version
    func fetchVersion() async -> (latest: String, forced: String)?
    
    // Category
    func createDefaultCategories() async -> Bool
    func addCategory(name: String) async -> CategoryItem?
    func fetchCategories() async throws -> [CategoryItem]
    
    // Achievement
    func fetchAllAchievement() async throws -> [Achievement]
}
