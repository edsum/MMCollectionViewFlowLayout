//
//  MMLayoutProtocol.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

public protocol MMLayoutProtocol {
    func transiton(_ position: CGFloat, _ collectionView: UICollectionView, _ attributes: MMCollectionViewLayoutAttributes)
}
