//
//  LaunchViewModel.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/24/24.
//

import Foundation
import Combine

final class LaunchViewModel: LaunchViewModelProtocol {
    
    // MARK: - Attribute
    
    private let fetchVersionUseCase: FetchVersionUseCaseProtocol
    
    // MARK: Output
    
    let output = Output()
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Initializer
    
    init(fetchVersionUseCase: FetchVersionUseCaseProtocol = FetchVersionUseCase()) {
        self.fetchVersionUseCase = fetchVersionUseCase
    }
}


// MARK: - Bind Interface

extension LaunchViewModel {
    
    func bind(input: Input) {
        input.viewDidLoad
            .sink { [weak self] in
                guard let self else { return }
                viewDidLoad()
            }
            .store(in: &cancellables)
    }
}


// MARK: - Bind Action

private extension LaunchViewModel {
    
    func viewDidLoad() {
        Task {
            let version = await fetchVersionUseCase.execute()
            output.version.send(version)
            
            let compareResult = version.current.compare(version.forced, options: .numeric)
            if compareResult == .orderedDescending {
                output.canLaunch.send()
            } else {
                output.isNeedForcedUpdate.send()
            }
        }
    }
}

