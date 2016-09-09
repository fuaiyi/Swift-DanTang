//
//  ProductTopHeaderView.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/31.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

protocol ProductTopHeaderViewDelegate : NSObjectProtocol
{
    
    func topViewDidClickedMoreButton(sender : UIButton)

}

class ProductTopHeaderView: UIView
{

    weak var delegate : ProductTopHeaderViewDelegate?
    
    /// 查看全部按钮
    @IBAction func viewAllButton(sender: UIButton)
    {
        
        delegate?.topViewDidClickedMoreButton(sender)
        
    }

}
