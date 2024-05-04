//
//  FetchCategoriesUseCase.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

protocol FetchCategoriesUseCaseProtocol {
    
    func execute() async throws -> [CategoryItem]
}

struct FetchCategoriesUseCase: FetchCategoriesUseCaseProtocol {
    
    // MARK: - Interface
    
    func execute() async throws -> [CategoryItem] {
        try await repository.fetchCategories()
    }
    
    
    // MARK: - Attribute
    
    private let repository: CategoryRepositoryProtocol
    
    
    // MARK: - Initializer
    
    init(repository: CategoryRepositoryProtocol = CategoryRepository()) {
        self.repository = repository
    }
}
