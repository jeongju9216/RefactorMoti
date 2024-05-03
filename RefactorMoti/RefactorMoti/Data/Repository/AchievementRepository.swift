//
//  AchievementRepository.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/2/24.
//

import Foundation

struct AchievementRepository: AchievementRepositoryProtocol { 
    
    func fetchAchievements() async throws -> [Achievement] {
        (0..<10).map {
            Achievement(
                id: $0,
                userID: $0,
                imageURL: URL(string: "https://picsum.photos/500"),
                categoryID: $0,
                title: "제목\($0)",
                createdAt: Date()
            )
        }
    }
}
