//
//  CaptureView.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/25/24.
//

import UIKit
import FlexLayout
import PinLayout
import JeongDesignSystem

final class CaptureView: BaseView {
    
    // MARK: - UI
    
    private let flexBox = UIView()
    private let closeButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: Image.close)
        configuration.preferredSymbolConfigurationForImage =  .init(pointSize: Size.closePointSize, weight: .bold)
        configuration.baseForegroundColor = JDColor.darkGray
        return UIButton(configuration: configuration)
    }()
    
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        flexBox.pin.all(pin.safeArea)
        flexBox.flex.layout()
    }
    
    
    // MARK: - Setup
    
    override func setUpSubview() {
        super.setUpSubview()
        addSubview(flexBox)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        flexBox.flex.define { flex in
            flex.direction(.row).define { flex in
                flex.addItem().grow(1)
                flex.addItem(closeButton).size(Size.close)
            }
        }
    }
}


// MARK: - Constant

private extension CaptureView {
    
    enum Size {
        
        static let closePointSize = 21.0
        static let close = CGSize(width: 44, height: 44)
    }
    
    enum Image {
        
        static let close = "xmark.circle"
    }
}
