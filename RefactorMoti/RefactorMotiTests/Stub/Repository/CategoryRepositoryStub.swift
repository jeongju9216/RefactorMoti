//
//  CategoryRepositoryStub.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/4/24.
//

import Foundation
@testable import RefactorMoti

struct DefaultCategoryRepositoryStub: CategoryRepositoryProtocol {
    
    func fetchCategories() async throws -> [String] {
        ["전체", "미설정"]
    }
}

struct CustomCategoryRepositoryStub: CategoryRepositoryProtocol {
    
    func fetchCategories() async throws -> [String] {
        ["전체", "미설정", "음식"]
    }
}
