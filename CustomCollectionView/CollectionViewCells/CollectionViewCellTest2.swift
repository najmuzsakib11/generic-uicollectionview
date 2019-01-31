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
    
    func prepareCell(with row: CustomCollectionViewRow) {
        backgroundColor = UIColor.red
    }
    
    static func estimatedCellSize(parentViewSize:CGSize) -> CGSize {
        return CGSize.init(width: parentViewSize.width, height: 40)
    }

}
