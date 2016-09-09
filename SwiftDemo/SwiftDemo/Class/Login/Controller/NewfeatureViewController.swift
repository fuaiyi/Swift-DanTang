//
//  NewfeatureViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/9/2.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

private let newFeatureID = "newFeatureCell"

class NewfeatureViewController: UICollectionViewController
{
    
    //MARK: -
    //MARK: Global Variables
    
    
    //MARK: -
    //MARK: Lazy Components
    
    
    //MARK: -
    //MARK: Public Methods
    
    
    //MARK: -
    //MARK: Data Initialize
    
    
    //MARK: -
    //MARK: Life Cycle
    
    init()
    {
        
        super.init(collectionViewLayout: NewfeatureLayout())
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.pagingEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        collectionView?.registerClass(NewfeatureCell.classForCoder(), forCellWithReuseIdentifier: newFeatureID)
        
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
    
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

extension NewfeatureViewController
{
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return kNewFeatureCount
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(newFeatureID, forIndexPath: indexPath) as! NewfeatureCell
        cell.imageIndex = indexPath.item
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath)
    {
        
        let  cell  = cell as! NewfeatureCell
        
        cell.endAnimation()
        
    }
    
    
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath)
    {
        
        let path = collectionView.indexPathsForVisibleItems().last!
        let cell = collectionView.cellForItemAtIndexPath(path) as! NewfeatureCell
        
        if path.item == (kNewFeatureCount - 1)
        {
            cell.startBtnAnimation()
        }
        
    }
    
}


private class NewfeatureLayout: UICollectionViewFlowLayout
{
    
    override func prepareLayout()
    {
        
        itemSize = UIScreen.mainScreen().bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        
    }
    
}

