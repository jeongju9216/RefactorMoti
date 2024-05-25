//
//  CaptureView.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/25/24.
//

import UIKit
import PinLayout

final class CaptureView: BaseView {
    
    // MARK: - UI
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Capture"
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.pin.all()
    }
    
    
    // MARK: - Setup
    
    override func setUpSubview() {
        super.setUpSubview()
        addSubview(label)
    }
}
