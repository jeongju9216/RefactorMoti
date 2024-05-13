//
//  AchievementRepository.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/2/24.
//

import Foundation

struct AchievementRepository: AchievementRepositoryProtocol { 
    
    // MARK: - Interface
    
    func fetchAchievements() async throws -> [Achievement] {
        try await firebaseStorage.fetchAllAchievement()
    }
    
    func addAchievement(requestValue: AchievementRequestValue) async -> Achievement? {
        await firebaseStorage.addAchievement(requestValue: requestValue)
    }
    
    
    // MARK: - Attribute
    
    private let firebaseStorage: FirebaseStorageProtocol
    
    
    // MARK: - Initializer
    
    init(firebaseStorage: FirebaseStorageProtocol = FirebaseStorage.shared) {
        self.firebaseStorage = firebaseStorage
    }
}
