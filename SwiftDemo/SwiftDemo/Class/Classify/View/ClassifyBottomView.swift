//
//  ClassifyBottomView.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/31.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

protocol ClassifyBottomViewDelegate : NSObjectProtocol
{
    func bottomViewButtonDidClicked()
}

class ClassifyBottomView: UIView
{

    //MARK: -
    //MARK: Global Variables
    
    weak var delegate : ClassifyBottomViewDelegate?
    private var groups = [AnyObject]()
    
    
    //MARK: -
    //MARK: Life Cycle
    
    override init(frame: CGRect)
    {
        
        super.init(frame: frame)
        
        loadClassData()
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -
    //MARK: Interface Components
    
    private func setupUI()
    {
        
        let topGroups = groups[0] as! NSArray
        let bottomGroups = groups[1] as! NSArray
        
        
        ///风格
        let topView = UIView()
        topView.width = SCREENW
        topView.backgroundColor = UIColor.whiteColor()
        addSubview(topView)
        
        let styleLabel = setupLabel("风格")
        topView.addSubview(styleLabel)
        
        for index in 0..<topGroups.count
        {
            let group = topGroups[index] as! Group
            let button = setupButton(index, group: group)
            topView.addSubview(button)
            
            if index == topGroups.count - 1
            {
                topView.height = CGRectGetMaxY(button.frame) + kMargin
            }
        }
        
        
        ///品类
        let bottomView = UIView()
        bottomView.width = SCREENW
        bottomView.y = CGRectGetMaxY(topView.frame) + kMargin
        bottomView.backgroundColor = UIColor.whiteColor()
        addSubview(bottomView)
        let categoryLabel = setupLabel("品类")
        bottomView.addSubview(categoryLabel)
        
        for index in 0..<bottomGroups.count
        {
            let group = bottomGroups[index] as! Group
            let button = setupButton(index, group: group)
            bottomView.addSubview(button)
            if index == bottomGroups.count - 1
            {
                bottomView.height = CGRectGetMaxY(button.frame) + kMargin
            }
        }
        
    }
    
    private func setupButton(index: Int, group: Group) -> VerticalButton
    {
        
        let buttonW: CGFloat = SCREENW / 4
        let buttonH: CGFloat = buttonW
        let styleLabelH: CGFloat = 40
        
        let button = VerticalButton()
        button.width = buttonW
        button.height = buttonH
        button.x = buttonW * CGFloat(index % 4)
        button.y = buttonH * CGFloat(index / 4) + styleLabelH
        if index > 3
        {
            button.y = buttonH * CGFloat(index / 4) + styleLabelH + kMargin
        }
        button.tag = group.id!
        button.addTarget(self, action: #selector(groupButonClick(_:)), forControlEvents: .TouchUpInside)
        button.titleLabel?.font = UIFont.systemFontOfSize(15)
        button.setTitleColor(RGBColor(0, g: 0, b: 0, a: 0.6), forState: .Normal)
        button.kf_setImageWithURL(NSURL(string: group.icon_url!)!, forState: .Normal)
        button.setTitle(group.name, forState: .Normal)
        return button
        
    }
    
    private func setupLabel(title: String) -> UILabel
    {
        
        let styleLabel = UILabel(frame: CGRectMake(10, 0, SCREENW - 10, 40))
        styleLabel.text = title
        styleLabel.textColor = RGBColor(0, g: 0, b: 0, a: 0.6)
        styleLabel.font = UIFont.systemFontOfSize(16)
        return styleLabel
        
    }
    
    //MARK: -
    //MARK: Data Request
    
    private func loadClassData()
    {
        
        Resquest.shanreRequest.loadCategoryGroup { [weak self] (groups) in
            self?.groups = groups
            self?.setupUI()
        }
        
    }
    
    
    //MARK: -
    //MARK: Target Action

    @objc private func groupButonClick(sender : UIButton)
    {
        
        delegate?.bottomViewButtonDidClicked()
        
    }

    
    

}
