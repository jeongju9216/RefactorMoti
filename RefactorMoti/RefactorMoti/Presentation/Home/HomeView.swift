//
//  HomeView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import UIKit
import JeongDesignSystem

final class HomeView: BaseView { 
    
    // MARK: - UI
    
    private lazy var categoriesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCategoriesCompositionalLayout())
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    
    // MARK: - Setup
    
    override func setUpSubview() {
        addSubview(categoriesCollectionView)
    }
    
    override func setUpConstraint() {
        categoriesCollectionView.atl
            .height(Metric.CategoryList.height)
            .top(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.CategoryList.topOffset)
            .horizontal(equalTo: safeAreaLayoutGuide)
    }
}


// MARK: - Compositional Layout

private extension HomeView {
    
    func makeCategoriesCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(Metric.CategoryItem.width),
            heightDimension: .fractionalHeight(1)
        )
        let item = CompositionalLayoutItem(size: size)
        let groupEdgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: .fixed(Metric.CategoryItem.groupEdgeSpacing),
            top: .none, trailing: .none, bottom: .none
        )
        let group = CompositionalLayoutGroup(size: size, count: 1, edgeSpacing: groupEdgeSpacing)
        let section = CompositionalLayoutSection(orthogonalScrollingBehavior: .continuous)
        return CompositionalLayout.horizontal.configure(
            item: item,
            group: group,
            section: section
        )
    }
}


// MARK: - Constant

private extension HomeView {
    
    enum Metric {
        
        enum CategoryItem {
            
            static let width = 44.0
            static let groupEdgeSpacing = 5.0
        }
        
        enum CategoryList {
            
            static let topOffset = 10.0
            static let height = 37.0
        }
    }
}
