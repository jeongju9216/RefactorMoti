//
//  CategoryRepositoryStub.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 5/4/24.
//

import Foundation
@testable import RefactorMoti

struct DefaultCategoryRepositoryStub: CategoryRepositoryProtocol {
    
    private(set) var categories: [CategoryItem] = [
        CategoryItem(id: 0, name: "전체"),
        CategoryItem(id: 1, name: "미설정")
    ]
    
    func fetchCategories() async throws -> [CategoryItem] {
        categories
    }
    
    func addCategory(_ category: CategoryItem) async -> Bool {
        var mutable = categories
        mutable.append(category)
        return true
    }
    
    func createDefaultCategories() async -> Bool {
        return true
    }
}

struct CustomCategoryRepositoryStub: CategoryRepositoryProtocol {
    
    private(set) var categories: [CategoryItem] = [
        CategoryItem(id: 0, name: "전체"),
        CategoryItem(id: 1, name: "미설정"),
        CategoryItem(id: 2, name: "음식")
    ]
    
    func fetchCategories() async throws -> [CategoryItem] {
        categories
    }
    
    func addCategory(_ category: CategoryItem) async -> Bool {
        var mutable = categories
        mutable.append(category)
        return true
    }
    
    func createDefaultCategories() async -> Bool {
        return true
    }
}
