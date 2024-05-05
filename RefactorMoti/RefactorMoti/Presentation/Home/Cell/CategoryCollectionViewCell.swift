//
//  CategoryCollectionViewCell.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit
import Combine

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Interface
    
    func configure(with category: CategoryItem) {
        label.text = category.name
    }
    
    
    // MARK: - UI
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubview()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    private func setUpSubview() {
        addSubview(label)
    }
    
    private func setUpConstraint() {
        label.atl
            .centerY(equalTo: self.centerYAnchor)
            .horizontal(equalTo: self, constant: Metric.horizontalOffset)
    }
}


// MARK: - Constant

private extension CategoryCollectionViewCell {
    
    enum Metric {
        
        static let horizontalOffset = 10.0
    }
}
