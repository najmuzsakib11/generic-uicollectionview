//
//  PostPropertyInfoCollectionViewCell.swift
//  SwiftTest
//
//  Created by Najmuz Sakib on 29/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell, CustomCollectionViewCellProtocol {
    
    @IBOutlet weak var titleLabel: EdgeInsetLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(with row: CustomCollectionViewRow) {
        if let data = row.dataModel as? LabelCollectionViewCellModel {
            titleLabel.text = data.title
            titleLabel.textInsets = data.edgeInsets
        }
        titleLabel.textInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    static func estimatedCellSize(parentViewSize:CGSize) -> CGSize {
        return CGSize.init(width: parentViewSize.width, height: 50)
    }
}
