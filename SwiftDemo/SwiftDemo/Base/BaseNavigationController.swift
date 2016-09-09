//
//  BaseNavigationController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/17.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseNavigationController: UINavigationController
{
    /*
    在Swift语言中，访问修饰符有三种，分别为private，internal和public。同时，Swift对于访问权限的控制，不是基于类的，而是基于文件的。其区别如下：
    
    1，private
    private访问级别所修饰的属性或者方法只能在当前的Swift源文件里可以访问。
    
    2，internal（默认访问级别，internal修饰符可写可不写）
    internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
    如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
    如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
    
    3，public
    可以被任何人使用
    
    */
    
    //父类隐藏类方法
    override class func initialize()
    {
        super.initialize()
        /// 设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = GlobalReadColor()
        navBar.tintColor = UIColor.whiteColor()
        navBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor() , NSFontAttributeName : UIFont.systemFontOfSize(20)]
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool)
    {
        if viewControllers.count > 0
        {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .Plain, target: self, action: #selector(backClick))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func backClick()
    {
        
        if SVProgressHUD.isVisible()
        {
            SVProgressHUD.dismiss()
        }
        
        if UIApplication.sharedApplication().networkActivityIndicatorVisible
        {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        
        popViewControllerAnimated(true)
    }
}

