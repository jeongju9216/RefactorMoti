//
//  LoginView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/28/24.
//

import UIKit
import AuthenticationServices
import JeongDesignSystem

final class LoginView: BaseView {
    
    // MARK: - Interface
    
    var loginButtonDidTap: UIControl.ControlEventPublisher {
        loginButton.publisher(for: .touchUpInside)
    }
    
    
    // MARK: - UI
    
    private let motiIconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .appIconRound)
        return view
    }()
    private let loginButton = ASAuthorizationAppleIDButton(type: .default, style: .whiteOutline)
    
    
    // MARK: - Setup
    
    override func setUpSubview() {
        addSubview(motiIconImageView)
        addSubview(loginButton)
    }
    
    override func setUpConstraint() {
        motiIconImageView.atl
            .size(Size.appIconRound)
            .center(equalTo: safeAreaLayoutGuide)
        loginButton.atl
            .size(Metric.LoginButton.size)
            .centerX(equalTo: safeAreaLayoutGuide.centerXAnchor)
            .bottom(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Metric.LoginButton.offset)
    }
}


// MARK: - Constant

private extension LoginView {
    
    enum Metric {
        
        enum LoginButton {
            
            static let size = CGSize(width: 48 * 6.8, height: 48)
            static let offset: CGFloat = 20
        }
    }
    
    enum Size {
        
        static let appIconRound = CGSize(width: 120, height: 120)
    }
    
    enum Text {
        
        static let login = "로그인"
    }
}
