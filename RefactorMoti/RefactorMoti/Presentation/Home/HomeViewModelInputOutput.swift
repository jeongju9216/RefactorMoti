//
//  HomeViewModelInputOutput.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation
import Combine

extension HomeViewModel {
    
    struct Input {
        
        let viewDidLoad: PassthroughSubject<Void, Never> = .init()
        let addCategory: PassthroughSubject<CategoryItem, Never> = .init()
        let selectCategoryCell: PassthroughSubject<IndexPath, Never> = .init()
    }
    
    struct Output {
        
        // MARK: Category
        
        let categories: CurrentValueSubject<[CategoryItem], Never> = .init([])
        let currentCategory: PassthroughSubject<CategoryItem, Never> = .init()
        let isAddedCategorySuccess: PassthroughSubject<Bool, Never> = .init()
        
        // MARK: Achievement
        
        let achievements: PassthroughSubject<[Achievement], Never> = .init()
    }
}

