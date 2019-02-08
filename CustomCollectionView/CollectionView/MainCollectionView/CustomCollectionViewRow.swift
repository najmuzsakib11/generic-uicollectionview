//
//  CustomCollectionViewRow.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CustomCollectionViewRow {
    
    typealias CellSizeFunc = (CGSize)->CGFloat

    let rowID:Int
    var dataModel:AnyObject?
    var cellClass:CustomCollectionViewCellType
    
    private var cellHeight:CellSizeFunc?
    private var cellWidth:CellSizeFunc?
    
    init(cellClass:CustomCollectionViewCellType, dataModel:AnyObject? = nil) {
        self.rowID = CustomCollectionView.generateIncrementalID()
        self.cellClass = cellClass
        self.dataModel = dataModel
    }
    
    func setCellHeight(cellHeight:@escaping CellSizeFunc) {
        self.cellHeight = cellHeight
    }
    
    func setCellWidth(cellWidth:@escaping CellSizeFunc) {
        self.cellWidth = cellWidth
    }
    
    func getCellHeight(parentSize:CGSize) -> CGFloat? {
        return cellHeight?(parentSize)
    }
    
    func getCellWidth(parentSize:CGSize) -> CGFloat? {
        return cellWidth?(parentSize)
    }
}
