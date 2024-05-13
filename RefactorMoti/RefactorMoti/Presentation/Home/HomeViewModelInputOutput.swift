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
        
        // Achievement
        let addAchievement: PassthroughSubject<String, Never> = .init()
    }
    
    struct Output {
        
        // Category
        let categories: CurrentValueSubject<[CategoryItem], Never> = .init([])
        let selectedCategoryIndex: PassthroughSubject<IndexPath, Never> = .init()
        let isAddedCategorySuccess: PassthroughSubject<Bool, Never> = .init()
        
        // Achievement
        let achievements: PassthroughSubject<[Achievement], Never> = .init()
        let isAddedAchievementSuccess: PassthroughSubject<Bool, Never> = .init()
    }
}

