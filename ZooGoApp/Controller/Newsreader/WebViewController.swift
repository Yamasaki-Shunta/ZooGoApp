//
//  WebViewController.swift
//  NewsTest
//
//  Created by 山﨑隼汰 on 2020/11/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKUIDelegate {

    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        
        webView.frame = CGRect(x: 0, y:0 , width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(webView)
        
        let urlString = UserDefaults.standard.object(forKey: "url")
        let url = URL(string: urlString as! String)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        setSwipeBack()
        
    
    }
    
}
