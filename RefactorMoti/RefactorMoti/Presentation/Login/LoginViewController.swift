//
//  LoginViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/28/24.
//

import UIKit
import Combine

final class LoginViewController: LayoutViewController<LoginView> {
    
    // MARK: - Attribute
    
    private let viewModel = LoginViewModel()
    private let input = LoginViewModel.Input()
    private var output: LoginViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Binding
    
    override func setUpBinding() {
        layoutView.loginButtonDidTap
            .sink { [weak self] in
                guard let self else { return }
                input.login.send()
            }
            .store(in: &cancellables)
    }
}
