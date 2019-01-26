//
//  CustomCollectionViewRow.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CustomCollectionViewRow {
    let rowID:Int
    var dataModel:AnyObject?
    var cellClass:CustomCollectionViewCellProtocol.Type!
    
    
    private init(){
        rowID = CustomCollectionView.generateIncrementalID()
    }
    
    convenience init(cellClass:CustomCollectionViewCellProtocol.Type) {
        self.init()
        self.cellClass = cellClass
    }
    
    convenience init(cellClass:CustomCollectionViewCellProtocol.Type, dataModel:AnyObject) {
        self.init()
        self.cellClass = cellClass
        self.dataModel = dataModel
    }
}
