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
    typealias AchievementDataSource = SingleDiffableDataSource<Achievement>
    
    func setUpCategoryDataSource(_ dataSource: CategoryDataSource) {
        self.categoryDataSource = dataSource
    }
    
    func setUpAchievementDataSource(_ dataSource: AchievementDataSource) {
        self.achievementDataSource = dataSource
    }
    
    
    // MARK: - Attribute
    
    private var categoryDataSource: CategoryDataSource?
    private var achievementDataSource: AchievementDataSource?
    
    // UseCase
    private let addCategoryUseCase: AddCategoryUseCaseProtocol
    private let fetchCategoriesUseCase: FetchCategoriesUseCaseProtocol
    private let addAchievementUseCase: AddAchievementUseCaseProtocol
    private let fetchAchievementsUseCase: FetchAchievementsUseCaseProtocol
    
    // Output
    let output = Output()
    private var cancellables: Set<AnyCancellable> = []
    
    private var categories: [CategoryItem] {
        output.categories.value
    }
    private var achievements: [Achievement] {
        output.achievements.value
    }
    
    
    // MARK: - Initializer
    
    init(
        addCategoryUseCase: AddCategoryUseCaseProtocol = AddCategoryUseCase(),
        fetchCategoriesUseCase: FetchCategoriesUseCaseProtocol = FetchCategoriesUseCase(),
        addAchievementUseCase: AddAchievementUseCaseProtocol = AddAchievementUseCase(),
        fetchAchievementsUseCase: FetchAchievementsUseCaseProtocol = FetchAchievementsUseCase()
    ) {
        self.addCategoryUseCase = addCategoryUseCase
        self.fetchCategoriesUseCase = fetchCategoriesUseCase
        self.addAchievementUseCase = addAchievementUseCase
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
        
        input.addCategory
            .sink { [weak self] categoryName in
                guard let self else { return }
                addCategory(name: categoryName)
            }
            .store(in: &cancellables)
        
        input.selectCategoryCell
            .sink { [weak self] indexPath in
                guard let self else { return }
                selectCategory(at: indexPath)
            }
            .store(in: &cancellables)
        
        input.addAchievement
            .sink { [weak self] achievementRequestValue in
                guard let self else { return }
                addAchievement(requestValue: achievementRequestValue)
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
    
    func addCategory(name: String) {
        Task {
            guard let addedCategoryItem = await addCategoryUseCase.execute(with: name) else {
                output.isAddedCategorySuccess.send(false)
                return
            }
            
            let newCategories = categories + [addedCategoryItem]
            categoryDataSource?.update(data: newCategories)
            
            output.isAddedCategorySuccess.send(true)
            output.categories.send(newCategories)
        }
    }
    
    func selectCategory(at indexPath: IndexPath) {
        guard indexPath.item < categories.count else {
            return
        }
        
        output.selectedCategoryIndex.send(indexPath)
    }
    
    func addAchievement(requestValue: AchievementRequestValue) {
        Task {
            guard let addedAchievement = await addAchievementUseCase.execute(requestValue: requestValue) else {
                output.isAddedAchievementSuccess.send(false)
                return
            }
            
            let newAchievements = achievements + [addedAchievement]
            achievementDataSource?.update(data: newAchievements)
            
            output.isAddedAchievementSuccess.send(true)
            output.achievements.send(newAchievements)
        }
    }
}


// MARK: - Action Method

private extension HomeViewModel {
    
    func fetchAllAchievements() {
        Task {
            let achievements = (try? await fetchAchievementsUseCase.execute()) ?? []
            output.achievements.send(achievements)
            
            achievementDataSource?.update(data: achievements)
        }
    }
    
    func fetchCategories() {
        Task {
            guard let categories = try? await fetchCategoriesUseCase.execute(),
                !categories.isEmpty else {
                // TODO: 에러 발생
                return
            }
            
            output.categories.send(categories)
            categoryDataSource?.update(data: categories)

            selectCategory(at: IndexPath(item: 0, section: 0))
        }
    }
}

