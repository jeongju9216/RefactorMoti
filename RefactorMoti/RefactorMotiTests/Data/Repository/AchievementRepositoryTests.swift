//
//  AchievementRepositoryTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/2/24.
//

import XCTest

final class AchievementRepositoryTests: XCTestCase {

    func test_fetchAchievements를_성공하면_achievements를_가져온다() throws { }
    
    func test_fetchAchievements를_성공하고_achievements가_빈_배열이면_결과가_empty이다() throws { }
    
    func test_fetchAchievements를_실패했을_때_statusCode가_200이_아니면_invalidStatusCode_에러를_발생시킨다() throws { }
    
    func test_fetchAchievements를_실패했을_때_decode를_실패했으면_failedResponseDecoding_에러를_발생시킨다() throws { }
}
