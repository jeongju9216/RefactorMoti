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
import Then

final class CaptureView: BaseView {
    
    // MARK: - Interface
    
    var closeButtonDidTap: UIControl.ControlEventPublisher {
        closeButton.publisher(for: .touchUpInside)
    }
    var captureButtonDidTap: UIControl.ControlEventPublisher {
        captureButton.publisher(for: .touchUpInside)
    }
    
    // MARK: - UI
    
    private let flexBox = UIView()
    private let closeButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: Image.close)
        configuration.preferredSymbolConfigurationForImage = .init(pointSize: Size.buttonPointSize, weight: .bold)
        configuration.baseForegroundColor = JDColor.darkGray
        $0.configuration = configuration
    }
    private let previewView = UIView().then {
        $0.backgroundColor = JDColor.gray
    }
    private let albumButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: Image.album)
        configuration.preferredSymbolConfigurationForImage = .init(pointSize: Size.buttonPointSize, weight: .bold)
        configuration.baseForegroundColor = JDColor.darkGray
        $0.configuration = configuration
    }
    private let captureButton = CaptureButton()
    private let cameraSwitchingButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: Image.cameraSwitching)
        configuration.preferredSymbolConfigurationForImage = .init(pointSize: Size.buttonPointSize, weight: .bold)
        configuration.baseForegroundColor = JDColor.darkGray
        $0.configuration = configuration
    }
    
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
            flex.addItem().direction(.row).define { flex in
                flex.addItem().grow(1)
                flex.addItem(closeButton).size(Size.systemButton)
            }
            
            flex.addItem().grow(1).marginTop(Metric.marginTop).define { flex in
                flex.addItem(previewView).width(100%).aspectRatio(1)
            }
            
            flex.addItem().direction(.row).justifyContent(.spaceAround).alignItems(.center).define { flex in
                flex.addItem(albumButton).size(Size.systemButton)
                flex.addItem(captureButton).size(Size.capture)
                flex.addItem(cameraSwitchingButton).size(Size.systemButton)
            }
        }
    }
}

// MARK: - Constant

private extension CaptureView {
    
    enum Size {
        
        static let buttonPointSize = 21.0
        static let systemButton = CGSize(width: 44, height: 44)
        static let capture = CGSize(width: 75, height: 75)
    }
    
    enum Metric {
        
        static let marginTop = 80.0
    }
    
    enum Image {
        
        static let close = "xmark.circle"
        static let album = "photo"
        static let cameraSwitching = "arrow.triangle.2.circlepath.camera"
    }
}
