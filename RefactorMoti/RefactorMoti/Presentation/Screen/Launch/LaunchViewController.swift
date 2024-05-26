//
//  LaunchViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit
import Combine

final class LaunchViewController: LayoutViewController<LaunchView> {
    
    // MARK: - Attribute
    
    private let viewModel = LaunchViewModel()
    private let input = LaunchViewModel.Input()
    private var output: LaunchViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.viewDidLoad.send()
    }
    
    // MARK: - Setup
    
    override func setUpBinding() {
        viewModel.bind(input: input)
        setUpViewModelBinding()
    }
}

// MARK: - Binding ViewModel

private extension LaunchViewController {
    
    func setUpViewModelBinding() {
        output.currentVersion
            .receive(on: RunLoop.main)
            .sink { [weak self] currentVersion in
                guard let self else { return }
                layoutView.update(currentVersion: currentVersion)
            }
            .store(in: &cancellables)
        
        output.canLaunch
            .receive(on: RunLoop.main)
            .sink { [weak self] canLaunch in
                guard let self else { return }
                if canLaunch {
                    input.tryAutoLogin.send()
                }
            }
            .store(in: &cancellables)
        
        output.isAutoLoginSuccess
            .receive(on: RunLoop.main)
            .sink { [weak self] isAutoLoginSuccess in
                guard let self else { return }
                if isAutoLoginSuccess {
                    moveToHomeViewController()
                } else {
                    moveToLoginViewController()
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Move To Next ViewController

private extension LaunchViewController {
    
    func moveToLoginViewController() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        dismiss(animated: false)
        present(loginVC, animated: false)
    }
    
    func moveToHomeViewController() {
        let tabBarVC = TabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        dismiss(animated: false)
        present(tabBarVC, animated: false)
    }
}
