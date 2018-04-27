//
//  ViewController.swift
//  DWBarHUDDemo
//
//  Created by duwei on 2018/4/19.
//  Copyright © 2018年 Dywane. All rights reserved.
//

import UIKit
import DWBarHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DWBarHUD.sharedHUD.config.animationDuration = 1.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showHUD(_ sender: Any) {
        DWBarHUD.showHUD(message: "this is a message, you need to read it")
    }
    
    @IBAction func showSuccessHUD(_ sender: Any) {
        DWBarHUD.showHUD(message: "this is a success message", type: .success)
    }
    @IBAction func showFailHUD(_ sender: Any) {
        DWBarHUD.showHUD(message: "this is a fail message", type: .fail)
    }
    @IBAction func showWarningHUD(_ sender: Any) {
        DWBarHUD.showHUD(message: "this is a warning message", type: .warning)
    }
    
}

