//
//  FetchAchievementsUseCaseTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/3/24.
//

import XCTest
@testable import RefactorMoti

final class FetchAchievementsUseCaseTests: XCTestCase {

    func test_데이터가_있을_때_fetchAchievements_수행이_성공하면_Achievements를_반환한다() async {
        // given
        let usecase = FetchAchievementsUseCase(repository: AchievementRepositoryStub())
        
        // when
        let achievements = try? await usecase.execute()
        
        // then
        XCTAssertNotNil(achievements)
        XCTAssertEqual(achievements?.count, 10)
    }
    
    func test_데이터가_없을_때_fetchAchievements_수행이_성공하면_빈_배열을_반환한다() async { 
        // given
        let usecase = FetchAchievementsUseCase(repository: EmptyAchievementRepositoryStub())
        
        // when
        let achievements = try? await usecase.execute()
        
        // then
        XCTAssertNotNil(achievements)
        XCTAssertEqual(achievements?.count, 0)
    }

    func test_fetchAchievements_수행이_실패하면_에러를_발생시킨다() { }
}
