//
//  FirebaseStorage.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/23/24.
//

import Foundation
import Firebase
import FirebaseAuth

final class FirebaseStorage: FirebaseStorageProtocol {
    
    // MARK: - Interface
    
    static let shared = FirebaseStorage()
    
    // MARK: Configure
    
    func configure() {
        guard firebaseRef == nil else {
            return
        }
        
        FirebaseApp.configure()
        firebaseRef = Database.database().reference()
    }
    
    // MARK: Version
    
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
    
    // MARK: Category
    
    func createDefaultCategories() async -> Bool {
        guard await isNeedCreateDefaultCategories() else {
            return true
        }
        
        for category in Constant.defaultCategories {
            if await addCategory(name: category) == nil {
                return false
            }
        }
        return true
    }
    
    func addCategory(name: String) async -> CategoryItem? {
        guard let categoryRef = userRef?.child(Path.category),
              let autoID = categoryRef.childByAutoId().key else {
            return nil
        }
        
        let newCategoryItem = CategoryItem(id: autoID, name: name)
        let information = newCategoryItem.toInformation()
        do {
            try await categoryRef.child(autoID).setValue(information)
            return newCategoryItem
        } catch {
            return nil
        }
    }
    
    func fetchCategories() async throws -> [CategoryItem] {
        let categorySnapshot = try await fetchSortedDataSnapshot(from: Path.category)
        return categorySnapshot.children.compactMap { child in
            guard let snapshot = child as? DataSnapshot,
                  let information = snapshot.value as? [String: Any] else {
                return nil
            }
            return CategoryItem(information: information)
        }
    }
    
    // MARK: Achievement
    
    func fetchAllAchievement() async throws -> [Achievement] {
        []
    }
    
    
    // MARK: - Attribute
    
    private var firebaseRef: DatabaseReference?
    private var userRef: DatabaseReference? {
        guard let user = Auth.auth().currentUser else {
            return nil
        }
        
        return firebaseRef?.child(user.uid)
    }
    
    
    // MARK: - Initializer
    
    private init() { }
    
    private func isNeedCreateDefaultCategories() async -> Bool {
        guard let isExistData = try? await userRef?.child(Path.category).getData() else {
            return true
        }
        return isExistData.childrenCount < 2
    }
}


// MARK: - Fetch Data

private extension FirebaseStorage {
    
    func fetchDataSnapshot(from path: String) async throws -> DataSnapshot {
        guard let userRef else {
            throw FirebaseStorageError.nonexistUserReference
        }
        
        let ref = userRef.child(path)
        return try await withCheckedThrowingContinuation { continuation in
            ref.observeSingleEvent(of: .value, with: { snapshot in
                continuation.resume(returning: snapshot)
            }) { error in
                continuation.resume(throwing: error)
            }
        }
    }
    
    func fetchSortedDataSnapshot(
        from path: String,
        sortBy key: String = Path.createdAt
    ) async throws -> DataSnapshot {
        guard let userRef else {
            throw FirebaseStorageError.nonexistUserReference
        }
        
        let ref = userRef.child(path).queryOrdered(byChild: key)
        return try await withCheckedThrowingContinuation { continuation in
            ref.observeSingleEvent(of: .value, with: { snapshot in
                continuation.resume(returning: snapshot)
            }) { error in
                continuation.resume(throwing: error)
            }
        }
    }
}


// MARK: - Constant

private extension FirebaseStorage {
    
    enum Constant {
        
        // TODO: 로컬라이징
        static let defaultCategories = ["전체", "미설정"]
    }
    
    enum Path {
        
        static let category = "category"
        static let createdAt = "createdAt"
        static let achievement = "achievement"
    }
}

