//
//  Test1CollectionViewCell.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CollectionViewCellTest1: UICollectionViewCell, CustomCollectionViewCellProtocol {


    @IBOutlet weak var abc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func prepareCell(with row: CustomCollectionViewRow) {
        backgroundColor = UIColor.green
    }
}
