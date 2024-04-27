//
//  AutoLayoutWrapper+Center.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

extension AutoLayoutWrapper {
    
    // MARK: - Center
    
    @discardableResult
    func center(equalTo basedView: UIView) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: basedView.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: basedView.centerYAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func center(equalTo safeAreaGuide: UILayoutGuide) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor).isActive = true
        return self
    }
    
    
    // MARK: - Center X
    
    @discardableResult
    func centerX(equalTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerX(greaterThanOrEqualTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerX(lessThanOrEqualTo anchor: XAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    
    // MARK: - Center Y
    
    @discardableResult
    func centerY(equalTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(greaterThanOrEqualTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(lessThanOrEqualTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
}
