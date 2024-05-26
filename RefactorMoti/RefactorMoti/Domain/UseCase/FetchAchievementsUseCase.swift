//
//  FetchAchievementsUseCase.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/3/24.
//

import Foundation

protocol FetchAchievementsUseCaseProtocol {
    
    func execute() async throws -> [Achievement]
}

struct FetchAchievementsUseCase: FetchAchievementsUseCaseProtocol {
    
    // MARK: - Interface
    
    func execute() async throws -> [Achievement] {
        try await repository.fetchAchievements()
    }
    
    // MARK: - Attribute
    
    private let repository: AchievementRepositoryProtocol
    
    // MARK: - Initializer
    
    init(repository: AchievementRepositoryProtocol = AchievementRepository()) {
        self.repository = repository
    }
}
