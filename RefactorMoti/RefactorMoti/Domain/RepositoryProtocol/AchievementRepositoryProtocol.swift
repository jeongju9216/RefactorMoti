//
//  AchievementRepositoryProtocol.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/2/24.
//

import Foundation

protocol AchievementRepositoryProtocol {
    
    func addAchievement(requestValue: AchievementRequestValue) async -> Achievement?
    func fetchAchievements() async throws -> [Achievement]
}
