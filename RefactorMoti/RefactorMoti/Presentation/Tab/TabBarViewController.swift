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
        let homeNavigationVC = UINavigationController(rootViewController: HomeViewController())
        homeNavigationVC.tabBarItem.image = UIImage(systemName: Image.Normal.home)
        homeNavigationVC.tabBarItem.selectedImage = UIImage(systemName: Image.Selected.home)
        homeNavigationVC.isNavigationBarHidden = true
        
        let captureVC = UIViewController()
        captureVC.tabBarItem.image = UIImage(systemName: Image.Normal.capture)
        captureVC.tabBarItem.selectedImage = UIImage(systemName: Image.Selected.capture)
        
        let settingsVC = SettingsViewController()
        settingsVC.navigationItem.title = Title.settings
        let settingsNavigationVC = UINavigationController(rootViewController: settingsVC)
        settingsNavigationVC.navigationBar.prefersLargeTitles = true
        settingsNavigationVC.tabBarItem.image = UIImage(systemName: Image.Normal.settings)
        settingsNavigationVC.tabBarItem.selectedImage = UIImage(systemName: Image.Selected.settings)
        
        setViewControllers([homeNavigationVC, captureVC, settingsNavigationVC], animated: true)
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

