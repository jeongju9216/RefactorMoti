//
//  LaunchView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit
import PinLayout

final class LaunchView: BaseView {
    
    // MARK: - Interface
    
    func update(currentVersion: String) {
        versionLabel.text = currentVersion
        versionLabel.pin.sizeToFit()
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
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        motiIconImageView.pin.center().size(Size.appIconRound)
        versionLabel.pin.bottom(pin.safeArea).hCenter()
            .marginBottom(Metric.VersionLabel.bottomOffset)
            .sizeToFit()
    }
    
    // MARK: - Setup
    
    override func setUpSubview() {
        addSubview(motiIconImageView)
        addSubview(versionLabel)
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
