//
//  LaunchView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

final class LaunchView: BaseView {
    
    // MARK: - Interface
    
    func update(currentVersion: String) {
        versionLabel.text = currentVersion
    }
    
    
    // MARK: - UI
    
    private let motiIconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .appIconRound)
        return view
    }()
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = Text.waitingVersion
        return label
    }()
    
    
    // MARK: - Setup
    
    override func setUpSubview() {
        addSubview(motiIconImageView)
        addSubview(versionLabel)
    }
    
    override func setUpConstraint() {
        motiIconImageView.atl
            .size(Size.appIconRound)
            .center(equalTo: safeAreaLayoutGuide)
        
        versionLabel.atl
            .centerX(equalTo: safeAreaLayoutGuide.centerXAnchor)
            .bottom(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Metric.VersionLabel.bottomOffset)
    }
}


// MARK: - Constant

private extension LaunchView {
    
    enum Metric {
        
        enum VersionLabel {
            
            static let bottomOffset: CGFloat = 20
        }
    }
    
    enum Size {
        
        static let appIconRound = CGSize(width: 120, height: 120)
    }
    
    enum Text {
        
        static let waitingVersion = "버전을 가져오는 중"
    }
}
