//
//  FetchCategoriesUseCaseTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/4/24.
//

import XCTest
@testable import RefactorMoti

final class FetchCategoriesUseCaseTests: XCTestCase {

    private let defaultCategories = [CategoryItem(id: "0", name: "전체"), CategoryItem(id: "1", name: "미설정")]
    private let customCategory = CategoryItem(id: "2", name: "음식")
    
    func test_기본_카테고리만_있을_때_fetchCategories_수행이_성공하면_기본_리스트를_반환한다() async throws { 
        // given
        let usecase = FetchCategoriesUseCase(repository: DefaultCategoryRepositoryStub())
        
        // when
        let categories = try? await usecase.execute()
        
        // then
        XCTAssertNotNil(categories)
        XCTAssertEqual(categories, defaultCategories)
    }
    
    func test_사용자가_추가한_카테고리가_있을_때_fetchCategories_수행에_성공하면_category_리스트를_반환한다() async throws {
        // given
        let usecase = FetchCategoriesUseCase(repository: CustomCategoryRepositoryStub())
        
        // when
        let categories = try? await usecase.execute()
        
        // then
        XCTAssertNotNil(categories)
        XCTAssertEqual(categories, defaultCategories + [customCategory])
    }
    
    func test_fetchCategories_수행에_실패하면_에러를_발생시킨다() async throws { }
}
