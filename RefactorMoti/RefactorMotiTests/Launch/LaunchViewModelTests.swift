//
//  LaunchViewModelTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/23/24.
//

import XCTest
import Combine
@testable import RefactorMoti

final class LaunchViewModelTests: XCTestCase {
    
    // MARK: - Attribute
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Life Cycle
    
    override func tearDown() {
        super.tearDown()
        cancellables.forEach { $0.cancel() }
        cancellables = []
    }
    
    
    // MARK: - Test
    
    // MARK: 현재 버전과 강제 업데이트 버전 비교 결과
    
    func test_given_현재버전과_강제업데이트버전이_존재할_때_when_현재버전이_강제업데이트버전_미만이라면_then_업데이트가_필요하다() throws {
        // given
        let expectation = XCTestExpectation()
        let usecase = FetchVersionUseCaseStub(current: "1.0.0", forced: "2.0.0")
        let viewModel = LaunchViewModel(fetchVersionUseCase: usecase)
        let input = LaunchViewModel.Input()
        viewModel.bind(input: input)
        
        // when
        var isNeedForcedUpdate = false
        input.viewDidLoad.send()
        viewModel.output.isNeedForcedUpdate
            .sink {
                isNeedForcedUpdate = true
                expectation.fulfill()
            }
            .store(in: &cancellables)

        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(isNeedForcedUpdate)
    }
    
    func test_given_현재버전과_강제업데이트버전이_존재할_때_when_현재버전이_강제업데이트버전과_같다면_then_업데이트가_필요하다() throws {
        // given
        let expectation = XCTestExpectation()
        let usecase = FetchVersionUseCaseStub(current: "1.0.0", forced: "1.0.0")
        let viewModel = LaunchViewModel(fetchVersionUseCase: usecase)
        let input = LaunchViewModel.Input()
        viewModel.bind(input: input)
        
        // when
        var isNeedForcedUpdate = false
        input.viewDidLoad.send()
        viewModel.output.isNeedForcedUpdate
            .sink {
                isNeedForcedUpdate = true
                expectation.fulfill()
            }
            .store(in: &cancellables)

        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(isNeedForcedUpdate)
    }
    
    func test_given_현재버전과_강제업데이트버전이_존재할_때_when_현재버전이_강제업데이트버전_초과라면_then_true_launch가_가능하다() throws {
        // given
        let expectation = XCTestExpectation()
        let usecase = FetchVersionUseCaseStub(current: "2.0.0", forced: "1.0.0")
        let viewModel = LaunchViewModel(fetchVersionUseCase: usecase)
        let input = LaunchViewModel.Input()
        viewModel.bind(input: input)
        
        // when
        var canLaunch = false
        input.viewDidLoad.send()
        viewModel.output.canLaunch
            .sink {
                canLaunch = true
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(canLaunch)
    }
}
