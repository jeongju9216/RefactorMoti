//
//  CompositionalLayout.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit

enum CompositionalLayout {
    
    case vertical
    case horizontal
    
    func configure(
        item: CompositionalLayoutItem,
        group: CompositionalLayoutGroup,
        section: CompositionalLayoutSection
    ) -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let item = item.configure()
            let group = group.configure(type: self, item: item)
            return section.configure(group: group)
        }
    }
}


// MARK: - CompositionalLayoutItem

struct CompositionalLayoutItem {
    
    let size: NSCollectionLayoutSize
    let contentInsets: NSDirectionalEdgeInsets?
    
    init(
        size: NSCollectionLayoutSize,
        contentInsets: NSDirectionalEdgeInsets? = nil
    ) {
        self.size = size
        self.contentInsets = contentInsets
    }
    
    func configure() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        if let contentInsets {
            item.contentInsets = contentInsets
        }
        
        return item
    }
}


// MARK: - CompositionalLayoutGroup

struct CompositionalLayoutGroup {
    
    let size: NSCollectionLayoutSize
    let count: Int
    let contentInsets: NSDirectionalEdgeInsets?
    let edgeSpacing: NSCollectionLayoutEdgeSpacing?
    
    init(
        size: NSCollectionLayoutSize,
        count: Int,
        contentInsets: NSDirectionalEdgeInsets? = nil,
        edgeSpacing: NSCollectionLayoutEdgeSpacing? = nil
    ) {
        self.size = size
        self.count = count
        self.contentInsets = contentInsets
        self.edgeSpacing = edgeSpacing
    }
    
    func configure(
        type: CompositionalLayout,
        item: NSCollectionLayoutItem
    ) -> NSCollectionLayoutGroup {
        let subitems = Array(repeating: item, count: count)
        let group = type == .vertical
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
        orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
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

