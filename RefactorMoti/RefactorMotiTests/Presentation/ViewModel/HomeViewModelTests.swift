//
//  HomeViewModelTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/30/24.
//

import XCTest
import Combine
@testable import RefactorMoti

final class HomeViewModelTests: XCTestCase {
 
    // MARK: - Attribute
    
    private let fetchCategoriesUseCase = FetchCategoriesUseCase(repository: DefaultCategoryRepositoryStub())
    private let fetchAchievementsUseCase = FetchAchievementsUseCase(repository: AchievementRepositoryStub())
    
    private var targetCategories: [CategoryItem]!
    private var targetAchievements: [Achievement]!

    private var viewModel: HomeViewModel!
    private var input: HomeViewModel.Input!
    private var output: HomeViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []

    
    // MARK: - Life Cycle
    
    override func setUp() async throws {
        viewModel = HomeViewModel(
            fetchCategoriesUseCase: fetchCategoriesUseCase,
            fetchAchievementsUseCase: fetchAchievementsUseCase
        )
        input = .init()
        viewModel.bind(input: input)
        cancellables = []
        
        targetCategories = try await fetchCategoriesUseCase.execute()
        targetAchievements = try await fetchAchievementsUseCase.execute()
        try await super.setUp()
    }
    
    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        super.tearDown()
    }
    
    
    // MARK: - Category
    
    func test_viewDidLoad가_input되면_카테고리_리스트를_output() throws { 
        // given
        let expectation = XCTestExpectation()
        
        // when
        var source: [CategoryItem]?
        output.categories
            .sink { categories in
                source = categories
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.viewDidLoad.send()
        
        // then
        wait(for: [expectation], timeout: 5)
        
        XCTAssertNotNil(source)
        XCTAssertEqual(source, targetCategories)
    }
    
    func test_viewDidLoad가_input되면_현재_카테고리에_첫_번째_카테고리를_output() throws {
        // given
        let expectation = XCTestExpectation()
        
        // when
        var source: CategoryItem?
        output.currentCategory
            .sink { currentCategory in
                source = currentCategory
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.viewDidLoad.send()
        
        // then
        wait(for: [expectation], timeout: 5)
        
        XCTAssertNotNil(source)
        XCTAssertEqual(source, targetCategories.first)
    }
    
    func test_addCategory가_input될_때_카테고리_추가에_성공하면_output은_true() throws { }
    
    func test_addCategory가_input될_때_카테고리_추가에_실패하면_output은_false() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_output은_true() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_현재_카테고리는_전체_카테고리가_된다() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_삭제된_카테고리의_게시글은_미설정_카테고리가_된다() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_실패하면_output은_false() throws { }
    
    
    // MARK: - Achievement
    
    func test_viewDidLoad가_input되면_사진_리스트를_output() throws { 
        // given
        let expectation = XCTestExpectation()
        
        // when
        var source: [Achievement]?
        output.achievements
            .sink { [weak self] achievements in
                guard let self else { return }
                source = achievements
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.viewDidLoad.send()
        
        // then
        wait(for: [expectation], timeout: 5)

        XCTAssertNotNil(source)
        XCTAssertTrue(compareAchievement(source: source!, target: targetAchievements))
    }
    
    func test_refresh가_input되면_사진_리스트를_output() throws { }
    
    func test_deletePhoto가_input될_때_성공하면_output은_true() throws { }
    
    func test_deletePhoto가_input될_때_실패하면_output은_false() throws { }
    
    func test_selectCategory가_input되면_해당_카테고리의_사진_리스트를_output() throws { }
}


// MARK: - Achievement

private extension HomeViewModelTests {
    
    func compareAchievement(source: [Achievement], target: [Achievement]) -> Bool {
        guard source.count == target.count else {
            return false
        }
        
        for i in 0..<target.count {
            if source[i].id != target[i].id {
                return false
            }
        }
        return true
    }
}
