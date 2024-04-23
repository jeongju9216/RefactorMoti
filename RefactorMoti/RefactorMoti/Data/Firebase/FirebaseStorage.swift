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
        guard firebaseRef == nil else {
            return
        }
        
        FirebaseApp.configure()
        firebaseRef = Database.database().reference()
    }
    
    func fetchVersion() async -> Version? {
        let snapshot = try? await firebaseRef?.child("version").getData()
        let snapData = snapshot?.value as? [String: String]
        
        let latest = snapData?["latest"] ?? "0.0.0"
        let forced = snapData?["forced"] ?? "0.0.0"
        
        return Version(latest: latest, forced: forced)
    }
    
    
    // MARK: - Attribute
    
    private var firebaseRef: DatabaseReference?
    
    
    // MARK: - Initializer
    
    private init() { }
}
