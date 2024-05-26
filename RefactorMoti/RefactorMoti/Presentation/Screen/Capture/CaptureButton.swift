//
//  CaptureButton.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/26/24.
//

import UIKit
import JeongDesignSystem
import PinLayout

final class CaptureButton: UIButton {

    // MARK: - UI
    
    private let circleView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.backgroundColor = Color.button
        view.layer.cornerRadius = Metric.smallSize.width / 2
        return view
    }()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        setUpAttributes()
        setUpActions()
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pin.size(Metric.size)
        circleView.pin.size(Metric.smallSize).center()
    }
    
    
    // MARK: - Setup
    
    private func setUpAttributes() {
        backgroundColor = JDColor.background
        layer.borderColor = Color.button.cgColor
        layer.borderWidth = Metric.borderWidth
        layer.cornerRadius = Metric.size.width / 2
    }
    
    private func setUpActions() {
        addTarget(self, action: #selector(didTouchDown), for: .touchDown)
        addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(didTouchUpOutside), for: .touchUpOutside)
    }
    
    private func setUpSubviews() {
        addSubview(circleView)
    }
}


// MARK: - Action

private extension CaptureButton {
    
    @objc
    func didTouchDown() {
        UIView.animate(withDuration: Animation.duration) {
            let scale = CGAffineTransform(scaleX: Animation.touchDownScale, y: Animation.touchDownScale)
            self.circleView.transform = scale
        }
    }
    
    @objc
    func didTouchUpInside() {
        UIView.animate(withDuration: Animation.duration) {
            self.circleView.transform = .identity
        }
    }
    
    @objc
    func didTouchUpOutside() {
        UIView.animate(withDuration: Animation.duration) {
            self.circleView.transform = .identity
        }
    }
}


// MARK: - Constant

private extension CaptureButton {
    
    enum Metric {
        
        static let size = CGSize(width: 75, height: 75)
        static let smallSize = CGSize(width: 60, height: 60)
        static let borderWidth = 6.0
    }
    
    enum Color {
        
        static let button = JDColor.primary
    }
    
    enum Animation {
        
        static let duration = 0.2
        static let touchDownScale = 0.9
    }
}

