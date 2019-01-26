//
//  CollectionViewCellTest2.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 23/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CollectionViewCellTest2: UICollectionViewCell, CustomCollectionViewCellProtocol {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func prepareCell(with row: CustomCollectionViewRow, cell:UICollectionViewCell) {
        cell.backgroundColor = UIColor.blue
    }
    
    static func getEstimatedCellSize(parentViewSize:CGSize) -> CGSize {
        return CGSize.init(width: parentViewSize.width, height: 40)
    }

}
