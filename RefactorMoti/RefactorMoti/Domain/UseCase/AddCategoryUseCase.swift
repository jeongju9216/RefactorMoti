//
//  AddCategoryUseCase.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/6/24.
//

import Foundation

protocol AddCategoryUseCaseProtocol {
    
    func execute(with categoryName: String) async -> CategoryItem?
}

struct AddCategoryUseCase: AddCategoryUseCaseProtocol {
    
    // MARK: - Interface
    
    func execute(with categoryName: String) async -> CategoryItem? {
        await repository.addCategory(name: categoryName)
    }
    
    
    // MARK: - Attribute
    
    private let repository: CategoryRepositoryProtocol
    
    
    // MARK: - Initializer
    
    init(repository: CategoryRepositoryProtocol = CategoryRepository()) {
        self.repository = repository
    }
}
