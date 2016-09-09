//
//  ProductCollectionViewCell.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/31.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

protocol ProductCollectionViewCellDelegate : NSObjectProtocol
{
    
    func collectionViewCellDidClickedLikeButton( button : UIButton )
    
}


class ProductCollectionViewCell: UICollectionViewCell
{
    
    weak var delegate : ProductCollectionViewCellDelegate?
    
    
    // 占位图片
    @IBOutlet weak var placeholderBtn: UIButton!
    // 背景图片
    @IBOutlet weak var productImageView: UIImageView!
    // 标题
    @IBOutlet weak var titleLabel: UILabel!
    // 价格
    @IBOutlet weak var priceLabel: UILabel!
    // 喜欢按钮
    @IBOutlet weak var likeButton: UIButton!
    
    
    var product : Product?
    {
        didSet
        {
            
            let url = product!.cover_image_url!
            productImageView.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            likeButton.setTitle(" " + String(product!.favorites_count!) + " ", forState: .Normal)
            titleLabel.text = product!.name
            priceLabel.text = "￥" + String(product!.price!)
            
        }
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }
    
    @IBAction func likeButtonClick(sender: UIButton)
    {
        delegate?.collectionViewCellDidClickedLikeButton(sender)
    }

}
