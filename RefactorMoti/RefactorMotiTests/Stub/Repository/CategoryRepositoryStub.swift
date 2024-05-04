//
//  CategoryRepositoryStub.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/4/24.
//

import Foundation
@testable import RefactorMoti

struct DefaultCategoryRepositoryStub: CategoryRepositoryProtocol {
    
    func fetchCategories() async throws -> [CategoryItem] {
        [
            CategoryItem(id: 0, name: "전체"), 
            CategoryItem(id: 1, name: "미설정")
        ]
    }
}

struct CustomCategoryRepositoryStub: CategoryRepositoryProtocol {
    
    func fetchCategories() async throws -> [CategoryItem] {
        [
            CategoryItem(id: 0, name: "전체"),
            CategoryItem(id: 1, name: "미설정"),
            CategoryItem(id: 2, name: "음식")
        ]
    }
}
