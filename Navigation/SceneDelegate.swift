//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Alex Chumakov on 15.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let feedViewController = FeedViewController()
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        feedViewController.view.backgroundColor = .white
        feedViewController.title = "Feed"
        
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileViewController.view.backgroundColor = .yellow
        profileViewController.title = "Profile"
    
        let tabBarController = UITabBarController()
        
        feedViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        profileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }
  
    }


