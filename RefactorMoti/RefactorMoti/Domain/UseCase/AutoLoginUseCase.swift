//
//  AutoLoginUseCase.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/12/24.
//

import Foundation

protocol AutoLoginUseCaseProtocol {
    
    func execute() async -> Bool
}

struct AutoLoginUseCase: AutoLoginUseCaseProtocol {
    
    // MARK: - Interface
    
    func execute() async -> Bool {
        await repository.isExistUser()
    }
    
    
    // MARK: - Attribute
    
    private let repository: UserRepositoryProtocol
    
    
    // MARK: - Initializer
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
}
