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
        CategoryItem(id: "0", name: "전체"),
        CategoryItem(id: "1", name: "미설정")
    ]
    
    func createDefaultCategories() async -> Bool {
        true
    }
    
    func addCategory(name: String) async -> CategoryItem? {
        let newCategoryItem = CategoryItem(id: "99", name: name)
        var mutable = categories
        mutable.append(newCategoryItem)
        return newCategoryItem
    }
    
    func fetchCategories() async throws -> [CategoryItem] {
        categories
    }
}

struct CustomCategoryRepositoryStub: CategoryRepositoryProtocol {
    
    private(set) var categories: [CategoryItem] = [
        CategoryItem(id: "0", name: "전체"),
        CategoryItem(id: "1", name: "미설정"),
        CategoryItem(id: "2", name: "음식")
    ]
    
    func createDefaultCategories() async -> Bool {
        true
    }
    
    func addCategory(name: String) async -> CategoryItem? {
        let newCategoryItem = CategoryItem(id: "99", name: name)
        var mutable = categories
        mutable.append(newCategoryItem)
        return newCategoryItem
    }
    
    func fetchCategories() async throws -> [CategoryItem] {
        categories
    }
}
