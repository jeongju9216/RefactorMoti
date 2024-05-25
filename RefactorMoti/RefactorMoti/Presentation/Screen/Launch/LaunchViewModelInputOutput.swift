//
//  LaunchViewModelInputOutput.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/24/24.
//

import Foundation
import Combine

extension LaunchViewModel {
    
    struct Input {
        
        let viewDidLoad: PassthroughSubject<Void, Never> = .init()
        let tryAutoLogin: PassthroughSubject<Void, Never> = .init()
    }
    
    struct Output {
        
        let currentVersion: PassthroughSubject<String, Never> = .init()
        let canLaunch: PassthroughSubject<Bool, Never> = .init()
        let isNeedForcedUpdate: PassthroughSubject<Bool, Never> = .init()
        let isAutoLoginSuccess: PassthroughSubject<Bool, Never> = .init()
    }
}
