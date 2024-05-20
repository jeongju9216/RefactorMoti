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
            let group = group.configure(item: item.layout)
            return section.configure(group: group)
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

struct CompositionalLayoutGroup {
    
    enum Direction {
        
        case vertical
        case horizontal
    }
    
    let direction: Direction
    let size: NSCollectionLayoutSize
    let count: Int
    let contentInsets: NSDirectionalEdgeInsets?
    let edgeSpacing: NSCollectionLayoutEdgeSpacing?
    
    init(
        direction: Direction,
        size: NSCollectionLayoutSize,
        count: Int = 1,
        contentInsets: NSDirectionalEdgeInsets? = nil,
        edgeSpacing: NSCollectionLayoutEdgeSpacing? = nil
    ) {
        self.direction = direction
        self.size = size
        self.count = count
        self.contentInsets = contentInsets
        self.edgeSpacing = edgeSpacing
    }
    
    func configure(item: NSCollectionLayoutItem) -> NSCollectionLayoutGroup {
        let subitems = Array(repeating: item, count: count)
        let group = direction == .vertical
        ? NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: subitems)
        : NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: subitems)
        
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
