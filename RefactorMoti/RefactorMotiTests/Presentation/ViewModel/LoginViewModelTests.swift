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
        viewModel = LoginViewModel(createDefaultCategoriesUseCase: CreateDefaultCategoriesUseCaseStub())
        input = .init()
        viewModel.bind(input: input)
        cancellables = []
        super.setUp()
    }
    
    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        super.tearDown()
    }
    
    
    // MARK: - Test
    
    func test_input으로_로그인_시도가_들어오면_output은_항상_true() throws {
        // given
        let expectation = XCTestExpectation()
        
        // when
        var source: Bool = false
        viewModel.output.isSuccessLogin
            .sink { isSuccessLogin in
                source = isSuccessLogin
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        input.login.send()

        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(source)
    }
}
