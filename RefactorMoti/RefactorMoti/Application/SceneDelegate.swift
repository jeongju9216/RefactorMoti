//
//  SceneDelegate.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/21/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
        
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: sceneWindow)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
    }
}

