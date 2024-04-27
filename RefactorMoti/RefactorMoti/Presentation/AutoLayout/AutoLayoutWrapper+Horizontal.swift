//
//  AutoLayoutWrapper+Horizontal.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

extension AutoLayoutWrapper {

    // MARK: - Horizontal

    @discardableResult
    func horizontal(equalTo basedView: UIView, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: basedView.leftAnchor, constant: constant).isActive = true
        view.rightAnchor.constraint(equalTo: basedView.rightAnchor, constant: -constant).isActive = true
        return self
    }
    
    @discardableResult
    func horizontal(equalTo safeAreaGuide: UILayoutGuide, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: constant).isActive = true
        view.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -constant).isActive = true
        return self
    }
    
    
    // MARK: - Left
    
    @discardableResult
    func left(equalTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func left(greaterThanOrEqualTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func left(lessThanOrEqualTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    
    // MARK: - Right
    
    @discardableResult
    func right(equalTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rightAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func right(greaterThanOrEqualTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func right(lessThanOrEqualTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
}
