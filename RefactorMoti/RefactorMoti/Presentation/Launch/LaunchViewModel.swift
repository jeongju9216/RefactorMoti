//
//  LaunchViewModel.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/24/24.
//

import Foundation
import Combine

final class LaunchViewModel: ViewModelable {
    
    // MARK: - Attribute
    
    // UseCase
    private let fetchVersionUseCase: FetchVersionUseCaseProtocol
    private let autoLoginUseCase: AutoLoginUseCaseProtocol
    
    // Output
    let output = Output()
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Initializer
    
    init(
        fetchVersionUseCase: FetchVersionUseCaseProtocol = FetchVersionUseCase(),
        autoLoginUseCase: AutoLoginUseCaseProtocol = AutoLoginUseCase()
    ) {
        self.fetchVersionUseCase = fetchVersionUseCase
        self.autoLoginUseCase = autoLoginUseCase
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
        
        input.tryAutoLogin
            .sink { [weak self] in
                guard let self else { return }
                tryAutoLogin()
            }
            .store(in: &cancellables)
    }
}


// MARK: - Bind Action

private extension LaunchViewModel {
    
    func viewDidLoad() {
        Task {
            let version = await fetchVersionUseCase.execute()
            output.currentVersion.send(version.current)
            
            let compareResult = version.current.compare(version.forced, options: .numeric)
            let isNeedForcedUpdate = (compareResult == .orderedAscending)
            if isNeedForcedUpdate {
                output.isNeedForcedUpdate.send(true)
            } else {
                output.canLaunch.send(true)
            }
        }
    }
    
    func tryAutoLogin() {
        Task {
            let isAutoLoginSuccess = await autoLoginUseCase.execute()
            output.isAutoLoginSuccess.send(isAutoLoginSuccess)
        }
    }
}

