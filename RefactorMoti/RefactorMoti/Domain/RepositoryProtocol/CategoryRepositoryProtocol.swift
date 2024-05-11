//
//  CategoryRepositoryProtocol.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

protocol CategoryRepositoryProtocol {
    
    func fetchCategories() async throws -> [CategoryItem]
    func addCategory(name: String) async -> Bool
    func createDefaultCategories() async -> Bool
}
