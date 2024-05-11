//
//  FirebaseStorageStub.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/24/24.
//

import Foundation
@testable import RefactorMoti

struct FirebaseStorageStub: FirebaseStorageProtocol {
    
    func configure() { }
    
    func fetchVersion() async -> (latest: String, forced: String)? {
        ("1.0.0", "1.0.0")
    }
    
    func createDefaultCategories() async -> Bool {
        true
    }
}
