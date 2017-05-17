//
//  MMCollectionViewFlowLayout.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

public class MMCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    
    /// 处理转场
    public var transition: MMLayoutProtocol?
    
    /// 可以记录layout attributes的其他属性
    public override class var layoutAttributesClass: AnyClass {
        return MMCollectionViewLayoutAttributes.self
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        return attributes.flatMap { $0.copy() as? UICollectionViewLayoutAttributes}.map {
            self.transformLayoutAttributes($0)
        }
    }
    
    private func transformLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        guard let collectionView = self.collectionView, let a = attributes as? MMCollectionViewLayoutAttributes else {
            return attributes
        }
        // cell的中点和屏幕的中点之间的距离的比率对于每次cell的位置都是确定的。
        let width: CGFloat = collectionView.frame.width
        let centerX: CGFloat = width*0.5
        let offset: CGFloat = collectionView.contentOffset.x
        let itemX: CGFloat = a.center.x-offset
        let position = (itemX-centerX)/width
        
        // 一旦我们开始使用就缓存contentView
        if a.contentView == nil {
            a.contentView = collectionView.cellForItem(at: attributes.indexPath)?.contentView
        }
        transition?.transiton(position, collectionView, a)
        return a
    }
}
