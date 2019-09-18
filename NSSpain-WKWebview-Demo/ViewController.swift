//
//  ViewController.swift
//  NSSpain-WKWebview-Demo
//
//  Created by Dominik Scherm on 18.09.19.
//  Copyright © 2019 FirstBlink. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var addressBarTextField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: "https://nsspain.com")!))
        
    }
    
    
    @IBAction func submitURL(_ sender: Any) {
        webView.load(URLRequest(url: URL(string: addressBarTextField.text!)!))
    }

}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        addressBarTextField.text = webView.url?.absoluteString
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

