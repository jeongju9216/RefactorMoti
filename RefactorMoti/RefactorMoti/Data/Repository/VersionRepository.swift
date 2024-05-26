//
//  VersionRepository.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/23/24.
//

import Foundation

struct VersionRepository: VersionRepositoryProtocol {
    
    // MARK: - Interface
    
    func fetchVersion() async -> Version {
        guard let (latestVersion, forcedVersion) = await firebaseStorage.fetchVersion(),
              let currentVersion = mainBundleInfomation?["CFBundleShortVersionString"] as? String
        else {
            return Constant.defaultVersion
        }
        
        return Version(
            current: currentVersion,
            latest: latestVersion,
            forced: forcedVersion
        )
    }
    
    // MARK: - Attribute
    
    private let firebaseStorage = FirebaseStorage.shared
    private let mainBundleInfomation = Bundle.main.infoDictionary
}

// MARK: - Constant

private extension VersionRepository {
    
    enum Constant {

        static let zero = "0.0.0"
        static let defaultVersion = Version(current: zero, latest: zero, forced: zero)
    }
}
