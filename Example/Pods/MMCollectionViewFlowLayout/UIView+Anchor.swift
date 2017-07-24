//
//  UIView+Anchor.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

extension UIView {
    func keepCenterAndApplyAnchorPoint(_ point: CGPoint) {
        
        guard layer.anchorPoint != point else {
            return
        }
        
        var newPoint: CGPoint = CGPoint(x: bounds.width*point.x, y: bounds.height*point.y)
        var oldPoint: CGPoint = CGPoint(x: bounds.width*layer.anchorPoint.x, y: bounds.height*layer.anchorPoint.y)
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var c: CGPoint = layer.position
        c.x -= oldPoint.x
        c.x += newPoint.x
        
        c.y -= oldPoint.y
        c.y += newPoint.y
        
        layer.position = c
        layer.anchorPoint = point
    }
}
