//
//  Channel.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/26.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class Channel: BaseModel
{
    var editable: Bool?
    var id: Int?
    var name: String?
    
     override init(dict: [String: AnyObject])
    {
        
        super.init(dict:dict)
        
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
        
    }
    
}
