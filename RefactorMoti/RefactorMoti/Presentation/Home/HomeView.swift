//
//  HomeView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import UIKit
import JeongDesignSystem

final class HomeView: BaseView {
    
    // MARK: - Interface
    
    var addCategoryButtonDidTap: UIControl.ControlEventPublisher {
        addCategoryButton.publisher(for: .touchUpInside)
    }
    var addAchievementButtonDidTap: UIControl.ControlEventPublisher {
        addAchievementButton.publisher(for: .touchUpInside)
    }
    
    func selectCategory(indexPath: IndexPath) {
        categoriesCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
    // MARK: - UI
    
    private(set) lazy var categoriesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCategoriesCompositionalLayout())
        collectionView.alwaysBounceVertical = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(CategoryCollectionViewCell.self)
        return collectionView
    }()
    private(set) lazy var achievementCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeAchievementCompositionalLayout())
        collectionView.register(AchievementCollectionViewCell.self)
        return collectionView
    }()
    private let addCategoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Color.AddCategoryButton.background
        button.setTitle(Text.AddCategoryButton.title, for: .normal)
        button.jd.cornerRadius(.small)
        return button
    }()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.AddCategoryButton.separator
        return view
    }()
    
    // TODO: 임시 도전기록 추가 버튼입니다.
    private let addAchievementButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Achievement 파이어베이스 추가"
        configuration.baseForegroundColor = .red
        let button = UIButton(configuration: configuration)
        button.jd.cornerRadius(.small)
        return button
    }()
    
    
    // MARK: - Setup
    
    override func setUpSubview() {
        addSubview(addCategoryButton)
        addSubview(separatorView)
        addSubview(categoriesCollectionView)
        addSubview(achievementCollectionView)
        addSubview(addAchievementButton)
    }
    
    override func setUpConstraint() {
        addCategoryButton.atl
            .width(equalTo: addCategoryButton.heightAnchor)
            .height(Metric.CategoryList.height)
            .top(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.CategoryList.topOffset)
            .left(equalTo: safeAreaLayoutGuide.leftAnchor, constant: Metric.AddCategoryButton.horizontalOffset)
            .right(equalTo: separatorView.leftAnchor, constant: -Metric.AddCategoryButton.horizontalOffset)
        separatorView.atl
            .width(1)
            .height(Metric.CategoryList.height)
            .top(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.CategoryList.topOffset)
            .right(equalTo: categoriesCollectionView.leftAnchor)
        categoriesCollectionView.atl
            .height(Metric.CategoryList.height)
            .top(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.CategoryList.topOffset)
            .right(equalTo: safeAreaLayoutGuide.rightAnchor)
        achievementCollectionView.atl
            .top(equalTo: categoriesCollectionView.bottomAnchor, constant: Metric.Achievement.topOffset)
            .bottom(equalTo: self.bottomAnchor)
            .horizontal(equalTo: safeAreaLayoutGuide)
        addAchievementButton.atl
            .center(equalTo: self)
    }
}


// MARK: - Compositional Layout

private extension HomeView {
    
    func makeCategoriesCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let item = CompositionalLayoutItem(width: .estimated(Metric.CategoryItem.width), height: .fractionalHeight(1))
        let groupEdgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(Metric.CategoryItem.groupEdgeSpacing))
        let group = CompositionalLayoutGroup(direction: .horizontal, size: item.size, edgeSpacing: groupEdgeSpacing)
        let section = CompositionalLayoutSection(orthogonalScrollingBehavior: .continuous)
        return CompositionalLayout.configure(item: item, group: group, section: section)
    }
    
    func makeAchievementCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemCount = Metric.Achievement.itemCount
        let item = CompositionalLayoutItem(width: .fractionalWidth(1.0 / CGFloat(itemCount)), height: .fractionalHeight(1))
            .contentInsets(.init(inset: Metric.Achievement.itemEdgeInset))
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: item.size.widthDimension
        )
        let group = CompositionalLayoutGroup(direction: .horizontal, size: groupSize, count: itemCount)
        let section = CompositionalLayoutSection()
        return CompositionalLayout.configure(item: item, group: group, section: section)
    }
}


// MARK: - Constant

private extension HomeView {
    
    enum Constant {
        
        static let isPhone = UIDevice.current.userInterfaceIdiom == .phone
    }
    
    enum Metric {
        
        enum CategoryItem {
            
            static let width = 44.0
            static let groupEdgeSpacing = 5.0
        }
        
        enum CategoryList {
            
            static let topOffset = 10.0
            static let height = 37.0
        }
        
        enum Achievement {
            
            static let itemEdgeInset = 1.0
            static let itemCount = Constant.isPhone ? 3 : 7
            static let topOffset = 10.0
        }
        
        enum AddCategoryButton {
            
            static let horizontalOffset = 5.0
        }
    }
    
    enum Text {
        
        enum AddCategoryButton {
            
            static let title = "+"
        }
    }
    
    enum Color {
        
        enum AddCategoryButton {
            
            static let background = JDColor.primary
            static let separator = JDColor.gray
        }
    }
}
