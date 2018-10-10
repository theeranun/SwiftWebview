//
//  WebViewController.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 18/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var WebView: WKWebView!
    
    var urlString = String()
    var navTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = navTitle
        
        let webUrl = URL(string: urlString)
        let request = URLRequest(url: webUrl!)
        
        WebView.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
