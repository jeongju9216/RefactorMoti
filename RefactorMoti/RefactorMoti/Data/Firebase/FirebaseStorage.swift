//
//  FirebaseStorage.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/23/24.
//

import Foundation
import Firebase

final class FirebaseStorage {
    
    // MARK: - Interface
    
    static let shared = FirebaseStorage()
    
    func configure() {
        FirebaseApp.configure()
        firebaseRef = Database.database().reference()
    }
    
    
    // MARK: - Attribute
    
    private var firebaseRef: DatabaseReference?
    
    
    // MARK: - Initializer
    
    private init() { }
}
