//
//  Extension.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/24.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

/*
 
 扩展 就是为一个已有的类、结构体、枚举类型或者协议类型添加新功能。
 这包括在没有权限获取原始源代码的情况下扩展类型的能力（即 逆向建模 ）。
 扩展和 Objective-C 中的分类类似。（与 Objective-C 不同的是，Swift 的扩展没有名字。）
 
 Swift 扩展功能：
    1.添加计算型属性和计算型类型属性
    2.定义实例方法和类型方法
    3.提供新的构造器
    4.定义下标
    5.定义和使用新的嵌套类型
    6.使一个已有类型符合某个协议
 
 扩展语法（Extension Syntax）
 使用关键字 extension 来声明扩展：
 
 extension SomeType 
 {
    // 为 SomeType 添加的新功能写到这里
 }
 
 可以通过扩展来扩展一个已有类型，使其采纳一个或多个协议。
 在这种情况下，无论是类还是结构体，协议名字的书写方式完全一样：

 extension SomeType: SomeProtocol, AnotherProctocol 
 {
    // 协议实现写到这里
 }
 
 */





// MARK: - 1.扩展计算型属性
    //扩展可以为已有类型添加计算型实例属性和计算型类型属性
    //注意 : 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器

extension Double
{
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

// MARK: - 2.扩展构造器
    //扩展可以为已有类型添加新的构造器。
    //这可以让你扩展其它类型，将你自己的定制类型作为其构造器参数，或者提供该类型的原始实现中未提供的额外初始化选项
    //扩展能为类添加新的便利构造器，但是它们不能为类添加新的指定构造器或析构器。指定构造器和析构器必须总是由原始的类实现来提供
struct Size
{
    var width = 0.0, height = 0.0
}

struct Point
{
    var x = 0.0, y = 0.0
}

struct Rect
{
    var origin = Point()
    var size = Size()
}

extension Rect
{
    init(center: Point, size: Size)
    {
        //调用 Rect 结构体构造器
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY),size: size)
    }
}



// MARK: - 3. 方法扩展
    //扩展可以为已有类型添加新的实例方法和类型方法

extension Int
{
    func repetitions(task: () -> Void)
    {
        for _ in 0..<self
        {
            task()
        }
    }
}


// MARK: - 4. 可变实例方法
    //通过扩展添加的实例方法也可以修改该实例本身。
    //结构体和枚举类型中修改 self 或其属性的方法必须将该实例方法标注为 mutating，正如来自原始实现的可变方法一样

extension Int
{
    mutating func square()
    {
        self = self * self
    }
}

// MARK: - 5.下标
    //扩展可以为已有类型添加新下标

extension Int
{
    subscript(digitIndex: Int) -> Int
    {
        var decimalBase = 1
        for _ in 0..<digitIndex
        {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}


// MARK: - 6.扩展嵌套类型
    //扩展可以为已有的类、结构体和枚举添加新的嵌套类型
extension Int
{
    enum Kind
    {
        case Negative, Zero, Positive
    }
    var kind: Kind
    {
        switch self
        {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}


extension String
{
    
}