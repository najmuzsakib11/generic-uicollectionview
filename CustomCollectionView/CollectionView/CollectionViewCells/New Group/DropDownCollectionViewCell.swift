//
//  DropDownCollectionViewCell.swift
//  SwiftTest
//
//  Created by Najmuz Sakib on 31/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class DropDownCollectionViewCell: UICollectionViewCell, CustomCollectionViewCellProtocol {

    @IBOutlet weak var titleLabel: EdgeInsetLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(with row: CustomCollectionViewRow) {
        if let data = row.dataModel as? DropDownCollectionViewCellModel {
            titleLabel.textInsets = data.edgeInsets
            titleLabel.text = data.title
        }
    }
    
    static func estimatedCellSize(parentViewSize:CGSize) -> CGSize {
        return CGSize.init(width: parentViewSize.width, height: 50)
    }
}
