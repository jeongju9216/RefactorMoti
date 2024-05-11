//
//  LoginViewModelTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/29/24.
//

import XCTest
import Combine
@testable import RefactorMoti

final class LoginViewModelTests: XCTestCase {
    
    // MARK: - Attribute
    
    private var viewModel: LoginViewModel!
    private var input: LoginViewModel.Input!
    private var output: LoginViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Life Cycle
    
    override func setUp() {
        input = .init()
        cancellables = []
        super.setUp()
    }
    
    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        super.tearDown()
    }
    
    
    // MARK: - Test
    
    func test_login_input이_들어오고_기본_카테고리_생성이_성공하면_isSuccessLogin_output은_true() throws {
        // given
        viewModel = LoginViewModel(createDefaultCategoriesUseCase: CreateDefaultCategoriesUseCaseStub())
        viewModel.bind(input: input)
        let expectation = XCTestExpectation()
        
        // when
        var source: Bool?
        viewModel.output.isSuccessLogin
            .sink { isSuccessLogin in
                source = isSuccessLogin
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.login.send()
        
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(source)
        XCTAssertTrue(source!)
    }
    
    func test_login_input이_들어오고_기본_카테고리_생성이_실패하면_isSuccessLogin_output은_false() throws {
        // given
        viewModel = LoginViewModel(createDefaultCategoriesUseCase: FailedCreateDefaultCategoriesUseCaseStub())
        viewModel.bind(input: input)
        let expectation = XCTestExpectation()
        
        // when
        var source: Bool?
        viewModel.output.isSuccessLogin
            .sink { isSuccessLogin in
                source = isSuccessLogin
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.login.send()

        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(source)
        XCTAssertFalse(source!)
    }
}
