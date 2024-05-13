//
//  AddAchievementUseCase.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/13/24.
//

import Foundation

protocol AddAchievementUseCaseProtocol {
    
    func execute(requestValue: AchievementRequestValue) async -> Achievement?
}

struct AddAchievementUseCase: AddAchievementUseCaseProtocol {
    
    // MARK: - Interface
    
    func execute(requestValue: AchievementRequestValue) async -> Achievement? {
        await repository.addAchievement(requestValue: requestValue)
    }
    
    
    // MARK: - Attribute
    
    private let repository: AchievementRepositoryProtocol
    
    
    // MARK: - Initializer
    
    init(repository: AchievementRepositoryProtocol = AchievementRepository()) {
        self.repository = repository
    }
}
