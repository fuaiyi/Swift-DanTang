//
//  HomeCell.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/26.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit
import Kingfisher

protocol HomeCellDelegate : NSObjectProtocol
{
    func homeCellDidClickedFavoriteButton(sender : UIButton)
}

class HomeCell: UITableViewCell
{
    /// 代理
    weak var delegate : HomeCellDelegate?
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var placeholderBtn: UIButton!
    
    
    var homeItem : HomeItem?
    {
        didSet
        {
            
            let url = homeItem?.cover_image_url
            bgImageView.kf_setImageWithURL(NSURL(string: url!), placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            
            titleLabel.text = homeItem!.title
            favoriteBtn.setTitle(" " + String(homeItem!.likes_count!) + " ", forState: .Normal)
            
        }
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        favoriteBtn.layer.cornerRadius = favoriteBtn.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.rasterizationScale = UIScreen.mainScreen().scale
        favoriteBtn.layer.shouldRasterize = true
        
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.mainScreen().scale
        
    }

    
    /// 点击了喜欢按钮
    @IBAction func favoriteButtonClick(sender: UIButton)
    {
        delegate?.homeCellDidClickedFavoriteButton(sender)
    }
    
}
