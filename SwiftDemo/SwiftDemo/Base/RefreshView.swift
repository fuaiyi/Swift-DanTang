//
//  RefreshView.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/26.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

class RefreshView: UIView
{

    @IBOutlet weak var arrowIcon: UIImageView!
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var loadingView: UIImageView!
    
    ///实例化
    class func refreshView() -> RefreshView
    {
        return NSBundle.mainBundle().loadNibNamed(String(self), owner: nil, options: nil).last as! RefreshView
    }
    
    //旋转箭头
    func rotationArrowIcon(flg : Bool)
    {
       
        var angle = M_PI
        angle += flg ? -0.01 : 0.01
        
        UIView.animateWithDuration(kAnimationDuration) { 
            self.arrowIcon.transform = CGAffineTransformRotate(self.arrowIcon.transform, CGFloat(angle))
        }
        
    }
    
    
    //开始转圈动画
    func startLoadingViewAnimaton()
    {
        
        tipView.hidden = true
        
        //创建动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * M_PI
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.removedOnCompletion = false
        loadingView.layer.addAnimation(animation, forKey: nil)
        
    }
    
    
    //停止转圈动画
    func stopLoadingViewAnimation()
    {
        
        tipView.hidden = false
        
        loadingView.layer.removeAllAnimations()
        
    }
    
}
