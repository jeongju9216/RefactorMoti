//
//  FetchVersionUseCase.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/24/24.
//

import Foundation

struct FetchVersionUseCase {
    
    // MARK: - Interface
    
    func execute() async -> Version {
        await repository.fetchVersion()
    }
    
    
    // MARK: - Attribute
    
    private let repository: VersionRepositoryProtocol
    
    
    // MARK: - Initializer
    
    init(repository: VersionRepositoryProtocol) {
        self.repository = repository
    }
}
