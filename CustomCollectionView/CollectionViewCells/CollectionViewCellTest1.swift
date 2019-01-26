//
//  Test1CollectionViewCell.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CollectionViewCellTest1: UICollectionViewCell, CustomCollectionViewCellProtocol {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func prepareCell(with row: CustomCollectionViewRow, cell:UICollectionViewCell) {
        cell.backgroundColor = UIColor.red
    }
}
