//
//  FirebaseStorageProtocol.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/24/24.
//

import Foundation

protocol FirebaseStorageProtocol {
    
    func configure()
    func fetchVersion() async -> (latest: String, forced: String)?
    func createDefaultCategories() async -> Bool
}
