//
//  PageAttributesTransition.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

/// 覆盖效果
public struct PageAttributesTransition: MMLayoutProtocol {
    
    public var scaleRate: CGFloat
    
    public init(scaleRate: CGFloat = 0.2) {
        self.scaleRate = scaleRate
    }
    
    public func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes) {
        let contentOffset: CGPoint = collectionView.contentOffset
        let itemOrigin: CGPoint = attributes.frame.origin
        let scaleFactor: CGFloat = scaleRate*min(position, 0)+1.0
        var transform: CGAffineTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        transform = transform.concatenating(CGAffineTransform(translationX: position < 0 ? contentOffset.x - itemOrigin.x : 0, y: 0))
        attributes.transform = transform
        attributes.zIndex = attributes.indexPath.row
    }
}
