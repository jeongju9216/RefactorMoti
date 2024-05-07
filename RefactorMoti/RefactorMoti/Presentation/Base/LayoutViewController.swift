//
//  BaseLayoutViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit
import JeongDesignSystem

class LayoutViewController<LayoutView: BaseView>: BaseViewController {
    
    // MARK: - Interface
    
    var layoutView: LayoutView {
        view as! LayoutView
    }
    
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = LayoutView()
    }
    
    
    // MARK: - Setup
    
    override func setUpAttribute() {
        super.setUpAttribute()
        view.backgroundColor = JDColor.background
    }
}
