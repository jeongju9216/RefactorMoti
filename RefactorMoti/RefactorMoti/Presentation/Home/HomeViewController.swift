//
//  HomeViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import UIKit
import Combine

final class HomeViewController: LayoutViewController<HomeView> {
    
    // MARK: - Attribute
    
    private let viewModel = HomeViewModel()
    private let input = HomeViewModel.Input()
    private var output: HomeViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.viewDidLoad.send()
    }
    
    
    // MARK: - Setup
    
    override func setUpAttribute() {
        super.setUpAttribute()
        setUpCategoriesCollectionView()
    }
    
    override func setUpBinding() {
        super.setUpBinding()
        viewModel.bind(input: input)
        setUpViewModelBinding()
    }
}


// MARK: - Binding ViewModel

private extension HomeViewController {

    private func setUpViewModelBinding() {
        output.categories
            .sink { [weak self] categories in
                guard let self else { return }
                print("categories: \(categories)") // swiftlint:disable:this all
            }
            .store(in: &cancellables)
    }
}


// MARK: - ViewModel DataSource

private extension HomeViewController {

    func setUpCategoriesCollectionView() {
        layoutView.categoriesCollectionView.delegate = self
        let categoryDataSource = HomeViewModel.CategoryDataSource(dataSource: makeCategoryDataSource())
        viewModel.setupCategoryDataSource(categoryDataSource)
    }
    
    func makeCategoryDataSource() -> HomeViewModel.CategoryDataSource.DataSource {
        .init(
            collectionView: layoutView.categoriesCollectionView,
            cellProvider: { collectionView, indexPath, item in
                let cell = collectionView.dequeueReusableCell(CategoryCollectionViewCell.self, for: indexPath)
                cell.configure(with: item)
                return cell
            }
        )
    }
}


// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected: \(indexPath.row)") // swiftlint:disable:this all
    }
}
