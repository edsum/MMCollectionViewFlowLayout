//
//  RotateInOutAttributesTransition.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

/// 旋转渐隐
/// 必须将cell中的'clipsToBounds'设置为false
public struct RotateInOutAttributesTransition: MMLayoutProtocol {
    
    /// 远离中心的单元格中应用的alpa
    /// [0, 1]的取值，默认是 0
    public var minAlpha: CGFloat
    
    /// 将应用于cell的最大旋转角度
    /// [0, 2pi]的取值，默认是0.25pi
    public var maxRotate: CGFloat
    
    public init(minAlpha: CGFloat = 0, maxRotate: CGFloat = CGFloat(Double.pi/4)) {
        self.minAlpha = minAlpha
        self.maxRotate = maxRotate
    }
    
    public func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes) {
        if abs(position) >= 1 {
            attributes.contentView?.transform = .identity
            attributes.alpha = 1.0
        }else {
            let rotateFactor: CGFloat = maxRotate*position
            attributes.zIndex = attributes.indexPath.row
            attributes.alpha = 1.0-abs(position)+minAlpha
            attributes.contentView?.transform = CGAffineTransform(rotationAngle: rotateFactor)
        }
    }
}
