//
//  AppleLoginRequester.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/11/24.
//

import Foundation
import AuthenticationServices
import CryptoKit
import FirebaseAuth

protocol AppleLoginRequesterDelegate: AnyObject {

    func appleLoginRequester(_ loginRequester: AppleLoginRequester, didLoginSuccess token: String)
    func appleLoginRequester(_ loginRequester: AppleLoginRequester, didLoginFailed error: Error)
}

enum LoginError: Error {
    
    case invalidCredential
    case invalidNonce
    case invalidIdentityToken
}

final class AppleLoginRequester: NSObject {
    
    // MARK: - Interface

    weak var delegate: AppleLoginRequesterDelegate?
    
    func request() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    
    // MARK: - Attribute

    private var window: UIWindow
    private var currentNonce: String?
    
    
    // MARK: - Initializer
    
    init(window: UIWindow) {
        self.window = window
    }
}


// MARK: - ASAuthorizationControllerDelegate

extension AppleLoginRequester: ASAuthorizationControllerDelegate {

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            delegate?.appleLoginRequester(self, didLoginFailed: LoginError.invalidCredential)
            return
        }
        
        guard let nonce = currentNonce else {
            delegate?.appleLoginRequester(self, didLoginFailed: LoginError.invalidNonce)
            return
        }
        
        guard let identityTokenData = appleIDCredential.identityToken,
              let identityToken = String(data: identityTokenData, encoding: .utf8)
        else {
            delegate?.appleLoginRequester(self, didLoginFailed: LoginError.invalidIdentityToken)
            return
        }
        
        firebaseLogin(identityToken: identityToken, nonce: nonce, credential: appleIDCredential)
    }
    
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {
        delegate?.appleLoginRequester(self, didLoginFailed: error)
    }
    
    private func firebaseLogin(identityToken: String, nonce: String, credential: ASAuthorizationAppleIDCredential) {
        // Initialize a Firebase credential, including the user's full name.
        let credential = OAuthProvider.appleCredential(
            withIDToken: identityToken,
            rawNonce: nonce,
            fullName: credential.fullName
        )
        
        // Sign in with Firebase.
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            guard let self else { return }
            guard error == nil else {
                delegate?.appleLoginRequester(self, didLoginFailed: error!)
                return
            }
            
            delegate?.appleLoginRequester(self, didLoginSuccess: authResult?.user.uid)
        }
    }
}


// MARK: - ASAuthorizationControllerPresentationContextProviding

extension AppleLoginRequester: ASAuthorizationControllerPresentationContextProviding {

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        window
    }
}


// MARK: - Nonce

private extension AppleLoginRequester {
    
    func randomNonceString(length: Int = 32) -> String {
        guard length > 0 else {
            return ""
        }
        
        var randomBytes: [UInt8] = Array(repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        let nonce = randomBytes.map { byte in
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}

