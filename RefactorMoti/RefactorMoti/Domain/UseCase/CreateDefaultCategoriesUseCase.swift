//
//  CreateDefaultCategoriesUseCase.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/11/24.
//

import Foundation

protocol CreateDefaultCategoriesUseCaseProtocol {
    
    func execute() async -> Bool
}

struct CreateDefaultCategoriesUseCase: CreateDefaultCategoriesUseCaseProtocol {
    
    // MARK: - Interface
    
    func execute() async -> Bool {
        await repository.createDefaultCategories()
    }
    
    // MARK: - Attribute
    
    private let repository: CategoryRepositoryProtocol
    
    // MARK: - Initializer
    
    init(repository: CategoryRepositoryProtocol = CategoryRepository()) {
        self.repository = repository
    }
}
