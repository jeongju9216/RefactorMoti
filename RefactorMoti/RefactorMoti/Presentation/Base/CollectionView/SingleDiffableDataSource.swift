//
//  SingleDiffableDataSource.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit

@MainActor
struct SingleDiffableDataSource<T: Hashable> {

    // MARK: - Interface
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, T>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Section, T>
    
    enum Section: Int, CaseIterable {

        case main
    }

    func reset() {
        var snapshot = SnapShot()
        snapshot.appendSections([.main])
        dataSource.apply(snapshot)
    }

    func update(data: [T], animate: Bool = true) {
        var snapshot = SnapShot()
        snapshot.appendSections([.main])
        snapshot.appendItems(data, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
    
    
    // MARK: - Attribute
    
    private let dataSource: DataSource
    
    
    // MARK: - Initializer
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
}
