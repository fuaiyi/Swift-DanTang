//
//  BaseRefreshControl.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/26.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit
import SnapKit

class BaseRefreshControl: UIRefreshControl
{
    
    private var rotationArrowFlag = false
    private var loadingViewAnimationFlag = false
    
    // MARK: - 懒加载
    private lazy var refreshView: RefreshView = RefreshView.refreshView()
    
    override init()
    {
        super.init()
        
        setupUI()
    }
    
    
    func setupUI()
    {
        
        addSubview(refreshView)
        
        refreshView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(CGSizeMake(170, 60))
        }
        
        addObserver(self, forKeyPath: "frame", options: .New, context: nil)
        
    }
    
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>)
    {
         /*
         1.当用户下拉到一定程度的时候需要旋转箭头
         2.当用户上推到一定程度的时候需要旋转箭头
         3.当下拉刷新控件触发刷新方法的时候, 需要显示刷新界面(转轮)
         
         通过观察:
         越往下拉: 值就越小
         越往上推: 值就越大
         */
        
        //过滤数据
        if frame.origin.y > 0
        {
            return
        }
        
        //判断是否触发刷新事件
        if refreshing && !loadingViewAnimationFlag
        {
            //执行动画
            loadingViewAnimationFlag = true
            
            refreshView.startLoadingViewAnimaton()
            
            return
        }

        if frame.origin.y >= -40 && rotationArrowFlag
        {
            rotationArrowFlag = false
            refreshView.rotationArrowIcon(rotationArrowFlag)
        }
        else if frame.origin.y < -40 && !rotationArrowFlag
        {
            rotationArrowFlag = true
            refreshView.rotationArrowIcon(rotationArrowFlag)
        }
        
    }
    
    
    //结束刷新
    override func endRefreshing()
    {
        
        super.endRefreshing()
        
        //关闭圈圈动画
        refreshView.stopLoadingViewAnimation()
        
        loadingViewAnimationFlag = false
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
