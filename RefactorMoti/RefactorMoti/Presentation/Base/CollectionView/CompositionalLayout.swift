//
//  CompositionalLayout.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit
// MARK: - CompositionalLayoutItem

final class CompositionalLayoutItem {
    
    // MARK: - Interface
    
    func configure() -> NSCollectionLayoutItem {
        let layout = NSCollectionLayoutItem(layoutSize: size)
        if let contentInsets {
            layout.contentInsets = contentInsets
        }
        return layout
    }
    
    func contentInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        contentInsets = insets
        return self
    }
    
    // MARK: - Attribute
    
    private let size: NSCollectionLayoutSize
    private var contentInsets: NSDirectionalEdgeInsets?
    
    // MARK: - Initializer
    
    init(size: NSCollectionLayoutSize) {
        self.size = size
    }
}

// MARK: - CompositionalLayoutGroup

final class CompositionalLayoutGroup {
    
    // MARK: - Interface

    func configure(verticalWith subitems: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        let layout = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: subitems)
        return applyOptions(at: layout)
    }
    
    func configure(horizontalWith subitems: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        let layout = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: subitems)
        return applyOptions(at: layout)
    }
    
    func contentInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        contentInsets = insets
        return self
    }
    
    func edgeSpacing(_ spacing: NSCollectionLayoutEdgeSpacing) -> Self {
        edgeSpacing = spacing
        return self
    }
    
    // MARK: - Attribute
    
    private let size: NSCollectionLayoutSize
    private var contentInsets: NSDirectionalEdgeInsets?
    private var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    
    // MARK: - Initializer
    
    init(size: NSCollectionLayoutSize) {
        self.size = size
    }
    
    private func applyOptions(at group: NSCollectionLayoutGroup) -> NSCollectionLayoutGroup {
        if let contentInsets {
            group.contentInsets = contentInsets
        }
        if let edgeSpacing {
            group.edgeSpacing = edgeSpacing
        }
        return group
    }
}

// MARK: - CompositionalLayoutSection

final class CompositionalLayoutSection {
    
    // MARK: - Interface
    
    func configure(with group: NSCollectionLayoutGroup) -> NSCollectionLayoutSection {
        let layout = NSCollectionLayoutSection(group: group)
        if !supplementaryItems.isEmpty {
            layout.boundarySupplementaryItems = supplementaryItems
        }
        if let orthogonalScrollingBehavior {
            layout.orthogonalScrollingBehavior = orthogonalScrollingBehavior
        }
        return layout
    }
    
    func append(supplementaryItem: NSCollectionLayoutBoundarySupplementaryItem) -> Self {
        supplementaryItems.append(supplementaryItem)
        return self
    }
    
    func orthogonalScrollingBehavior(_ orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> Self {
        self.orthogonalScrollingBehavior = orthogonalScrollingBehavior
        return self
    }
    
    // MARK: - Attribute
    
    private var supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem] = []
    private var orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior?
}
