//
//  HomeViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import UIKit
import Combine

final class HomeViewController: LayoutViewController<HomeView> {
    
    // MARK: - Attribute
    
    private let viewModel = HomeViewModel()
    private let input = HomeViewModel.Input()
    private var output: HomeViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.viewDidLoad.send()
    }
    
    
    // MARK: - Setup
    
    override func setUpBinding() {
        super.setUpBinding()
        viewModel.bind(input: input)
        setUpViewModelBinding()
    }
}


// MARK: - Binding ViewModel

private extension HomeViewController {

    private func setUpViewModelBinding() {
        output.categories
            .sink { [weak self] categories in
                guard let self else { return }
                print("categories: \(categories)") // swiftlint:disable:this all
            }
            .store(in: &cancellables)
    }
}

