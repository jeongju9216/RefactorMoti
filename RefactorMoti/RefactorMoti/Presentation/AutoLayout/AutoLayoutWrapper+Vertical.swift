//
//  AutoLayoutWrapper+Vertical.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

extension AutoLayoutWrapper {
    
    // MARK: - Vertical
    
    @discardableResult
    func vertical(equalTo basedView: UIView, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: basedView.topAnchor, constant: constant).isActive = true
        view.bottomAnchor.constraint(equalTo: basedView.bottomAnchor, constant: -constant).isActive = true
        return self
    }
    
    @discardableResult
    func vertical(equalTo safeAreaGuide: UILayoutGuide, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: constant).isActive = true
        view.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -constant).isActive = true
        return self
    }
    
    // MARK: - Top
    
    @discardableResult
    func top(equalTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func top(greaterThanOrEqualTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func top(lessThanOrEqualTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    // MARK: - Bottom
    
    @discardableResult
    func bottom(equalTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(greaterThanOrEqualTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(lessThanOrEqualTo anchor: YAnchor, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
}
