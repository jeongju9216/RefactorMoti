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
        
        // Life Cycle
        let viewDidLoad: PassthroughSubject<Void, Never> = .init()
        
        // Category
        let addCategory: PassthroughSubject<String, Never> = .init()
        let selectCategoryCell: PassthroughSubject<IndexPath, Never> = .init()
    }
    
    struct Output {
        
        // Category
        let categories: CurrentValueSubject<[CategoryItem], Never> = .init([])
        let selectedCategoryIndex: PassthroughSubject<IndexPath, Never> = .init()
        let isAddedCategorySuccess: PassthroughSubject<Bool, Never> = .init()
        
        // Achievement
        let achievements: CurrentValueSubject<[Achievement], Never> = .init([])
    }
}

