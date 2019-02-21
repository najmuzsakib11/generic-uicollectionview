//
//  TextFieldCollectionViewCellModel.swift
//  SwiftTest
//
//  Created by Najmuz Sakib on 31/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

struct TextFieldCollectionViewCellModel {
    
    var text: String
    var placeHolderText: String
    var textInsets: UIEdgeInsets
    
    init(text:String = "", textInsets:UIEdgeInsets = UIEdgeInsets.zero, placeHolderText:String = "") {
        self.text = text
        self.textInsets = textInsets
        self.placeHolderText = placeHolderText
    }
}
