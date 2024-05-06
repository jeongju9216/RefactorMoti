//
//  CategoryRepositoryTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/4/24.
//

import XCTest
@testable import RefactorMoti

final class CategoryRepositoryTests: XCTestCase {
    
    private let defaultCategories = [CategoryItem(id: 0, name: "전체"), CategoryItem(id: 1, name: "미설정")]
    private let customCategory = CategoryItem(id: 2, name: "음식")
    
    
    // MARK: - Fetch Categories
    
    func test_기본_카테고리만_있을_때_fetchCategories_수행에_성공하면_기본_category_리스트를_반환한다() async throws {
        // given
        let repository = DefaultCategoryRepositoryStub()
        
        // when
        let categories = try? await repository.fetchCategories()
        
        // then
        XCTAssertNotNil(categories)
        XCTAssertEqual(categories, defaultCategories)
    }
    
    func test_사용자가_추가한_카테고리가_있을_때_fetchCategories_수행에_성공하면_category_리스트를_반환한다() async throws { 
        // given
        let repository = CustomCategoryRepositoryStub()
        
        // when
        let categories = try? await repository.fetchCategories()
        
        // then
        XCTAssertNotNil(categories)
        XCTAssertEqual(categories, defaultCategories + [customCategory])
    }
    
    func test_fetchCategories_수행에_실패하면_에러를_발생시킨다() async throws { }
    

    // MARK: - Add Category
    
    func test_addCategory에_성공하면_true를_반환한다() async throws {
        // given
        let repository = DefaultCategoryRepositoryStub()
        let category = CategoryItem(id: 3, name: "카테고리")
        
        // when
        let isSuccess = await repository.addCategory(category)
        
        // then
        XCTAssertTrue(isSuccess)
    }
}
