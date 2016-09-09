//
//  ProductViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/19.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

private let collectionCellID = "ProductCollectionViewCell"

class ProductViewController: BaseViewController {
    
    //MARK: -
    //MARK: Global Variables
    
    var products = [Product]()
    
    
    private lazy var productCollectionView : UICollectionView =
        {
            
            let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            collectionView.backgroundColor = self.view.backgroundColor
            
            let nib = UINib(nibName: String(ProductCollectionViewCell), bundle: nil)
            collectionView.registerNib(nib, forCellWithReuseIdentifier: collectionCellID)
            
            return collectionView
            
    }();
    
    
    //MARK: -
    //MARK: Public Methods
    
    
    //MARK: -
    //MARK: DataInitialize
    
    
    //MARK: -
    //MARK: Lifecycle
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        setupCollectionView()
        
        getProsucts()
        
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
    private func setupCollectionView()
    {
        
        view.addSubview(productCollectionView)
        
    }
    
    
    //MARK: -
    //MARK: Target Action Methods
    
    
    //MARK: -
    //MARK: DataRequest
    
    func getProsucts()
    {
        
        Resquest.shanreRequest.loadProductData { [weak self] (products) in
            self?.products = products
            self?.productCollectionView.reloadData()
        }
        
    }
    
    //MARK: -
    //MARK: Dealloc
    
    
    //MARK: -
    //MARK: Private Methods
    
    
    
}


//MARK: -
//MARK: UICollectionView Delegate

extension ProductViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ProductCollectionViewCellDelegate
{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return products.count ?? 0
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        
        let width: CGFloat = (UIScreen.mainScreen().bounds.width - 20) / 2
        let height: CGFloat = 245
        return CGSizeMake(width, height)
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let productCell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellID, forIndexPath: indexPath) as! ProductCollectionViewCell
        
        productCell.delegate = self
        productCell.product = products[indexPath.item]
        
        return productCell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        Log("点击了cell")
    }
    
    func collectionViewCellDidClickedLikeButton(button: UIButton)
    {
        
        Log("点击了喜欢")
        
    }
    
}



