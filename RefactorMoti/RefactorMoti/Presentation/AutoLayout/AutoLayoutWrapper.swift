//
//  AutoLayoutWrapper.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

struct AutoLayoutWrapper {
    
    typealias Dimension = NSLayoutAnchor<NSLayoutDimension>
    typealias XAnchor = NSLayoutAnchor<NSLayoutXAxisAnchor>
    typealias YAnchor = NSLayoutAnchor<NSLayoutYAxisAnchor>
    
    let view: UIView
}

protocol AutoLayoutCompatible: UIView {

    var atl: AutoLayoutWrapper { get }
}

extension AutoLayoutCompatible {

    var atl: AutoLayoutWrapper {
        AutoLayoutWrapper(view: self)
    }
}

extension UIView: AutoLayoutCompatible { }
