//
//  CompositionalLayout.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit

enum CompositionalLayout {
    
    static func configure(with section: CompositionalLayoutSection) -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            section.layout
        }
    }
}


// MARK: - CompositionalLayoutItem

final class CompositionalLayoutItem {
    
    // MARK: - Interface
    
    let layout: NSCollectionLayoutItem
    let size: NSCollectionLayoutSize
    
    func contentInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        layout.contentInsets = insets
        return self
    }
    
    
    // MARK: - Attribute
    
    private var contentInsets: NSDirectionalEdgeInsets?
    
    
    // MARK: - Initializer
    
    init(width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension) {
        self.size = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        self.layout = NSCollectionLayoutItem(layoutSize: size)
    }
}


// MARK: - CompositionalLayoutGroup

final class CompositionalLayoutGroup {
    
    // MARK: - Interface
    
    enum Direction {
        
        case vertical
        case horizontal
    }
    
    let layout: NSCollectionLayoutGroup
    let size: NSCollectionLayoutSize
    
    func contentInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        layout.contentInsets = insets
        return self
    }
    
    func edgeSpacing(_ edgeSpacing: NSCollectionLayoutEdgeSpacing) -> Self {
        layout.edgeSpacing = edgeSpacing
        return self
    }
    
    
    // MARK: - Initializer
    
    init(
        subitems: [NSCollectionLayoutItem],
        direction: Direction,
        size: NSCollectionLayoutSize
    ) {
        self.size = size
        self.layout = direction == .vertical
        ? NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: subitems)
        : NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: subitems)
    }
}


// MARK: - CompositionalLayoutSection

final class CompositionalLayoutSection {
    
    // MARK: - Interface
    
    let layout: NSCollectionLayoutSection
    
    func orthogonalScrollingBehavior(_ orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> Self {
        layout.orthogonalScrollingBehavior = orthogonalScrollingBehavior
        return self
    }
    
    func header(_ header: NSCollectionLayoutBoundarySupplementaryItem) -> Self {
        layout.boundarySupplementaryItems.append(header)
        return self
    }
    
    
    // MARK: - Initializer
    
    init(group: NSCollectionLayoutGroup) {
        layout = NSCollectionLayoutSection(group: group)
    }
}
