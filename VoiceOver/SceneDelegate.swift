//
//  SceneDelegate.swift
//  VoiceOver
//
//  Created by John Brayton on 1/11/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    weak var sceneSession: UISceneSession?
    var connectionOptions: UIScene.ConnectionOptions?
    @objc var rootViewController: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.sceneSession = session
        self.connectionOptions = connectionOptions
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = UIColor.black
        let rootViewController = MyNavigationController()
        self.window = window
        self.rootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = self.rootViewController
        window.makeKeyAndVisible()

    }

}

