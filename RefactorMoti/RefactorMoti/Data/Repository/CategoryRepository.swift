//
//  CategoryRepository.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation

struct CategoryRepository: CategoryRepositoryProtocol {
    
    func fetchCategories() async throws -> [String] {
        [
            "전체",
            "미설정",
            "음식",
            "운동",
            "개발"
        ]
    }
}
