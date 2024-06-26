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
    
    // ViewModel
    private let viewModel = LoginViewModel()
    private let input = LoginViewModel.Input()
    private var output: LoginViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []
    
    // Apple Login
    private lazy var appleLoginRequester = AppleLoginRequester(viewController: self).then {
        $0.delegate = self
    }
    
    // MARK: - Setup
    
    override func setUpBinding() {
        viewModel.bind(input: input)
        setUpControlBinding()
        setUpViewModelBinding()
    }
    
    private func setUpControlBinding() {
        layoutView.loginButtonDidTap
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                appleLoginRequester.request()
            }
            .store(in: &cancellables)
    }
    
    private func setUpViewModelBinding() {
        let output = viewModel.output
        output.isSuccessLogin
            .receive(on: RunLoop.main)
            .sink { [weak self] isSuccessLogin in
                guard let self else { return }
                if isSuccessLogin {
                    moveToHomeViewController()
                } else {
                    // TODO: Alert 표시
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Move To HomeViewController

private extension LoginViewController {
    
    func moveToHomeViewController() {
        let tabBarVC = TabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}

// MARK: - AppleLoginRequesterDelegate

extension LoginViewController: AppleLoginRequester.Delegate {
    
    func appleLoginRequester(_ loginRequester: AppleLoginRequester, didLoginSuccess token: String) {
        input.login.send()
    }
    
    func appleLoginRequester(_ loginRequester: AppleLoginRequester, didLoginFailed error: any Error) {
        // TODO: Alert 표시
    }
}

