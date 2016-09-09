//
//  ClassifyHeaderCollectionViewCell.swift
//  SwiftDemo
//
//  Created by gaofu on 16/9/1.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class ClassifyHeaderCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var placeholderButton: UIButton!
    @IBOutlet weak var collectionImageView: UIImageView!

    var collection : Collection?
    {
        didSet
        {
            guard let imageurl = collection?.banner_image_url else { return }
            collectionImageView.kf_setImageWithURL(NSURL(string: imageurl), placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderButton.hidden = true
            }
        }
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }

}
