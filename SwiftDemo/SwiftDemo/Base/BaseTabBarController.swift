//
//  BaseTabBarController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/18.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // iOS7以后只需要设置tintColor, 那么图片和文字都会按照tintColor渲染
        tabBar.tintColor = GlobalReadColor()
        
        // 添加子控制器
        addChildViewControllers()
    }

    /**
     添加子控制器
     */
    func addChildViewControllers()
    {
        // 1.根据JSON文件创建控制器
        // 1.1读取JSON数据
        guard let filePath = NSBundle.mainBundle().pathForResource("ViewControllers.json",ofType: nil) else { return }
        
        guard let data  = NSData(contentsOfFile:filePath) else { return }
        
        // 1.2将JSON数据转换为对象(数组字典)
        do
        {
            
            /*
             Swift和OC不太一样, OC中一般情况如果发生错误会给传入的指针赋值, 而在Swift中使用的是异常处理机制
             1.以后但凡看大 throws的方法, 那么就必须进行 try处理, 而只要看到try, 就需要写上do catch
             2.do{}catch{}, 只有do中的代码发生了错误, 才会执行catch{}中的代码
             3. try  正常处理异常, 也就是通过do catch来处理
             try! 告诉系统一定不会有异常, 也就是说可以不通过 do catch来处理
             但是需要注意, 开发中不推荐这样写, 一旦发生异常程序就会崩溃
             如果没有异常那么会返回一个确定的值给我们
             
             try? 告诉系统可能有错也可能没错, 如果没有系统会自动将结果包装成一个可选类型给我们, 如果有错系统会返回nil, 如果使用try? 那么可以不通过do catch来处理
             */
            let objc = try NSJSONSerialization.JSONObjectWithData(data,options:NSJSONReadingOptions.MutableContainers) as! [[String : AnyObject]]
            
            // 1.3遍历数组字典取出每一个字典
            for dict in objc
            {
                // 1.4根据遍历到的字典创建控制器
                let title = dict["title"] as? String
                let vcName = dict["vcName"] as? String
                let imageName = dict["imageName"] as? String
                addChildViewController(vcName,title : title,imageName : imageName)
            }
        }
        catch
        {
             // 只要try对应的方法发生了异常, 就会执行catch{}中的代码
            addChildViewController("DanTangViewController",title : "单糖",imageName : "TabBar_home_23x23_")
            addChildViewController("ProductViewController",title : "单品",imageName : "TabBar_gift_23x23_")
            addChildViewController("ClassifyViewController",title : "分类",imageName : "TabBar_category_23x23_")
            addChildViewController("MineViewController",title : "我",imageName : "TabBar_me_boy_23x23_")
        }
    }

    
    ///初始化子控制器
    func addChildViewController(childControllerName:String?,title:String?,imageName:String?)
    {
        //动态获取命名空间
        guard let namespace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else { return }
        
         // 2.根据字符串获取Class
        var clsName : AnyClass?  = nil;
        if let  vcName = childControllerName
        {
            clsName = NSClassFromString(namespace + "." + vcName)
        }
        
        // 3.根据Class创建对象
        // Swift中如果想通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
        guard let typecls = clsName as? UIViewController.Type else
        {
            return
        }
        
        // 通过Class创建对象
        let childController = typecls.init()
        

        
        
    // 1.2设置自控制的相关属性
        childController.title = title
        
        if let image = imageName
        {
            childController.tabBarItem.image = UIImage(named: image)
            childController.tabBarItem.selectedImage = UIImage(named: image + "selected")
        }
        
        
        // 1.3包装一个导航控制器
        let nav = BaseNavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
}
