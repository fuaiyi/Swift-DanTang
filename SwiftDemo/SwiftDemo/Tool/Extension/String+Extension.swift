//
//  String+Extension.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/24.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import Foundation

extension String
{
    
    ///1. 判断手机号是否合法
    func isValidmobile(number:String) -> Bool
    {
        let patternString = "^1[3|4|5|7|8][0-9]\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES%@", patternString)
        return predicate.evaluateWithObject(number)
    }
    
    ///2. 判断证密码是否合法
    func isValidPasswod(string: String) -> Bool
    {
        // 验证密码是 6 - 16 位字母或数字
        let patternString = "^[0-9A-Za-z]{6,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluateWithObject(string)
    }
    
    ///3. 获取长度
    var length: Int
    {
        return self.characters.count
    }
    

    
    
}