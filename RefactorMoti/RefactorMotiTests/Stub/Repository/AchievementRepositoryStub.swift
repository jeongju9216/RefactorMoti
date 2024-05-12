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
            Achievement(
                id: "\($0)",
                imageURL: URL(string: "https://picsum.photos/500"),
                category: CategoryItem(id: "\($0)", name: "카테고리\($0)"),
                title: "제목\($0)",
                createdAt: Date()
            )
        }
    }
}
