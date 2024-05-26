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
    private let previewView: UIView = {
        let view = UIView()
        view.backgroundColor = JDColor.gray
        return view
    }()
    private let captureButton = CaptureButton()
    
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        flexBox.pin.all(pin.safeArea)
        flexBox.flex.layout()
        previewView.pin.hCenter().vCenter(-Size.close.height)
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
                flex.addItem(closeButton).size(Size.close)
            }
            
            flex.addItem().grow(1).define { flex in
                flex.addItem(previewView).width(100%).aspectRatio(1)
            }
            
            flex.addItem().direction(.row).justifyContent(.spaceAround).alignItems(.center).define { flex in
                flex.addItem().backgroundColor(.red).size(Size.close)
                flex.addItem(captureButton).size(Size.capture)
                flex.addItem().backgroundColor(.red).size(Size.close)
            }
        }
    }
}


// MARK: - Constant

private extension CaptureView {
    
    enum Size {
        
        static let closePointSize = 21.0
        static let close = CGSize(width: 44, height: 44)
        static let capture = CGSize(width: 75, height: 75)
    }
    
    enum Image {
        
        static let close = "xmark.circle"
    }
}
