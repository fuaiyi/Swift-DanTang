//
//  Group.swift
//  SwiftDemo
//
//  Created by gaofu on 16/9/1.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class Group: BaseModel
{
    var status: Int?
    
    var group_id: Int?
    
    var id: Int?
    
    var items_count: Int?
    
    var order: Int?
    
    var icon_url: String?
    
    var name: String?
    
    override init(dict: [String: AnyObject])
    {
        super.init(dict: dict)
        
        status = dict["status"] as? Int
        group_id = dict["group_id"] as? Int
        items_count = dict["items_count"] as? Int
        id = dict["id"] as? Int
        order = dict["order"] as? Int
        icon_url = dict["icon_url"] as? String
        name = dict["name"] as? String
    }

}
