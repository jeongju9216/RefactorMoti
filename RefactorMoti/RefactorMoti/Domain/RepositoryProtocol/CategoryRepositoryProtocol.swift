//
//  CategoryRepositoryProtocol.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

protocol CategoryRepositoryProtocol {
    
    func fetchCategories() async throws -> [CategoryItem]
    func addCategory(_ category: CategoryItem) async -> Bool
    func createDefaultCategories() async -> Bool
}
