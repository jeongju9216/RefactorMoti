//
//  UserRepositoryTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/12/24.
//

import XCTest
@testable import RefactorMoti

final class UserRepositoryTests: XCTestCase {

    func test_파이어베이스에_현재_유저_정보가_있으면_true를_반환한다() async throws {
        // given
        var stub = FirebaseStorageStub()
        stub.isExistUser = true
        let repository = UserRepository(storage: stub)
        
        // when
        let target = await repository.isExistUser()
        
        // then
        XCTAssertTrue(target)
    }
    
    func test_파이어베이스에_현재_유저_정보가_없으면_false를_반환한다() async throws {
        // given
        var stub = FirebaseStorageStub()
        stub.isExistUser = false
        let repository = UserRepository(storage: stub)
        
        // when
        let target = await repository.isExistUser()
        
        // then
        XCTAssertFalse(target)
    }
}
