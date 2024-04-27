//
//  LaunchView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

final class LaunchView: BaseView {
    
    // MARK: - UI
    
    private let motiIconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .appIconRound)
        return view
    }()
    private let versionLabel: UILabel = {
        let view = UILabel()
        view.text = "version"
        return view
    }()
    
    
    // MARK: - Setup
    
    override func setUpAttribute() {
        backgroundColor = .systemBackground
    }
    
    override func setUpSubview() {
        addSubview(motiIconImageView)
        addSubview(versionLabel)
    }
    
    override func setUpConstraint() {
        motiIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            motiIconImageView.widthAnchor.constraint(equalToConstant: Size.appIconRound.width),
            motiIconImageView.heightAnchor.constraint(equalToConstant: Size.appIconRound.height),
            motiIconImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            motiIconImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
        
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            versionLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            versionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Metric.VersionLabel.bottomOffset)
        ])
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
}
