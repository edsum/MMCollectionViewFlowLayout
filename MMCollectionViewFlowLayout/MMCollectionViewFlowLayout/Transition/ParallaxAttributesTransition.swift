//
//  ParallaxAttributesTransition.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit


/// 视差效果
public struct ParallaxAttributesTransition: MMLayoutProtocol {
    
    /// 速度越高，视差越明显
    /// 建议在[0, 1]中，0 表示无视差，默认是0.5
    public var speed: CGFloat
    
    public init(speed: CGFloat = 0.5) {
        self.speed = speed
    }
    
    public func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes) {
        if abs(position) >= 1 {
            attributes.contentView?.transform = .identity
        }else {
            let width: CGFloat = collectionView.frame.width
            let transitionX: CGFloat = -(width*speed*position)
            attributes.contentView?.transform = CGAffineTransform(translationX: transitionX, y: 0)
        }
    }
}
