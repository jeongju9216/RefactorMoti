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
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Life Cycle
    
    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        cancellables = []
        super.tearDown()
    }
    
    func test_input으로_로그인_시도가_들어오면_output은_항상_true() throws {
        // given
        let expectation = XCTestExpectation()
        let viewModel = LoginViewModel()
        let input = LoginViewModel.Input()
        viewModel.bind(input: input)
        input.login.send()
        
        // when
        var isSuccessLogin: Bool = false
        viewModel.output.isSuccessLogin
            .sink(receiveCompletion: { completion in
                XCTFail()
            }, receiveValue: { value in
                isSuccessLogin = value
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(isSuccessLogin)
    }
}
