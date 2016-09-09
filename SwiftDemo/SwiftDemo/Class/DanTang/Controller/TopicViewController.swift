//
//  TopicViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/26.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

private let homeCellID = "homeCellID"

class TopicViewController: BaseTableViewController
{

    //MARK: -
    //MARK: Global Variables
    
    var type = Int()
    
    var items = [HomeItem]()
    
    
    
    //MARK: -
    //MARK: Public Methods
    
    
    //MARK: -
    //MARK: DataInitialize
    
    
    //MARK: -
    //MARK: Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = GlobalGrayColor()
        
        setupTableview()
        
        setupRefresh()
        
        loadHomeData()
        
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
    func setupTableview()
    {
        
        tableView.rowHeight = 160
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        
        let nib = UINib(nibName: String(HomeCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: homeCellID)
        
    }
    
    
    func setupRefresh()
    {
        
        refreshControl = BaseRefreshControl()
        refreshControl?.beginRefreshing()
        refreshControl?.addTarget(self, action: #selector(loadHomeData), forControlEvents: .ValueChanged)
        
    }
    
    //MARK: -
    //MARK: Target Action Methods
    
    func loadHomeData()
    {
        
        Resquest.shanreRequest.loadHomeInfo(type) { [weak self] (homeItems) in
            self?.items = homeItems
            self?.tableView.reloadData()
            self?.refreshControl?.endRefreshing()
        }
        
    }
    
    //MARK: -
    //MARK: DataRequest
    
    
    
    //MARK: -
    //MARK: Dealloc
    
    
    //MARK: -
    //MARK: Private Methods
    

    
}



//MARK:-
//MARK: Delegate

extension TopicViewController : HomeCellDelegate
{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count ?? 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {

        let homeCell = tableView.dequeueReusableCellWithIdentifier(homeCellID) as! HomeCell
        
        homeCell.selectionStyle = .None
        homeCell.homeItem = items[indexPath.row]
        homeCell.delegate = self
        
        return homeCell

    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        let webView = BaseWebViewController()
        webView.requestUrl = items[indexPath.row].content_url
        navigationController?.pushViewController(webView, animated: true)
        
    }
    
    
    func homeCellDidClickedFavoriteButton(sender: UIButton)
    {
        
    }
    
}

