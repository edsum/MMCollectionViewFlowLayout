//
//  ZoomInOutAttributesTransition.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

/// 变小移出，变大进入
public struct ZoomInOutAttributesTransition: MMLayoutProtocol {
    
    /// scaleRate决定最大比例率
    /// 0 表示无比例，1表示最大值的大小将为最大值，最小值将消失
    public var scaleRate: CGFloat
    
    public init(scaleRate: CGFloat = 0.2) {
        self.scaleRate = scaleRate
    }
    
    public func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes) {
        if abs(position) >= 1 {
            attributes.contentView?.transform = .identity
        }else {
            let scaleFactor: CGFloat = scaleRate*position+1.0
            attributes.contentView?.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }
    }
}
