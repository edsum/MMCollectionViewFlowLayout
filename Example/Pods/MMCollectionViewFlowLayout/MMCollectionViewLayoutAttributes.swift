//
//  MMCollectionViewLayoutAttributes.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import Foundation
import UIKit

public class MMCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    public var contentView: UIView?
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let c: MMCollectionViewLayoutAttributes = super.copy(with: zone) as! MMCollectionViewLayoutAttributes
        c.contentView = contentView
        return c 
    }
}
