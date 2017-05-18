//
//  TurnAttributesTransition.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

/// 翻页渐隐
public struct TurnAttributesTransition: MMLayoutProtocol {
    
    /// 透视度
    /// [-1/2000, -1/200]，必须为负数，默认是-1/1000
    public var perspective: CGFloat
    
    public init(perspective: CGFloat = -1/1000) {
        self.perspective = perspective
    }
    
    public func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes) {
        if abs(position) >= 1{
            attributes.contentView?.layer.transform = CATransform3DIdentity
        }else {
            let rotateAngle: CGFloat = CGFloat(Double.pi/2)*min(position, 0)
            var transform: CATransform3D = CATransform3DIdentity
            transform.m34 = perspective
            transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0)
            
            let contentOffset: CGPoint = collectionView.contentOffset
            let itemOrigin: CGPoint = attributes.frame.origin
            transform = CATransform3DTranslate(transform, contentOffset.x-itemOrigin.x, 0, 0)
            transform = CATransform3DScale(transform, 1.0, 0.8, 1.0)
            
            attributes.contentView?.layer.transform = transform
            attributes.contentView?.keepCenterAndApplyAnchorPoint(CGPoint(x: 0, y: 0.5))
            attributes.alpha = 1-abs(position)
        }
    }
}
