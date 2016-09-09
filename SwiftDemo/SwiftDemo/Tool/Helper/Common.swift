//
//  Common.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/18.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

///RGB颜色
func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor
{
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

///灰色
func GlobalGrayColor() -> UIColor
{
    return RGBColor(240, g: 240, b: 240, a: 1)
}

/// 红色
func GlobalReadColor() -> UIColor
{
    return RGBColor(245, g: 80, b: 83, a: 1)
}


/*
 打印LOG的弊端:
 1.非常消耗性能
 2.如果app部署到AppStore之后用户是看不到LOG的
 
 所以
 开发阶段: 显示LOG
 部署阶段: 隐藏LOG
 */
func Log<T>(message:T,fileName:String = #file,methodName:String = #function,lineNumber : Int = #line)
{
    #if DEBUG
        print("\((fileName as NSString).pathComponents.last!).\(methodName)[\(lineNumber)]:\(message)")
    #endif
}


