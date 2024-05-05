//
//  HomeViewModel.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/4/24.
//

import Foundation
import Combine

final class HomeViewModel {
    
    // MARK: - Interface
    
    typealias CategoryDataSource = SingleDiffableDataSource<CategoryItem>
    
    func setupCategoryDataSource(_ dataSource: CategoryDataSource) {
        self.categoryDataSource = dataSource
    }
    
    
    // MARK: - Attribute
    
    private var categoryDataSource: CategoryDataSource?
    
    // MARK: UseCase
    
    private let fetchCategoriesUseCase: FetchCategoriesUseCaseProtocol
    private let fetchAchievementsUseCase: FetchAchievementsUseCaseProtocol
    
    // MARK: Output
    
    let output = Output()
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Initializer
    
    init(
        fetchCategoriesUseCase: FetchCategoriesUseCaseProtocol = FetchCategoriesUseCase(),
        fetchAchievementsUseCase: FetchAchievementsUseCaseProtocol = FetchAchievementsUseCase()
    ) {
        self.fetchCategoriesUseCase = fetchCategoriesUseCase
        self.fetchAchievementsUseCase = fetchAchievementsUseCase
    }
}

// MARK: - Binding Interface

extension HomeViewModel {
    
    func bind(input: Input) {
        input.viewDidLoad
            .sink { [weak self] in
                guard let self else { return }
                viewDidLoad()
            }
            .store(in: &cancellables)
    }
}

// MARK: - Binding Action

private extension HomeViewModel {
    
    func viewDidLoad() {
        fetchCategories()
        fetchAllAchievements()
    }
    
    func fetchAllAchievements() {
        Task {
            let achievements = (try? await fetchAchievementsUseCase.execute()) ?? []
            output.achievements.send(achievements)
        }
    }
    
    func fetchCategories() {
        Task {
            guard let categories = try? await fetchCategoriesUseCase.execute(),
                  let firstCategory = categories.first else {
                // TODO: 에러 발생
                return
            }
            
            output.categories.send(categories)
            output.currentCategory.send(firstCategory)
            
            categoryDataSource?.update(data: categories)
        }
    }
}

