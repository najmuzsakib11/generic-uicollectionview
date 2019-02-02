//
//  DropDownCollectionViewCellModel.swift
//  SwiftTest
//
//  Created by Najmuz Sakib on 1/2/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

struct DropDownCollectionViewCellModel {
    var title: String
    var edgeInsets: UIEdgeInsets
    
    
    init(title:String = "", edgeInsets:UIEdgeInsets = UIEdgeInsets.zero) {
        self.title = title
        self.edgeInsets = edgeInsets
    }
}
