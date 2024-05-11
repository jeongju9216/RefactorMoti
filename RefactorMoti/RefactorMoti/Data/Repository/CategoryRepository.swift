//
//  CategoryRepository.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

struct CategoryRepository: CategoryRepositoryProtocol {
    
    func fetchCategories() async throws -> [CategoryItem] {
        try await firebaseStorage.fetchCategories()
    }
    
    func addCategory(_ category: CategoryItem) async -> Bool {
        true
    }
    
    func createDefaultCategories() async -> Bool {
        await firebaseStorage.createDefaultCategories()
    }
    
    
    // MARK: - Attribute
    
    private let firebaseStorage: FirebaseStorageProtocol
    
    
    // MARK: - Initializer
    
    init(firebaseStorage: FirebaseStorageProtocol = FirebaseStorage.shared) {
        self.firebaseStorage = firebaseStorage
    }
}
