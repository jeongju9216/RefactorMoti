//
//  AchievementRepositoryTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/2/24.
//

import XCTest
@testable import RefactorMoti

final class AchievementRepositoryTests: XCTestCase {

    var repository: AchievementRepositoryProtocol!
        
    func test_10개의_아이템을_가져오는_fetchAchievements를_성공하면_achievements의_count는_10이다() async throws {
        // given
        let target = 10
        repository = AchievementRepositoryStub()
        
        // when
        let achievements: [Achievement] = try await repository.fetchAchievements()
        
        // then
        XCTAssertEqual(achievements.count, target)
    }
    
    func test_fetchAchievements를_성공하고_achievements가_빈_배열이면_결과가_empty이다() async throws {
        // given
        let target: [Achievement] = []
        repository = EmptyAchievementRepositoryStub()
        
        // when
        let achievements: [Achievement] = try await repository.fetchAchievements()
        
        // then
        XCTAssertEqual(achievements, target)
    }
        
    func test_fetchAchievements를_실패했을_때_decode를_실패했으면_failedDecodeResponse_에러를_발생시킨다() throws { }
}
