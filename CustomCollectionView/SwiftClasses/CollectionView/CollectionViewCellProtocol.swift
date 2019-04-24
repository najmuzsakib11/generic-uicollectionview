//
//  CollectionViewCellProtocol.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 24/4/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

typealias CollectionViewCell = UICollectionViewCell & CollectionViewCellProtocol

protocol CollectionViewCellProtocol {
    
    func prepareCell(with row: CollectionViewRow)
    static func estimatedCellSize(parentViewSize: CGSize) -> CGSize
}

extension CollectionViewCellProtocol where Self:UICollectionViewCell {
    
    static var defaultReuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static func estimatedCellSize(parentViewSize:CGSize) -> CGSize {
        return CGSize.init(width: 100, height: 60)
    }
    
    func prepareCell(with row: CollectionViewRow) { }
}


