//
//  CrossFadeAttributesTransition.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

/// 淡入淡出
public struct CrossFadeAttributesTransition: MMLayoutProtocol {
    public init() {}
    
    public func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes) {
        let contentOffset: CGPoint = collectionView.contentOffset
        attributes.frame = CGRect(origin: contentOffset, size: attributes.frame.size)
        attributes.alpha = 1-abs(position)
    }
}
