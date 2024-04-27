//
//  LaunchView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit
import SnapKit

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
        motiIconImageView.snp.makeConstraints {
            $0.size.equalTo(Size.appIconRound)
            $0.center.equalToSuperview()
        }
        versionLabel.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-Metric.VersionLabel.bottomOffset)
            $0.centerX.equalToSuperview()
        }
    }
}


// MARK: - Constant

private extension LaunchView {
    
    enum Metric {
        
        enum VersionLabel {
            
            static let bottomOffset = 20
        }
    }
    
    enum Size {
        
        static let appIconRound = CGSize(width: 120, height: 120)
    }
}
