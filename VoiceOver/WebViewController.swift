//
//  WebViewController.swift
//  VoiceOver
//
//  Created by John Brayton on 1/11/23.
//

import UIKit
import WebKit

class WebViewController : UIViewController {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WKWebView()
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.webView)
        self.view.addConstraint(self.webView.topAnchor.constraint(equalTo: self.view.topAnchor))
        self.view.addConstraint(self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
        self.view.addConstraint(self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
        self.view.addConstraint(self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor))
        
        Task {
            try await Task.sleep(for: Duration(secondsComponent: Int64(1.0), attosecondsComponent: 0))
            let url = URL(string: "https://www.goldenhillsoftware.com/unread/")!
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
    
}
