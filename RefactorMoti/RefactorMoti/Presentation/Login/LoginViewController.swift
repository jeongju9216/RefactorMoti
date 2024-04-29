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
        viewModel.bind(input: input)
        setUpControlBinding()
        setUpViewModelBinding()
    }
    
    private func setUpControlBinding() {
        layoutView.loginButtonDidTap
            .sink { [weak self] in
                guard let self else { return }
                input.login.send()
            }
            .store(in: &cancellables)
    }
    
    private func setUpViewModelBinding() {
        let output = viewModel.output
        output.isSuccessLogin
            .sink { [weak self] isSuccessLogin in
                guard let self else { return }
                if isSuccessLogin {
                    // TODO: Home 화면으로 이동
                    print("Success Login") // swiftlint:disable:this all
                } else {
                    // TODO: Alert 표시
                }
            }
            .store(in: &cancellables)
    }
}
