//
//  LoginViewModel.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import Foundation
import Combine

final class LoginViewModel: ViewModelable {
    
    // MARK: - Attribute
    
    // UseCase
    private let createDefaultCategoriesUseCase: CreateDefaultCategoriesUseCaseProtocol
    
    // Output
    let output: Output = Output()
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializer
    
    init(createDefaultCategoriesUseCase: CreateDefaultCategoriesUseCaseProtocol = CreateDefaultCategoriesUseCase()) {
        self.createDefaultCategoriesUseCase = createDefaultCategoriesUseCase
    }
}

// MARK: - Binding Interface

extension LoginViewModel {
    
    func bind(input: Input) {
        input.login
            .sink { [weak self] in
                guard let self else { return }
                login()
            }
            .store(in: &cancellables)
    }
}

// MARK: - Binding Action

private extension LoginViewModel {
    
    func login() {
        Task {
            let isSuccess = await createDefaultCategoriesUseCase.execute()
            output.isSuccessLogin.send(isSuccess)
        }
    }
}

