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
        cancellables.forEach { $0.cancel() }
        cancellables = []
        super.tearDown()
    }
    
    
    // MARK: - Test
    
    func test_viewDidLoad가_send될_때_버전_정보를_가져오면_nil이_아니다() throws {
        // given
        let expectation = XCTestExpectation()
        let usecase = FetchVersionUseCaseStub(current: "1.0.0")
        let viewModel = LaunchViewModel(fetchVersionUseCase: usecase)
        let input = LaunchViewModel.Input()
        viewModel.bind(input: input)
        
        // when
        var version: String? = nil
        viewModel.output.currentVersion
            .sink { value in
                version = value
                expectation.fulfill()
            }
            .store(in: &cancellables)

        input.viewDidLoad.send()

        // then
        wait(for: [expectation], timeout: 5)
        
        XCTAssertNotNil(version)
        XCTAssertEqual(version, "1.0.0")
    }
    
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
        viewModel.output.isNeedForcedUpdate
            .sink { value in
                isNeedForcedUpdate = value
                expectation.fulfill()
            }
            .store(in: &cancellables)

        input.viewDidLoad.send()

        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(isNeedForcedUpdate)
    }
    
    func test_given_현재버전과_강제업데이트버전이_존재할_때_when_현재버전이_강제업데이트버전과_같다면_then_true_launch가_가능하다() throws {
        // given
        let expectation = XCTestExpectation()
        let usecase = FetchVersionUseCaseStub(current: "1.0.0", forced: "1.0.0")
        let viewModel = LaunchViewModel(fetchVersionUseCase: usecase)
        let input = LaunchViewModel.Input()
        viewModel.bind(input: input)
        
        // when
        var canLaunch = false
        viewModel.output.canLaunch
            .sink { value in
                canLaunch = value
                expectation.fulfill()
            }
            .store(in: &cancellables)

        input.viewDidLoad.send()
        
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(canLaunch)
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
        viewModel.output.canLaunch
            .sink { value in
                canLaunch = value
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.viewDidLoad.send()
        
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(canLaunch)
    }
    
    // MARK: 자동 로그인
    
    func test_앱을_시작했을_때_저장된_계정정보가_있으면_canAutoLogin_이_true() throws { }
    
    func test_앱을_시작했을_때_저장된_계정정보가_없으면_canAutoLogin_이_false() throws { }
    
    func test_자동로그인을_시도했을_때_로그인에_성공하면_isSuccessLogin이_true() throws { }
    
    func test_자동로그인을_시도했을_때_로그인에_실패하면_isSuccessLogin이_false() throws { }
}
