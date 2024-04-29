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
    
    let output: Output = Output()
    private var cancellables: Set<AnyCancellable> = []
    
    init() { }
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


// MARK: - Bind Action

private extension LoginViewModel {
    
    func login() {
        output.isSuccessLogin.send(true)
    }
}

