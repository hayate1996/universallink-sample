//
//  WebViewController.swift
//  universallink-sample
//
//  Created by NAGAMINE HIROMASA on 2015/09/16.
//  Copyright © 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate{

    @IBOutlet var webview: UIWebView!
    var bufferedRequest:NSURLRequest?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadRequest()
    }

    func loadRequest() {
        if  let currentRequst = bufferedRequest,
            let currentWebView = self.webview   {
                currentWebView.loadRequest(currentRequst)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    func setOpenURL(URL: NSURL){
        self.bufferedRequest = NSURLRequest(URL: URL)
        loadRequest()
    }

    func canOpenWebView() -> Bool{
        if  let request = bufferedRequest,
            let currentURL = request.URL    {
            return AppDelegate.sharedApplication().canOpenURL(currentURL)
        }

        return false
    }

    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(error)
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        print("webViewDidFinishLoad")
    }

    func webViewDidStartLoad(webView: UIWebView) {
        print("webViewDidStartLoad")
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
