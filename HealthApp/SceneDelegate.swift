//
//  SceneDelegate.swift
//  HealthApp
//

import PosturePackage
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties

    var window: UIWindow?
    private var tabBarController: UITabBarController?

    // MARK: - Methods

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController

        let postureViewController = PostureViewController()
        postureViewController.delegate = self

        let tabBarItem = UITabBarItem(title: "Posture", image: UIImage(systemName: "figure.stand"), selectedImage: UIImage(systemName: "figure.stand"))
        postureViewController.tabBarItem = tabBarItem

        tabBarController?.viewControllers?.append(postureViewController)
        tabBarController?.viewControllers?.reverse()
        tabBarController?.selectedIndex = 0

        window.rootViewController = tabBarController

        self.window = window
        window.makeKeyAndVisible()
    }
}

extension SceneDelegate: PostureViewControllerDelegate {
    // MARK: - Methods

    func postureViewControllerStartButtonDidTapped(viewController _: PosturePackage.PostureViewController) {}

    func postureViewControllerSettingsButtonDidTapped(viewController _: PosturePackage.PostureViewController) {
        tabBarController?.selectedIndex = 1
    }
}
