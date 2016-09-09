//
//  UIView+Extension.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/24.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit

extension UIView
{
    
    ///1.动画
    func animateWhenClicked()
    {
        
        self.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        self.layer.transform = CATransform3DMakeScale(1, 1, 0)
        UIView.animateWithDuration(0.9, animations: {
            self.backgroundColor = UIColor.whiteColor()
            self.layer.transform = CATransform3DMakeTranslation(1, 1, 1)
        })
        
    }
    
    ///2. 裁剪 view 的圆角
    func clipRectCorner(direction:UIRectCorner,cornerRadius:CGFloat)
    {
        let cornerSize = CGSizeMake(cornerRadius, cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.CGPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
    ///3. x
    var x: CGFloat
        {
        get
        {
            return frame.origin.x
        }
        set(newValue)
        {
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame  = tempFrame
        }
    }
    
    ///4. y
    var y: CGFloat
        {
        get
        {
            return frame.origin.y
        }
        set(newValue)
        {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    ///5. height
    var height: CGFloat
        {
        get
        {
            return frame.size.height
        }
        set(newValue)
        {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    ///6. width
    var width: CGFloat
        {
        get
        {
            return frame.size.width
        }
        set(newValue)
        {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    ///7. size
    var size: CGSize
        {
        get
        {
            return frame.size
        }
        set(newValue)
        {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    ///8. centerX
    var centerX: CGFloat
        {
        get
        {
            return center.x
        }
        set(newValue)
        {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    ///9. centerY
    var centerY: CGFloat
        {
        get
        {
            return center.y
        }
        set(newValue)
        {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
    
}