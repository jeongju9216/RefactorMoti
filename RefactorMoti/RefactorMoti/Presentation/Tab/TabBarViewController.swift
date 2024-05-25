//
//  TabBarViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/25/24.
//

import UIKit
import JeongDesignSystem

final class TabBarViewController: UITabBarController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAttributes()
        setUpViewControllers()
    }
    
    
    // MARK: - Setup
    
    private func setUpAttributes() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        tabBar.tintColor = JDColor.primary
        tabBar.backgroundColor = JDColor.background
    }
    
    private func setUpViewControllers() {
        let viewControllers = [setUpHome(), setUpCapture(), setUpSettings()]
        setViewControllers(viewControllers, animated: true)
    }
    
    
    // MARK: - Setup ViewController
    
    private func setUpHome() -> UIViewController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.image = UIImage(systemName: Image.Normal.home)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: Image.Selected.home)
        navigationController.isNavigationBarHidden = true
        return navigationController
    }
    
    private func setUpCapture() -> UIViewController {
        let viewController = UIViewController()
        viewController.tabBarItem.image = UIImage(systemName: Image.Normal.capture)
        viewController.tabBarItem.selectedImage = UIImage(systemName: Image.Selected.capture)
        return viewController
    }
    
    private func setUpSettings() -> UIViewController {
        let viewController = SettingsViewController()
        viewController.navigationItem.title = Title.settings
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.image = UIImage(systemName: Image.Normal.settings)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: Image.Selected.settings)
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}


// MARK: - Constant

private extension TabBarViewController {
    
    enum Title {
        
        static let settings = "설정"
    }
    
    enum Image {
        
        enum Normal {
        
            static let home = "circle.square"
            static let capture = "plus.square"
            static let settings = "gearshape"
        }
        
        enum Selected {
        
            static let home = "circle.square.fill"
            static let capture = "plus.square.fill"
            static let settings = "gearshape.fill"
        }
    }
}

