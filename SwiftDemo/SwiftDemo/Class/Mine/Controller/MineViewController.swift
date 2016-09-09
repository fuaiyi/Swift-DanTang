//
//  MineViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/31.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController
{
    
    //MARK: -
    //MARK: Global Variables
    
    private lazy var headerView : MainHeaderView =
        {
            
            let headerView = MainHeaderView()
            headerView.frame = CGRectMake(0, 0, SCREENW, kYMMineHeaderImageHeight)
            headerView.iconButton.addTarget(self, action: #selector(iconButtonClick), forControlEvents: .TouchUpInside)
            headerView.messageButton.addTarget(self, action: #selector(messageButtonClick), forControlEvents: .TouchUpInside)
            headerView.settingButton.addTarget(self, action: #selector(settingButtonClick), forControlEvents: .TouchUpInside)
            return headerView
            
    }()
    
    private var footerView : UIView =
        {
            
            let footerView = MeFooterView()
            footerView.width = SCREENW
            footerView.height = 200
            return footerView
            
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
        
        setupTableview()
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }

    
    
    //MARK: -
    //MARK: Interface Components
    
    func setupTableview()
    {
        
        let tableView = UITableView()
        
        tableView.frame = view.bounds
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
        
        view.addSubview(tableView)
        
    }
    
    //MARK: -
    //MARK: Target Action
    
    func iconButtonClick()
    {
        
    }
    
    func messageButtonClick()
    {
        
    }
    
    func settingButtonClick()
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
//MARK: Delegate

extension MineViewController: UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let choiceView = MeChoiceView()
        return choiceView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 44
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    
}

extension MineViewController : UIScrollViewDelegate
{
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < 0
        {
            var tempFrame = headerView.bgImageView.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = kYMMineHeaderImageHeight - offsetY
            headerView.bgImageView.frame = tempFrame
        }
        
    }
    
}



