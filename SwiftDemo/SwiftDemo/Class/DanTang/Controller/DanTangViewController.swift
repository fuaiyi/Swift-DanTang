//
//  DanTangViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/19.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class DanTangViewController: BaseViewController
{

    //MARK: -
    //MARK: Global Variables

    weak var titlesView = UIView()
    weak var indicatorView = UIView()
    weak var selectedButton = UIButton()
    weak var contentView = UIScrollView()
    
    
    //MARK: -
    //MARK: Public Methods
    
    
    //MARK: -
    //MARK: DataInitialize
    
    
    //MARK: -
    //MARK: Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        initializeNavigation()
        
        requestData()
    
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
    func initializeNavigation()
    {
        
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(searchClick(_:)))
        
    }
    
    func setupTitlesView()
    {
        
        //1.背景view
        let bgView = UIView()
        bgView.frame = CGRectMake(0, kTitlesViewY, SCREENW, kTitlesViewH)
        view.addSubview(bgView)

        
        //2.标签
        let titlesView = UIView()
        titlesView.backgroundColor = GlobalGrayColor()
        titlesView.frame = CGRectMake(0, 0, SCREENW - kTitlesViewH, kTitlesViewH)
        bgView .addSubview(titlesView)

        self.titlesView = titlesView
        
        
        //底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = GlobalReadColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.y = kTitlesViewH - kIndicatorViewH
        indicatorView.tag = -1
        self.indicatorView = indicatorView
        
        titlesView.addSubview(indicatorView)
        
        
        //选择按钮
        let arrowBuuton = UIButton()
        arrowBuuton.frame = CGRectMake(SCREENW - kTitlesViewH, 0, kTitlesViewH, kTitlesViewH)
        arrowBuuton.setImage(UIImage(named: "arrow_index_down_8x4_"), forState: .Normal)
        arrowBuuton.addTarget(self, action: #selector(arrowButtonClick(_:)), forControlEvents: .TouchUpInside)
        arrowBuuton.backgroundColor = GlobalGrayColor()
        bgView.addSubview(arrowBuuton)
        
        
        //内部子标签
        let count = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count
        {
            let vc = childViewControllers[index]
            
            let button = UIButton()
            button.width = width
            button.height = height
            button.x = CGFloat(index) * width
            button.tag = index
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            button.titleLabel?.sizeToFit()
            button.setTitle(vc.title, forState: .Normal)
            button.setTitleColor(UIColor.grayColor(), forState: .Normal)
            button.setTitleColor(GlobalReadColor(), forState: .Disabled)
            button.addTarget(self, action: #selector(titlesClick(_:)), forControlEvents: .TouchUpInside)
            titlesView.addSubview(button)
            
            //默认点击了第一个按钮
            if index == 0
            {
                button.enabled = false
                selectedButton = button
                indicatorView.centerX = button.centerX
                indicatorView.width = button.titleLabel!.width
            }
            
        }
        
    }
    
    func setupContentView()
    {
        
        automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.contentSize = CGSizeMake(contentView.width * CGFloat(childViewControllers.count), 0)
        contentView.pagingEnabled = true
        self.contentView = contentView
        
        view.insertSubview(contentView, atIndex: 0)
        
        //添加第一个控制器的view
        scrollViewDidEndScrollingAnimation(contentView)
        
    }
    
    
    //MARK: -
    //MARK: Target Action Methods
    
    func searchClick(sender : UIBarButtonItem)
    {
        
        Log("搜索")
        
    }
    
    func arrowButtonClick(button:UIButton)
    {
        
        UIView.animateWithDuration(kAnimationDuration)
        {
                button.imageView?.transform = CGAffineTransformRotate(button.imageView!.transform, CGFloat(M_PI))
        }
        
    }
    
    func titlesClick(sender:UIButton)
    {
        
        selectedButton?.enabled = true
        sender.enabled = false
        selectedButton = sender
        
        UIView.animateWithDuration(kAnimationDuration)
        {
            self.indicatorView?.width = sender.titleLabel!.width
            self.indicatorView?.centerX = sender.centerX
        }
        
        var offset = contentView!.contentOffset
        offset.x = CGFloat(sender.tag) * contentView!.width
        contentView?.setContentOffset(offset, animated: true)
    
    }
    
    //MARK: -
    //MARK: DataRequest
    
    func requestData()
    {
        Resquest.shanreRequest.loadHomeTopData { [weak self] (channels) in
            
            for channel in channels
            {
                let topicVc = TopicViewController()
                topicVc.title = channel.name
                topicVc.type = channel.id!
                self!.addChildViewController(topicVc)
            }
            
            self!.setupTitlesView()
            self!.setupContentView()
            
        }
    }
    
    //MARK: -
    //MARK: <#statement#> Delegate
    
    
    //MARK: -
    //MARK: Dealloc
    
    
    //MARK: -
    //MARK: Private Methods
    

    
    
}


//MARK: -
//MARK: UIScrollViewDelegate

extension DanTangViewController : UIScrollViewDelegate
{
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView)
    {
        
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        
        scrollView .addSubview(vc.view)

    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView)
    {
        
        scrollViewDidEndScrollingAnimation(scrollView)
        
        let  index  = Int(scrollView.contentOffset.x / scrollView.width)
        
        let clickButton = titlesView!.subviews[index + 1] as! UIButton
        titlesClick(clickButton)
        
    }
    
}
