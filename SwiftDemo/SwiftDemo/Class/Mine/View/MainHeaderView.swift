//
//  MainHeaderView.swift
//  SwiftDemo
//
//  Created by gaofu on 16/9/1.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class MainHeaderView: UIView
{
    
    //MARK: -
    //MARK: Global Variables
    
    
    //MARK: -
    //MARK: Lazy Components
    
    lazy var bgImageView : UIImageView =
        {
            
            let bgImageView = UIImageView()
            bgImageView.contentMode = .ScaleAspectFill
            bgImageView.image = UIImage(named: "Me_ProfileBackground")
    
            return bgImageView
            
    }()
    
    lazy var messageButton : UIButton =
        {
            
            let messageButton = UIButton()
            messageButton.setImage(UIImage(named: "Me_message_20x20_"), forState: .Normal)

            return messageButton
            
    }()
    
    lazy var settingButton : UIButton =
        {
            
            let settingButton = UIButton()
            settingButton.setImage(UIImage(named: "Me_settings_20x20_"), forState: .Normal)
            
            return settingButton
            
    }()
    
    lazy var iconButton : UIButton =
        {
            
            let iconButton = UIButton()
            iconButton.setBackgroundImage(UIImage(named: "Me_AvatarPlaceholder_75x75_"), forState: .Normal)
            iconButton.layer.cornerRadius = iconButton.width * 0.5
            iconButton.layer.masksToBounds = true
            
            return iconButton
            
    }()
    
    private lazy var nameLabel : UILabel =
        {
            
            let nameLabel = UILabel()
            nameLabel.text = "fuaiyi"
            nameLabel.textColor = UIColor.whiteColor()
            nameLabel.font = UIFont.systemFontOfSize(15.0)
            nameLabel.textAlignment = .Center
            
            return nameLabel
            
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        
        
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
    func setupUI()
    {
        
        /// 添加子控件
        addSubview(bgImageView)
        addSubview(settingButton)
        addSubview(messageButton)
        addSubview(iconButton)
        addSubview(nameLabel)
        
        
        ///布局
        bgImageView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.top.equalTo(-20)
        }
        
        messageButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(44, 44))
            make.left.equalTo(self)
            make.top.equalTo(self.settingButton.snp_top)
        }
        
        settingButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(44, 44))
            make.right.equalTo(self)
            make.top.equalTo(0)
        }
        
        iconButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.centerX)
            make.size.equalTo(CGSizeMake(75, 75))
            make.bottom.equalTo(self.nameLabel.snp_top).offset(-kMargin)
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.snp_bottom).offset(-3 * kMargin)
            make.left.right.equalTo(self)
            make.height.equalTo(2 * kMargin)
        }
        
    }
    
    //MARK: -
    //MARK: Target Action
    
    
    //MARK: -
    //MARK: Data Request
    
    
    //MARK: -
    //MARK: Private Methods
    
    
    //MARK: -
    //MARK: Dealloc
    
    
}


//MARK: -
//MARK: <#statement#> Delegate



