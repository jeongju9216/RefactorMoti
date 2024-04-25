//
//  FirebaseStorage.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/23/24.
//

import Foundation
import Firebase

final class FirebaseStorage: FirebaseStorageProtocol {
    
    // MARK: - Interface
    
    static let shared = FirebaseStorage()
    
    func configure() {
        guard firebaseRef == nil else {
            return
        }
        
        FirebaseApp.configure()
        firebaseRef = Database.database().reference()
    }
    
    func fetchVersion() async -> (latest: String, forced: String)? {
        guard let snapshot = try? await firebaseRef?.child("version").getData(),
              let snapData = snapshot.value as? [String: String],
              let latest = snapData["latest"],
              let forced = snapData["forced"]
        else {
            return nil
        }
        
        return (latest, forced)
    }
    
    
    // MARK: - Attribute
    
    private var firebaseRef: DatabaseReference?
    
    
    // MARK: - Initializer
    
    private init() { }
}
