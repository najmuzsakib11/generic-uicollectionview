//
//  JustTextFieldCollectionViewCell.swift
//  SwiftTest
//
//  Created by Najmuz Sakib on 30/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class TextFieldCollectionViewCell: UICollectionViewCell, CustomCollectionViewCellProtocol {
    
    @IBOutlet weak var textField: EdgeInsetTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(with row: CustomCollectionViewRow) {
        if let dataModel = row.dataModel as? TextFieldCollectionViewCellModel{
            textField.textInsets = dataModel.textInsets
            textField.placeholder = dataModel.placeHolderText
        }
    }
    
    static func estimatedCellSize(parentViewSize:CGSize) -> CGSize {
        return CGSize.init(width: parentViewSize.width, height: 40)
    }
}
