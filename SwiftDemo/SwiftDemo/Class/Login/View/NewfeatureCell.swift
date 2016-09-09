//
//  NewfeatureCell.swift
//  SwiftDemo
//
//  Created by gaofu on 16/9/2.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class NewfeatureCell: UICollectionViewCell
{
    
    //MARK: -
    //MARK: Global Variables
    
    var imageIndex : Int?
        {
        didSet
        {
            iconView.image = UIImage(named: "walkthrough_\(imageIndex! + 1)")
        }
    }
    
    
    //MARK: -
    //MARK: Lazy Components
    
    private lazy var iconView = UIImageView()
    
    private lazy var startButton : UIButton =
        {
            
            let startButton = UIButton()
            
            startButton.setBackgroundImage(UIImage(named: "btn_begin"), forState: .Normal)
            startButton.addTarget(self, action: #selector(startButtonClick), forControlEvents: .TouchUpInside)
            startButton.layer.masksToBounds = true
            startButton.hidden = true
            
            return startButton
            
    }()
    
    //MARK: -
    //MARK: Public Methods
    
    func startBtnAnimation()
    {
        
        startButton.hidden = false
        // 执行动画
        startButton.transform = CGAffineTransformMakeScale(0.0, 0.0)
        startButton.userInteractionEnabled = false
        
        // UIViewAnimationOptions(rawValue: 0) == OC knilOptions
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .TransitionNone, animations: {
            self.startButton.transform = CGAffineTransformIdentity
        }) { (_) in
            self.startButton.userInteractionEnabled = true
        }
    
    }
    
    func endAnimation()
    {
        
        startButton.hidden = true
        
    }
    
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
        
        addSubview(iconView)
        addSubview(startButton)
        
        
        iconView.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        startButton.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.snp_bottom).offset(-50)
            make.size.equalTo(CGSizeMake(150, 40))
            make.centerX.equalTo(0)
        }
        
    }
    
    //MARK: -
    //MARK: Target Action
    
    @objc private func startButtonClick()
    {
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = BaseTabBarController()
        
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



