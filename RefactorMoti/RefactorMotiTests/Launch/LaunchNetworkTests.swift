//
//  LaunchNetworkTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/23/24.
//

import XCTest
@testable import RefactorMoti

final class LaunchNetworkTests: XCTestCase {
    
    override class func setUp() {
        FirebaseStorage.shared.configure()
    }

    // MARK: 파이어베이스의 버전 정보
    
    func test_given_파이어베이스_저장소가_존재할_때_when_최신_버전을_가져오면_then_nil이_아니다() async throws {
        // given
        let storage = FirebaseStorage.shared
        
        // when
        let version = await storage.fetchVersion()?.latest
        
        // then
        XCTAssertNotNil(version)
    }
    
    func test_given_파이어베이스_저장소가_존재할_때_when_강제업데이트_버전을_가져오면_then_nil이_아니다() async throws {
        // given
        let storage = FirebaseStorage.shared
        
        // when
        let version = await storage.fetchVersion()?.forced
        
        // then
        XCTAssertNotNil(version)
    }
}
