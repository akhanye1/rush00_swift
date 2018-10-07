//
//  ViewController.swift
//  rush00
//
//  Created by Archiebald Katleho KHANYE on 2018/10/06.
//  Copyright © 2018 Archiebald Katleho KHANYE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UIDeligate {
    
    static var userKey: String?
    static var apiKey: String?
    
    @IBOutlet var webViewLogIn: UIWebView!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
    }
    
    func updateMessages(messages: [Message]) {
        
    }
    
    func updateTopics(topics: [Topic]) {
        
    }
    
    func changeView(userKey: String) {
        let landingView:navClassViewController = self.storyboard?.instantiateViewController(withIdentifier: "navGuide") as! navClassViewController
        self.present(landingView, animated: true, completion: nil )
    }
    
    override func viewDidLoad() {
        getTokenKey(deligateType: self)
        super.viewDidLoad()
        self.webViewLogIn.delegate = self
        self.webViewLogIn.loadRequest(URLRequest(url: URL(string: "https://api.intra.42.fr/oauth/authorize?client_id=22c42f060036c0fb5c214c7d25776d31d0e39a1689160e0760757e2091d786e5&redirect_uri=https%3A%2F%2Fwww.wethinkcode.co.za&response_type=code")! as URL ))
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType:
        UIWebViewNavigationType) -> Bool {
        let link:String = request.url!.absoluteString
        
        if (link.contains("https://www.wethinkcode.co.za/?code=")) {
            let strings = link.split(separator: "=")
            let code:String = String(strings[1])
            userLogin(deligateType: self, code: code)
        }
        
        return true
    }
    
    
    
}

