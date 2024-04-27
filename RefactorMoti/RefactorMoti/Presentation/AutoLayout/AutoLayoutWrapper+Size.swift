//
//  AutoLayoutWrapper+Size.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

extension AutoLayoutWrapper {

    // MARK: - Size
    
    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    
    // MARK: - Width
    
    @discardableResult
    func width(equalTo anchor: Dimension, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func width(_ constant: CGFloat) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    
    // MARK: - Height
    
    @discardableResult
    func height(equalTo anchor: Dimension, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(_ constant: CGFloat) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
}
