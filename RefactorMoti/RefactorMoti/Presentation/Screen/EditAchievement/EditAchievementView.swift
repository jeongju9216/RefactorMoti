//
//  EditAchievementView.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/26/24.
//

import UIKit
import FlexLayout
import PinLayout
import JeongDesignSystem

final class EditAchievementView: BaseView {
    
    // MARK: - UI
    
    private let flexBox = UIView()
    private let closeButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: Image.close)
        configuration.preferredSymbolConfigurationForImage = .init(pointSize: Size.buttonPointSize, weight: .bold)
        configuration.baseForegroundColor = JDColor.darkGray
        return UIButton(configuration: configuration)
    }()
    private let previewView: UIView = {
        let view = UIView()
        view.backgroundColor = JDColor.gray
        return view
    }()
    
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        flexBox.pin.all(pin.safeArea)
        flexBox.flex.layout()
        previewView.pin.hCenter().vCenter(-Size.systemButton.height)
    }
    
    
    // MARK: - Setup
    
    override func setUpSubview() {
        super.setUpSubview()
        addSubview(flexBox)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        flexBox.flex.define { flex in
            flex.addItem().direction(.row).define { flex in
                flex.addItem().grow(1)
                flex.addItem(closeButton).size(Size.systemButton)
            }
            
            flex.addItem().grow(1).define { flex in
                flex.addItem(previewView).width(100%).aspectRatio(1)
            }
        }
    }
}


// MARK: - Constant

private extension EditAchievementView {
    
    enum Size {
        
        static let buttonPointSize = 21.0
        static let systemButton = CGSize(width: 44, height: 44)
    }
    
    enum Image {
        
        static let close = "xmark.circle"
    }
}
