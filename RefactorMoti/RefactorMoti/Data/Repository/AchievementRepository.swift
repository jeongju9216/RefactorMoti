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
    
    
    // MARK: - Attribute
    
    private let firebaseStorage: FirebaseStorageProtocol
    
    
    // MARK: - Initializer
    
    init(firebaseStorage: FirebaseStorageProtocol = FirebaseStorage.shared) {
        self.firebaseStorage = firebaseStorage
    }
}
