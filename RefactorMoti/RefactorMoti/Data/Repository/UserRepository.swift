//
//  UserRepository.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/12/24.
//

import Foundation

struct UserRepository: UserRepositoryProtocol {
    
    // MARK: - Interface
    
    func isExistUser() async -> Bool {
        await storage.isExistUser()
    }
    
    
    // MARK: - Attribute
    
    private let storage: FirebaseStorageProtocol
    
    
    // MARK: - Initializer
    
    init(storage: FirebaseStorageProtocol = FirebaseStorage.shared) {
        self.storage = storage
    }
}
