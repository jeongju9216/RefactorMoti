//
//  CategoryRepository.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

struct CategoryRepository: CategoryRepositoryProtocol {
    
    func createDefaultCategories() async -> Bool {
        await firebaseStorage.createDefaultCategories()
    }
    
    func addCategory(name: String) async -> CategoryItem? {
        await firebaseStorage.addCategory(name: name)
    }
    
    func fetchCategories() async throws -> [CategoryItem] {
        try await firebaseStorage.fetchCategories()
    }
    
    // MARK: - Attribute
    
    private let firebaseStorage: FirebaseStorageProtocol
    
    // MARK: - Initializer
    
    init(firebaseStorage: FirebaseStorageProtocol = FirebaseStorage.shared) {
        self.firebaseStorage = firebaseStorage
    }
}
