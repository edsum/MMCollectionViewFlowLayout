//
//  CubeAttributesTransition.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

/// 3D翻转
public struct CubeAttributesTransition: MMLayoutProtocol {
    
    /// 透视度
    /// [-1/2000, -1/200]，必须为负数，默认是-1/500
    public var perspective: CGFloat
    
    /// 旋转最大角度
    public var totalAngle: CGFloat
    
    public init(perspective: CGFloat = -1/500, totalAngle: CGFloat = CGFloat(Double.pi/2)) {
        self.perspective = perspective
        self.totalAngle = totalAngle
    }
    
    public func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes) {
        if abs(position) >= 1 {
            attributes.contentView?.layer.transform = CATransform3DIdentity
        }else {
            let rotateAngle: CGFloat = totalAngle*position
            var transform: CATransform3D = CATransform3DIdentity
            transform.m34 = perspective
            transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0)
            
            // attributes.transform = transform
            attributes.contentView?.layer.transform = transform
            attributes.contentView?.keepCenterAndApplyAnchorPoint(CGPoint(x: position > 0 ? 0 : 1, y: 0.5))
        }
    }
}
