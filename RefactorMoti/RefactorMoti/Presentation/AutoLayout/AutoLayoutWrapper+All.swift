//
//  AutoLayoutWrapper+All.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/27/24.
//

import UIKit

extension AutoLayoutWrapper {

    // MARK: - All

    @discardableResult
    func all(equalTo basedView: UIView, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: basedView.topAnchor, constant: constant),
            view.bottomAnchor.constraint(equalTo: basedView.bottomAnchor, constant: -constant),
            view.leftAnchor.constraint(equalTo: basedView.leftAnchor, constant: constant),
            view.rightAnchor.constraint(equalTo: basedView.rightAnchor, constant: -constant)
        ])
        return self
    }
    
    @discardableResult
    func all(equalTo safeAreaGuide: UILayoutGuide, constant: CGFloat = 0) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: constant),
            view.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -constant),
            view.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: constant),
            view.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -constant)
        ])
        return self
    }
}
