//
//  ClassifyViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/19.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class ClassifyViewController: BaseViewController
{
    
    //MARK: -
    //MARK: Global Variables
    
    private lazy var contentScorllerView : UIScrollView =
        {
            
            let scrollerView = UIScrollView()
            
            scrollerView.frame = self.view.bounds
            scrollerView.scrollEnabled = true
            scrollerView.backgroundColor = GlobalGrayColor()
            
            return scrollerView
            
    }()
    
    //MARK: -
    //MARK: Public Methods
    
    
    //MARK: -
    //MARK: Data Initialize
    
    
    //MARK: -
    //MARK: Life Cycle
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        setupNavigation()
        
        setupScrollerView()
        
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
    func setupNavigation()
    {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(searchClick))
        
    }
    
    func setupScrollerView()
    {
        
        view.addSubview(contentScorllerView)
        
        
        // 顶部控制器
        let headerViewController = ClassifyHeaderViewController()
        addChildViewController(headerViewController)
        
        
        let topBgView = UIView()
        
        topBgView.frame = CGRectMake(0, 0, SCREENW, 135)
        contentScorllerView.addSubview(topBgView)
        
        let headerVC = childViewControllers[0]
        topBgView.addSubview(headerVC.view)
        
        
        let bottpmBgView = ClassifyBottomView()
        
        bottpmBgView.frame = CGRectMake(0, CGRectGetMaxY(topBgView.frame) + 10, SCREENW, SCREENH - 160)
        bottpmBgView.backgroundColor = GlobalGrayColor()
        bottpmBgView.delegate = self
        contentScorllerView.addSubview(bottpmBgView)
        
        contentScorllerView.contentSize = CGSizeMake(SCREENW, CGRectGetMaxY(bottpmBgView.frame))
        
        
    }
    
    //MARK: -
    //MARK: Target Action
    
    func searchClick()
    {
        Log("点击了搜索")
    }
    
    //MARK: -
    //MARK: Data Request
    
    
    //MARK: -
    //MARK: Dealloc
    
    
    //MARK: -
    //MARK: Private Methods
    
    
}

//MARK: -
//MARK:  Delegate

extension ClassifyViewController : ClassifyBottomViewDelegate
{
    
    func bottomViewButtonDidClicked()
    {
        Log("Click It...")
    }
    
}
