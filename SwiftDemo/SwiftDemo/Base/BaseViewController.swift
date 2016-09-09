//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/19.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit
import FDFullscreenPopGesture
import SVProgressHUD

class BaseViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        view.backgroundColor = GlobalGrayColor()
        navigationController?.fd_prefersNavigationBarHidden = true
        SVProgressHUD.setDefaultStyle(.Custom)
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
        SVProgressHUD.setBackgroundColor(RGBColor(0, g: 0, b: 0, a: 0.5))
        SVProgressHUD.setForegroundColor(UIColor.whiteColor())
        
    }

}
