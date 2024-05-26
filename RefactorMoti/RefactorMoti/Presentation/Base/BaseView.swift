//
//  BaseView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

class BaseView: UIView {
    
    // MARK: - Initializer
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setUpAttribute()
        setUpSubview()
        setUpConstraint()
        setUpBinding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    /// View의 Attribute 속성을 설정
    func setUpAttribute() { }
    
    /// View의 Subview를 설정
    func setUpSubview() { }
    
    /// View의 Subview Constraints를 설정
    func setUpConstraint() { }
    
    /// View의 Combine Binding을 설정
    func setUpBinding() { }
}
