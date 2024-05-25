//
//  AppleLoginError.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/11/24.
//

import Foundation

enum AppleLoginError: Error {
    
    case invalidCredential
    case invalidNonce
    case invalidIdentityToken
    case invalidUserID
}
