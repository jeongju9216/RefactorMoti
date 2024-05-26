//
//  LoginView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/28/24.
//

import UIKit
import AuthenticationServices
import JeongDesignSystem
import PinLayout

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
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        motiIconImageView.pin.center().size(Size.appIconRound)
        loginButton.pin.bottom(pin.safeArea).size(Metric.LoginButton.size).hCenter()
            .marginBottom(Metric.LoginButton.offset)
    }
    
    // MARK: - Setup
    
    override func setUpSubview() {
        addSubview(motiIconImageView)
        addSubview(loginButton)
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
