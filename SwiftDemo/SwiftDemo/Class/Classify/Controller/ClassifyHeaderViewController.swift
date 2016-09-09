//
//  ClassifyHeaderViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/31.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

private let ClassifyHeaderCollectionViewCellID = "ClassifyHeaderCollectionViewCell"

class ClassifyHeaderViewController: BaseViewController
{
    
    //MARK: -
    //MARK: Global Variables
    
    var collectionView : UICollectionView?
    var collections = [Collection]()
    
    
    //MARK: -
    //MARK: Public Methods
    
    
    //MARK: -
    //MARK: DataInitialize
    
    
    //MARK: -
    //MARK: Lifecycle
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        setupComponents()
        
        loadNetworkData()
        
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
    func setupComponents()
    {
        
        let headerView = NSBundle.mainBundle().loadNibNamed(String(ProductTopHeaderView), owner: nil, options: nil).last as! ProductTopHeaderView
        headerView.frame = CGRectMake(0, 0, SCREENW, 40)
        headerView.delegate = self
        view.addSubview(headerView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        
        let collectionView = UICollectionView(frame: CGRectMake(0, CGRectGetMaxY(headerView.frame), SCREENW, 95), collectionViewLayout: flowLayout)
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteColor()
        
        let nib = UINib(nibName: String(ClassifyHeaderCollectionViewCell), bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: ClassifyHeaderCollectionViewCellID)
        view.addSubview(collectionView)
        
        self.collectionView = collectionView
        
    }
    
    //MARK: -
    //MARK: Target Action Methods
    
    
    //MARK: -
    //MARK: DataRequest
    
    func loadNetworkData()
    {
        
        Resquest.shanreRequest.loadCategoryCollection(6) { [weak self] (collections) in
            self!.collections = collections
            self!.collectionView?.reloadData()
        }
        
    }
    
    //MARK: -
    //MARK: Private Methods
    
    
    //MARK: -
    //MARK: Dealloc
    
    
}


//MARK: -
//MARK:  Delegate

extension ClassifyHeaderViewController : ProductTopHeaderViewDelegate
{
    
    func topViewDidClickedMoreButton(sender: UIButton)
    {
        Log("Load More...")
    }
    
}

extension ClassifyHeaderViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return collections.count ?? 0
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ClassifyHeaderCollectionViewCellID, forIndexPath: indexPath) as! ClassifyHeaderCollectionViewCell
        cell.collection = collections[indexPath.item]
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        
        return CGSizeMake(kitemW, kitemH)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        
        return UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin)
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
        
        
    }
    
}