//
//  AddCategoryUseCaseTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/6/24.
//

import XCTest
@testable import RefactorMoti

final class AddCategoryUseCaseTests: XCTestCase {

    func test_카테고리_추가에_성공하면_true를_반환한다() async throws { 
        // given
        let useCase = AddCategoryUseCase(repository: DefaultCategoryRepositoryStub())
        let categoryName = "음식"
        
        // when
        let addedCategoryItem = await useCase.execute(with: categoryName)
        
        // then
        XCTAssertNotNil(addedCategoryItem)
    }
    
    func test_카테고리_추가에_실패하면_false를_반환한다() async throws { }
}
