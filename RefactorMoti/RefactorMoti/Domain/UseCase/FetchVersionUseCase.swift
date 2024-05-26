//
//  FetchVersionUseCase.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/24/24.
//

import Foundation

protocol FetchVersionUseCaseProtocol {
    
    func execute() async -> Version
}

struct FetchVersionUseCase: FetchVersionUseCaseProtocol {
    
    // MARK: - Interface
    
    func execute() async -> Version {
        await repository.fetchVersion()
    }
    
    // MARK: - Attribute
    
    private let repository: VersionRepositoryProtocol
    
    // MARK: - Initializer
    
    init(repository: VersionRepositoryProtocol = VersionRepository()) {
        self.repository = repository
    }
}
