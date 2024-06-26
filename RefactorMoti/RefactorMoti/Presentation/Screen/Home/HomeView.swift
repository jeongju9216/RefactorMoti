//
//  HomeView.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import UIKit
import JeongDesignSystem
import FlexLayout
import PinLayout

final class HomeView: BaseView {
    
    // MARK: - Interface
    
    var addCategoryButtonDidTap: UIControl.ControlEventPublisher {
        addCategoryButton.publisher(for: .touchUpInside)
    }
    
    func selectCategory(indexPath: IndexPath) {
        categoriesCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    // MARK: - UI
    
    private let flexBox = UIView()
    private(set) lazy var categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCategoriesCompositionalLayout()).then {
        $0.alwaysBounceVertical = false
        $0.alwaysBounceHorizontal = true
        $0.register(CategoryCollectionViewCell.self)
    }
    private(set) lazy var achievementCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeAchievementCompositionalLayout()).then {
        $0.register(AchievementCollectionViewCell.self)
    }
    private let addCategoryButton = UIButton().then {
        $0.backgroundColor = Color.AddCategoryButton.background
        $0.setTitle(Text.AddCategoryButton.title, for: .normal)
        $0.jd.cornerRadius(.small)
    }
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        flexBox.pin.top(pin.safeArea).bottom().horizontally(pin.safeArea)
        flexBox.flex.layout()
    }
    
    // MARK: - Setup
    
    override func setUpSubview() {
        addSubview(flexBox)
    }
    
    override func setUpConstraint() {
        flexBox.flex.define { flex in
            flex.addItem().direction(.row).height(Metric.CategoryList.height).marginTop(Metric.CategoryList.topOffset).define { flex in
                flex.addItem(addCategoryButton).width(Metric.CategoryList.height).marginHorizontal(Metric.AddCategoryButton.horizontalOffset)
                flex.addItem().width(1).backgroundColor(Color.AddCategoryButton.separator)
                flex.addItem(categoriesCollectionView).grow(1)
            }
            
            flex.addItem(achievementCollectionView).marginTop(Metric.Achievement.topOffset).grow(1)
        }
    }
}

// MARK: - Compositional Layout

private extension HomeView {
    
    func makeCategoriesCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(Metric.CategoryItem.width), heightDimension: .fractionalHeight(1))
        let item = CompositionalLayoutItem(size: itemSize)
            .configure()
        
        let group = CompositionalLayoutGroup(size: itemSize)
            .edgeSpacing(NSCollectionLayoutEdgeSpacing(leading: .fixed(Metric.CategoryItem.groupEdgeSpacing)))
            .configure(verticalWith: [item])
         
        let section = CompositionalLayoutSection()
            .orthogonalScrollingBehavior(.continuous)
            .configure(with: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func makeAchievementCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemCount = Metric.Achievement.itemCount
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / CGFloat(itemCount)), heightDimension: .fractionalHeight(1))
        let item = CompositionalLayoutItem(size: itemSize)
            .contentInsets(.init(inset: Metric.Achievement.itemEdgeInset))
            .configure()
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: itemSize.widthDimension)
        let group = CompositionalLayoutGroup(size: groupSize)
            .configure(horizontalWith: Array(repeating: item, count: itemCount))
        
        let section = CompositionalLayoutSection()
            .configure(with: group)
        
        return UICollectionViewCompositionalLayout(section: section)
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
