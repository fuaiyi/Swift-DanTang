//
//  MeChoiceView.swift
//  SwiftDemo
//
//  Created by gaofu on 16/9/2.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class MeChoiceView: UIView
{
    
    //MARK: -
    //MARK: Global Variables
    
    private lazy var leftButton : UIButton =
        {
        
            let leftButton = UIButton()
            
            leftButton.setTitle("喜欢的商品", forState: .Normal)
            leftButton.titleLabel?.font = UIFont.systemFontOfSize(16)
            leftButton.setTitleColor(RGBColor(0, g: 0, b: 0, a: 0.7), forState: .Normal)
            leftButton.backgroundColor = UIColor.whiteColor()
            leftButton.addTarget(self, action: #selector(leftButtonClick(_:)), forControlEvents: .TouchUpInside)
            leftButton.layer.borderWidth = klineWidth
            leftButton.layer.borderColor = RGBColor(230, g: 230, b: 230, a: 1.0).CGColor
            leftButton.selected = true
            
            return leftButton
            
    }()
    
    private lazy var rightButton : UIButton =
        {
            
            let rightButton = UIButton()
            
            rightButton.setTitle("喜欢的专题", forState: .Normal)
            rightButton.titleLabel?.font = UIFont.systemFontOfSize(16)
            rightButton.setTitleColor(RGBColor(0, g: 0, b: 0, a: 0.7), forState: .Normal)
            rightButton.backgroundColor = UIColor.whiteColor()
            rightButton.addTarget(self, action: #selector(rightButtonClick(_:)), forControlEvents: .TouchUpInside)
            rightButton.layer.borderWidth = klineWidth
            rightButton.layer.borderColor = RGBColor(230, g: 230, b: 230, a: 1.0).CGColor

            return rightButton
            
    }()
    
    private lazy var indicatorView : UIView =
        {
            
            let indicatorView = UIView()
            
            indicatorView.backgroundColor = GlobalReadColor()
            
            return indicatorView
            
    }()
    
    //MARK: -
    //MARK: Lazy Components
    
    
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
    
    private func setupUI()
    {
        
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(indicatorView)
        
        
        leftButton.snp_makeConstraints { (make) in
            make.left.height.equalTo(self)
            make.width.equalTo(rightButton)
        }
        
        rightButton.snp_makeConstraints { (make) in
            make.right.height.equalTo(self)
            make.left.equalTo(leftButton.snp_right)
        }
        
        indicatorView.snp_makeConstraints { (make) in
            make.width.equalTo(leftButton)
            make.height.equalTo(kIndicatorViewH)
            make.bottom.left.equalTo(self)
        }
        
    }
    
    
    //MARK: -
    //MARK: Target Action
    
    @objc private func leftButtonClick(sender : UIButton)
    {
        
        sender.selected = !sender.selected
        UIView.animateWithDuration(kAnimationDuration) {
            self.indicatorView.x = 0
        }
        
    }
    
    
    @objc private func rightButtonClick(sender : UIButton)
    {
        
        sender.selected = !sender.selected
        UIView.animateWithDuration(kAnimationDuration) {
            self.indicatorView.x = SCREENW * 0.5
        }
        
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



