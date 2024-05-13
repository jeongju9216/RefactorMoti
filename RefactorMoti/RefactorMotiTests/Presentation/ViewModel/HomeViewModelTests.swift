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
    
    private let addCategoryUseCase = AddCategoryUseCase(repository: DefaultCategoryRepositoryStub())
    private let fetchCategoriesUseCase = FetchCategoriesUseCase(repository: DefaultCategoryRepositoryStub())
    private let addAchievementUseCase = AddAchievementUseCase(repository: AchievementRepositoryStub())
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
            addCategoryUseCase: addCategoryUseCase,
            fetchCategoriesUseCase: fetchCategoriesUseCase,
            addAchievementUseCase: addAchievementUseCase,
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
    
    func test_viewDidLoad가_input되면_첫_번째_카테고리를_output() throws {
        // given
        let expectation = XCTestExpectation()
        
        // when
        var source: IndexPath?
        output.selectedCategoryIndex
            .sink { indexPath in
                source = indexPath
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.viewDidLoad.send()
        
        // then
        wait(for: [expectation], timeout: 5)
        
        XCTAssertNotNil(source)
        XCTAssertEqual(source, IndexPath(row: 0, section: 0))
    }
    
    func test_addCategory가_input될_때_카테고리_추가에_성공하면_output은_새로운_카테고리_리스트() throws {
        // given
        let expectation = XCTestExpectation()
        let expectation2 = XCTestExpectation()
        let newCategory = CategoryItem(id: "99", name: "Test")
        let targetNewCategories = targetCategories + [newCategory]
        
        // when
        var source: Bool?
        var source2: [CategoryItem]?
        output.isAddedCategorySuccess
            .sink { isSuccessAddCategory in
                source = isSuccessAddCategory
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        output.categories
            .dropFirst()
            .sink { categories in
                source2 = categories
                expectation2.fulfill()
            }
            .store(in: &cancellables)
        
        input.viewDidLoad.send()
        input.addCategory.send("Test")
        
        // then
        wait(for: [expectation, expectation2], timeout: 5)
        
        XCTAssertNotNil(source)
        XCTAssertTrue(source!)
        XCTAssertNotNil(source2)
        XCTAssertEqual(source2, targetNewCategories)
    }
    
    func test_addCategory가_input될_때_카테고리_추가에_실패하면_output은_false() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_output은_true() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_현재_카테고리는_전체_카테고리가_된다() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_삭제된_카테고리의_게시글은_미설정_카테고리가_된다() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_실패하면_output은_false() throws { }
    
    func test_selectCategory가_input될_때_유효한_index면_currentCategory_output은_선택한_카테고리() throws {
        // given
        let expectation1 = XCTestExpectation()
        let expectation2 = XCTestExpectation()
        let targetIndex = 1
        let targetIndexPath = IndexPath(row: targetIndex, section: 0)
        
        // when
        var source: IndexPath?
        output.categories
            .sink { _ in
                expectation1.fulfill()
            }
            .store(in: &cancellables)
        
        output.selectedCategoryIndex
            .sink { indexPath in
                source = indexPath
                expectation2.fulfill()
            }
            .store(in: &cancellables)
        
        input.viewDidLoad.send()
        wait(for: [expectation1], timeout: 5)
        input.selectCategoryCell.send(targetIndexPath)
        
        // then
        wait(for: [expectation2], timeout: 5)
        
        XCTAssertNotNil(source)
        XCTAssertEqual(source, targetIndexPath)
    }
    
    
    // MARK: - Achievement
    
    func test_viewDidLoad가_input되면_사진_리스트를_output() throws { 
        // given
        let expectation = XCTestExpectation()
        
        // when
        var source: [Achievement]?
        output.achievements
            .sink { achievements in
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
    
    func test_addAchievement가_input됐을_때_추가에_성공하면_output은_true() async throws {
        // given
        let expectation = XCTestExpectation()
        let requestValue = AchievementRequestValue(
            title: "",
            body: "",
            category: .init(id: "", name: ""),
            imageURLString: ""
        )
        
        // when
        var source: Bool?
        output.isAddedAchievementSuccess
            .sink { isAddedAchievementSuccess in
                source = isAddedAchievementSuccess
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.addAchievement.send(requestValue)
        
        // then
        wait(for: [expectation], timeout: 5)
        
        XCTAssertNotNil(source)
        XCTAssertTrue(source!)
    }
    
    func test_addAchievement가_input됐을_때_추가에_실패하면_output은_false() async throws {
        // given
        let expectation = XCTestExpectation()
        let addAchievementUseCase = AddAchievementUseCase(repository: EmptyAchievementRepositoryStub())
        viewModel = HomeViewModel(
            addCategoryUseCase: addCategoryUseCase,
            fetchCategoriesUseCase: fetchCategoriesUseCase,
            addAchievementUseCase: addAchievementUseCase,
            fetchAchievementsUseCase: fetchAchievementsUseCase
        )
        viewModel.bind(input: input)
        let requestValue = AchievementRequestValue(
            title: "",
            body: "",
            category: .init(id: "", name: ""),
            imageURLString: ""
        )
        
        // when
        var source: Bool?
        output.isAddedAchievementSuccess
            .sink { isAddedAchievementSuccess in
                source = isAddedAchievementSuccess
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.addAchievement.send(requestValue)
        
        // then
        wait(for: [expectation], timeout: 5)
        
        XCTAssertNotNil(source)
        XCTAssertFalse(source!)
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
