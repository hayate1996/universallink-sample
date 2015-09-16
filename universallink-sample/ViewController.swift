//
//  ViewController.swift
//  universallink-sample
//
//  Created by NAGAMINE HIROMASA on 2015/09/16.
//  Copyright © 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet var httpButton: UIButton!
    @IBOutlet var httpsButton: UIButton!

    let http:String = "http://"
    let https:String = "https://"
    let twitter = "twitter.com"
    let google = "google.com"
    let webViewIdentifier = "openWebViewController"
    let webKitViewIdentifier = "openWebKitViewController"
    let safariViewIdentifier = "openSafariViewController"
    var lastOpenedURL:NSURL?

    let typeWebView = "WebView"
    let typeWebKit = "WebKit"
    let typeSafari = "Safari"

    @IBOutlet var uiwebviewButton: UIButton!
    @IBOutlet var webkitButton: UIButton!
    @IBOutlet var safariButton: UIButton!
    @IBOutlet var selectedTypeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTypeLabel.text = typeWebView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tappedHttpButton(sender: AnyObject) {
        lastOpenedURL = NSURL(string: http + google)

        if selectedTypeLabel.text == typeWebView {
            self.performSegueWithIdentifier(webViewIdentifier, sender: nil)
        }
        else if selectedTypeLabel.text == typeWebKit {
            self.performSegueWithIdentifier(webKitViewIdentifier, sender: nil)
        }
        else if selectedTypeLabel.text == typeSafari {
            let vc = SafariViewController(URL: lastOpenedURL!, entersReaderIfAvailable: true)
            self.presentViewController(vc, animated: true, completion: nil)
        }

    }

    @IBAction func tappedHttpsButton(sender: AnyObject) {
        lastOpenedURL = NSURL(string: https + google)
    
        if selectedTypeLabel.text == typeWebView {
            self.performSegueWithIdentifier(webViewIdentifier, sender: nil)
        }
        else if selectedTypeLabel.text == typeWebKit {
            self.performSegueWithIdentifier(webKitViewIdentifier, sender: nil)
        }
        else if selectedTypeLabel.text == typeSafari {
            let vc = SafariViewController(URL: lastOpenedURL!, entersReaderIfAvailable: true)
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {

            case "openWebViewController" :
                let vc = segue.destinationViewController as! WebViewController
                vc.setOpenURL(self.lastOpenedURL!)
                break
            case "openWebKitViewController",
                 "openSafariViewController" :
                break
            default :
                break

        }
    }

    @IBAction func pressedWebViewButton(sender: AnyObject) {
        selectedTypeLabel.text = typeWebView
    }

    @IBAction func pressedWebKitButton(sender: AnyObject) {
        selectedTypeLabel.text = typeWebKit
    }

    @IBAction func pressedSafariButton(sender: AnyObject) {
        selectedTypeLabel.text = typeSafari
    }
}

