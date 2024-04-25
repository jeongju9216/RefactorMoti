//
//  LaunchRepositoryTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/23/24.
//

import XCTest
@testable import RefactorMoti

final class LaunchRepositoryTests: XCTestCase {

    // MARK: 앱의 현재 정보
    
    func test_모든_버전_문자열은_nil이_아니다() async throws {
        // given
        let latestForcedVersion = await FirebaseStorageStub().fetchVersion()
        
        // when
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        // then
        XCTAssertNotNil(latestForcedVersion)
        XCTAssertNotNil(currentVersion)
    }
}

