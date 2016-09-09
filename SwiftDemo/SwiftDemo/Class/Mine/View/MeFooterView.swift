//
//  MeFooterView.swift
//  SwiftDemo
//
//  Created by gaofu on 16/9/2.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class MeFooterView: UIView
{
    
    //MARK: -
    //MARK: Global Variables
    
    
    //MARK: -
    //MARK: Lazy Components
    
    private lazy var meBlankButton : UIButton =
        {
        
            let meBlankButton = UIButton()
            
            meBlankButton.setTitleColor(RGBColor(200, g: 200, b: 200, a: 1.0), forState: .Normal)
            meBlankButton.width = 100
            meBlankButton.titleLabel?.font = UIFont.systemFontOfSize(15)
            meBlankButton.setImage(UIImage(named: "Me_blank_50x50_"), forState: .Normal)
            meBlankButton.addTarget(self, action: #selector(footerViewButtonClick), forControlEvents: .TouchUpInside)
            meBlankButton.imageView?.sizeToFit()
            
            return meBlankButton
            
    }()
    
    private lazy var messageLabel : UILabel =
        {
            
            let messageLabel = UILabel()
            
            messageLabel.text = "登录以享受功能"
            messageLabel.textAlignment = .Center
            messageLabel.font = UIFont.systemFontOfSize(15)
            messageLabel.textColor = RGBColor(200, g: 200, b: 200, a: 1.0)
            
            return messageLabel
            
    }()
    
    //MARK: -
    //MARK: Public Methods
    
    
    //MARK: -
    //MARK: Data Initialize
    
    
    //MARK: -
    //MARK: Life Cycle
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
    func setupUI()
    {
        
        addSubview(meBlankButton)
        addSubview(messageLabel)
        
        meBlankButton.snp_makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(CGSizeMake(50, 50))
        }
        
        messageLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(meBlankButton.snp_bottom).offset(kMargin)
        }
        
    }
    
    //MARK: -
    //MARK: Target Action
    
    func footerViewButtonClick()
    {
        
        
        
    }
    
    //MARK: -
    //MARK: Data Request
    
    
    //MARK: -
    //MARK: Private Methods
    
    
    //MARK: -
    //MARK: Dealloc
    
    
}


//MARK: -
//MARK: <#statement#> Delegate



