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
        viewModel.output.version
            .receive(on: RunLoop.main)
            .sink { [weak self] version in
                guard let self else { return }
                layoutView.update(currentVersion: version.current)
            }
            .store(in: &cancellables)
    }
}

