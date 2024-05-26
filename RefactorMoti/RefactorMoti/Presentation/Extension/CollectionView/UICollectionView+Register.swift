//
//  UICollectionView+Register.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit

extension UICollectionView {
    
    // MARK: - UICollectionViewCell
    
    func register<T: UICollectionViewCell>(_ cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath)
        guard let cell = cell as? T else {
            return .init()
        }
        return cell
    }
    
    // MARK: - UICollectionReusableView
    
    func register<T: UICollectionReusableView>(_ view: T.Type, forSupplementaryViewOfKind elementKind: String) {
        register(
            view,
            forSupplementaryViewOfKind: elementKind,
            withReuseIdentifier: view.identifier
        )
    }
    
    func dequeue<T: UICollectionReusableView>(_ view: T.Type, ofKind elementKind: String, for indexPath: IndexPath) -> T {
        let view = dequeueReusableSupplementaryView(
            ofKind: elementKind,
            withReuseIdentifier: view.identifier,
            for: indexPath
        )
        guard let view = view as? T else {
            return .init()
        }
        return view
    }
}
