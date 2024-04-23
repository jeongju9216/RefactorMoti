//
//  LaunchTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/23/24.
//

import XCTest

final class LaunchTests: XCTestCase {
    
    // MARK: 현재 버전과 최신 버전 비교 결과
    
    func test_given_현재버전과_최신버전이_존재할_때_when_현재버전이_최신버전_미만이라면_then_true_업데이트가_가능하다() throws { }
    
    func test_given_현재버전과_최신버전이_존재할_때_when_현재버전과_최신버전이_같다면_then_false_최신_버전이다() throws { }
    
    // MARK: 현재 버전과 강제 업데이트 버전 비교 결과
    
    func test_given_현재버전과_강제업데이트버전이_존재할_때_when_현재버전이_강제업데이트버전_이하라면_then_false_업데이트가_필요하다() throws { }
    
    func test_given_현재버전과_강제업데이트버전이_존재할_때_when_현재버전이_강제업데이트버전_초과라면_then_true_launch가_가능하다() throws { }
}
