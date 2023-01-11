//
//  ViewController.swift
//  VoiceOver
//
//  Created by John Brayton on 1/11/23.
//

import UIKit

class CustomNavigationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController(customNavigationController: self)
        self.addChild(listViewController)
        self.view.addSubview(listViewController.view)
        self.addConstraints(toChildView: listViewController.view)
    }
    
    func showWebViewController() {
        let webViewController = WebViewController()
        self.view.addSubview(webViewController.view)
        self.addConstraints(toChildView: webViewController.view)
        self.addChild(webViewController)
        UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: webViewController);
    }
    
    func addConstraints( toChildView view: UIView ) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor))
        self.view.addConstraint(view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor))
        self.view.addConstraint(view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor))
        self.view.addConstraint(view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))
    }
    
    override func accessibilityPerformEscape() -> Bool {
        if self.children.count > 1 {
            let topViewController = self.children.last!
            topViewController.view.removeFromSuperview()
            topViewController.removeFromParent()
            
            let newTopViewController = self.children.last!
            self.view.accessibilityElements = [newTopViewController.view!]
            UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: newTopViewController);
            return true
        } else {
            return false
        }
    }
    
}

