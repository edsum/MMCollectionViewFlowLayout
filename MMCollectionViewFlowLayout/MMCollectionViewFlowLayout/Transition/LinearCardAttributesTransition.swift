//
//  LinearCardAttributesTransition.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

/// 横向移动，中间大，两边小
/// 必须将cell中的'clipsToBounds'设置为false
public struct LinearCardAttributesTransition: MMLayoutProtocol {
    
    /// 远离中心的单元格中应用的alpa
    /// [0, 1]的取值，默认是 0
    public var minAlpha: CGFloat
    
    /// 两个cell之间的间距比
    public var itemSpacing: CGFloat
    
    /// 作用在cell使得其成为卡的比例大小
    public var scaleRotate: CGFloat
    
    public init(minAlpha: CGFloat = 0.5, itemSpacing: CGFloat = 0.4, scaleRotate: CGFloat = 0.7) {
        self.minAlpha = minAlpha
        self.itemSpacing = itemSpacing
        self.scaleRotate = scaleRotate
    }
    
    public func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes) {
        let width: CGFloat = collectionView.frame.width
        let transitionX: CGFloat = -width*itemSpacing*position
        let scaleFactor: CGFloat = scaleRotate-0.1*abs(position)
        
        let scaleTransform: CGAffineTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        let transitionTransform: CGAffineTransform = CGAffineTransform(translationX: transitionX, y: 0)
        
        attributes.alpha = 1.0-abs(position)+minAlpha
        attributes.transform = transitionTransform.concatenating(scaleTransform)
    }
}
