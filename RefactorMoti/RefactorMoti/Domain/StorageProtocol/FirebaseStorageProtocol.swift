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
    
    // Version
    func fetchVersion() async -> (latest: String, forced: String)?
    
    // Category
    func createDefaultCategories() async -> Bool
    func fetchCategories() async throws -> [CategoryItem]
}
