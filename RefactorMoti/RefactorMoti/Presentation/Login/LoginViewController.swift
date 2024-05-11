//
//  LoginViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/28/24.
//

import UIKit
import Combine
import CryptoKit
import AuthenticationServices

final class LoginViewController: LayoutViewController<LoginView> {
    
    // MARK: - Attribute
    
    // MARK: ViewModel
    
    private let viewModel = LoginViewModel()
    private let input = LoginViewModel.Input()
    private var output: LoginViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: Apple Login
    
    private lazy var appleLoginRequester: AppleLoginRequester? = {
        guard let window = view.window else {
            return nil
        }
        
        let appleLoginRequester = AppleLoginRequester(window: window)
        appleLoginRequester.delegate = self
        return appleLoginRequester
    }()
    
    
    // MARK: - Setup
    
    override func setUpBinding() {
        viewModel.bind(input: input)
        setUpControlBinding()
        setUpViewModelBinding()
    }
    
    private func setUpControlBinding() {
        layoutView.loginButtonDidTap
            .sink { [weak self] in
                guard let self else { return }
                appleLoginRequester?.request()
            }
            .store(in: &cancellables)
    }
    
    private func setUpViewModelBinding() {
        let output = viewModel.output
        output.isSuccessLogin
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
        let homeVC = HomeViewController()
        let navigationVC = UINavigationController(rootViewController: homeVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
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

