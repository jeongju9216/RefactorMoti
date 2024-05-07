//
//  CategoryCollectionViewCell.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit
import JeongDesignSystem

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Interface
    
    override var isSelected: Bool {
        didSet {
            isSelected ? selected() : deselected()
        }
    }
    
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
        setUpAttribute()
        setUpSubview()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        deselected()
    }
    
    
    // MARK: - Setup
    
    private func setUpAttribute() {
        clipsToBounds = true
        layer.cornerRadius = Metric.cornerRadius
        layer.borderWidth = Metric.borderWidth
        layer.borderColor = JDColor.primary.color.cgColor
        deselected()
    }
    
    private func setUpSubview() {
        addSubview(label)
    }
    
    private func setUpConstraint() {
        label.atl
            .centerY(equalTo: self.centerYAnchor)
            .horizontal(equalTo: self, constant: Metric.horizontalOffset)
    }
    
    private func selected() {
        backgroundColor = JDColor.primary.color
        label.textColor = JDColor.background.color
    }
    
    private func deselected() {
        backgroundColor = JDColor.background.color
        label.textColor = JDColor.primary.color
    }
}


// MARK: - Constant

private extension CategoryCollectionViewCell {
    
    enum Metric {
        
        static let horizontalOffset = 10.0
        static let cornerRadius = 10.0
        static let borderWidth = 1.0
    }
}
