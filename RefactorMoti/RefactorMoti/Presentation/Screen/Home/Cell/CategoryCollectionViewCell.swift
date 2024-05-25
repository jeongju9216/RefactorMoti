//
//  CategoryCollectionViewCell.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit
import JeongDesignSystem
import PinLayout

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Interface
    
    override var isSelected: Bool {
        didSet {
            isSelected ? selected() : deselected()
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        autoSizeThatFits(size, layoutClosure: setUpConstraints)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        deselected()
    }
    
    
    // MARK: - Setup
    
    private func setUpAttribute() {
        jd.cornerRadius(.small)
        layer.borderWidth = Metric.borderWidth
        deselected()
    }
    
    private func setUpConstraints() {
        label.pin.center().marginHorizontal(Metric.horizontalOffset).sizeToFit()
    }
    
    private func setUpSubview() {
        addSubview(label)
    }
    
    private func selected() {
        backgroundColor = Color.Selected.background
        layer.borderColor = Color.Selected.border.cgColor
        label.textColor = Color.Selected.label
    }
    
    private func deselected() {
        backgroundColor = Color.Deselected.background
        layer.borderColor = Color.Deselected.border.cgColor
        label.textColor = Color.Deselected.label
    }
}


// MARK: - Constant

private extension CategoryCollectionViewCell {
    
    enum Metric {
        
        static let horizontalOffset = 10.0
        static let borderWidth = 1.0
    }
    
    enum Color {
        
        enum Selected {
        
            static let background = JDColor.primary
            static let border = JDColor.primary
            static let label = UIColor.white
        }
        
        enum Deselected {
            
            static let background = JDColor.lightGray
            static let border = JDColor.gray
            static let label = UIColor.black
        }
    }
}
