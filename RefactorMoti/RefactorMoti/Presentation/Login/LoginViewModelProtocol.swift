//
//  LoginViewModelProtocol.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import Foundation
import Combine

extension LoginViewModel {
    
    struct Input {
        
        let login: PassthroughSubject<Void, Never> = .init()
    }
    
    struct Output {
        
        let isSuccessLogin: PassthroughSubject<Bool, Never> = .init()
    }
}
