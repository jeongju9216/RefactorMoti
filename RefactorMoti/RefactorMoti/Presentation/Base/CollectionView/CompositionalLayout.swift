//
//  CompositionalLayout.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit

enum CompositionalLayout {
    
    static func configure(
        item: CompositionalLayoutItem,
        group: CompositionalLayoutGroup,
        section: CompositionalLayoutSection
    ) -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            section.configure(group: group.layout)
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

struct CompositionalLayoutSection {
    
    let orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior
    let header: NSCollectionLayoutBoundarySupplementaryItem?
    let footer: NSCollectionLayoutBoundarySupplementaryItem?
    
    init(
        orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none,
        header: NSCollectionLayoutBoundarySupplementaryItem? = nil,
        footer: NSCollectionLayoutBoundarySupplementaryItem? = nil
    ) {
        self.orthogonalScrollingBehavior = orthogonalScrollingBehavior
        self.header = header
        self.footer = footer
    }
    
    func configure(group: NSCollectionLayoutGroup) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = orthogonalScrollingBehavior
        section.boundarySupplementaryItems = [header, footer].compactMap { $0 }
        
        return section
    }
}
