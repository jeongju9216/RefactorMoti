//
//  AchievementRepositoryStub.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/2/24.
//

import Foundation
@testable import RefactorMoti

struct EmptyAchievementRepositoryStub: AchievementRepositoryProtocol {
    
    func fetchAchievements() async throws -> [Achievement] {
        []
    }
}

struct AchievementRepositoryStub: AchievementRepositoryProtocol {
    
    func fetchAchievements() async throws -> [Achievement] {
        (0..<10).map {
            Achievement(id: $0, userID: $0, imageURL: nil, categoryID: $0, title: "", createdAt: Date())
        }
    }
}
