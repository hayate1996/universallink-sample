//
//  ViewController.swift
//  universallink-sample
//
//  Created by NAGAMINE HIROMASA on 2015/09/16.
//  Copyright © 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var httpButton: UIButton!
    @IBOutlet var httpsButton: UIButton!

    let http:String = "http://"
    let https:String = "https://"
    let twitter = "twitter.com"
    let google = "google.com"
    let webviewIdentifier = "openWebViewController"
    var lastOpenedURL:NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedHttpButton(sender: AnyObject) {
        lastOpenedURL = NSURL(string: http + google)
        self.performSegueWithIdentifier(webviewIdentifier, sender: nil)
    }

    @IBAction func tappedHttpsButton(sender: AnyObject) {
        lastOpenedURL = NSURL(string: https + google)
        self.performSegueWithIdentifier(webviewIdentifier, sender: nil)
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! WebViewController
        vc.setOpenURL(lastOpenedURL!)
    }


}

