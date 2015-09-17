//
//  ViewController.swift
//  universallink-sample
//
//  Created by NAGAMINE HIROMASA on 2015/09/16.
//  Copyright © 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit
import SafariServices


enum ProtocolType: Int {
    case Http, Https

    func string() -> String {
        switch self {
            case .Http: return "http://"
            case .Https: return "https://"
        }
    }
}

enum ServiceType: Int {
    case Google, Twitter

    func domain() -> String {
        switch self {
            case .Google: return "google.com"
            case .Twitter: return "twitter.com"
        }
    }
}

enum BrowserType: Int {
    case WebView, WebKit, Safari

    func identifier() -> String {
        switch self {
            case .WebView : return "WebView"
            case .WebKit  : return "WebKit"
            case .Safari  : return "Safari"
        }
    }

    func segueIdentifier() -> String {
        switch self {
            case .WebView : return "openWebViewController"
            case .WebKit  : return "openWebKitViewController"
            case .Safari  : return "openSafariViewController"
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet var httpButton: UIButton!
    @IBOutlet var httpsButton: UIButton!

    var lastOpenedURL:NSURL?

    @IBOutlet var uiwebviewButton: UIButton!
    @IBOutlet var webkitButton: UIButton!
    @IBOutlet var safariButton: UIButton!
    @IBOutlet var selectedTypeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTypeLabel.text = BrowserType.WebView.identifier()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tappedHttpButton(sender: AnyObject) {
        lastOpenedURL = NSURL(string: ProtocolType.Http.string() + ServiceType.Google.domain())

        if selectedTypeLabel.text == BrowserType.WebView.identifier() {
            self.performSegueWithIdentifier(BrowserType.WebView.segueIdentifier(), sender: nil)
        }
        else if selectedTypeLabel.text == BrowserType.WebKit.identifier() {
            self.performSegueWithIdentifier(BrowserType.WebKit.segueIdentifier(), sender: nil)
        }
        else if selectedTypeLabel.text == BrowserType.Safari.identifier() {
            let vc = SafariViewController(URL: lastOpenedURL!, entersReaderIfAvailable: true)
            self.presentViewController(vc, animated: true, completion: nil)
        }

    }

    @IBAction func tappedHttpsButton(sender: AnyObject) {
        lastOpenedURL = NSURL(string: ProtocolType.Https.string() + ServiceType.Google.domain())
    
        if selectedTypeLabel.text == BrowserType.WebView.identifier() {
            self.performSegueWithIdentifier(BrowserType.WebView.segueIdentifier(), sender: nil)
        }
        else if selectedTypeLabel.text == BrowserType.WebKit.identifier() {
            self.performSegueWithIdentifier(BrowserType.WebKit.segueIdentifier(), sender: nil)
        }
        else if selectedTypeLabel.text == BrowserType.Safari.identifier() {
            let vc = SafariViewController(URL: lastOpenedURL!, entersReaderIfAvailable: true)
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {

            case BrowserType.WebView.segueIdentifier() :
                let vc = segue.destinationViewController as! WebViewController
                vc.setOpenURL(self.lastOpenedURL!)
                break
            case BrowserType.WebKit.segueIdentifier(),
                 BrowserType.Safari.segueIdentifier() :
                break
            default :
                break

        }
    }

    @IBAction func pressedWebViewButton(sender: AnyObject) {
        selectedTypeLabel.text = BrowserType.WebView.identifier()
    }

    @IBAction func pressedWebKitButton(sender: AnyObject) {
        selectedTypeLabel.text = BrowserType.WebKit.identifier()
    }

    @IBAction func pressedSafariButton(sender: AnyObject) {
        selectedTypeLabel.text = BrowserType.Safari.identifier()
    }
}

