//
//  CustomCollectionViewRow.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CollectionViewRow {
    
    let rowID:Int
    
    var dataModel:AnyObject?
    var cellClass:CollectionViewCell.Type
    
    private var cellHeight:((CGSize)->CGFloat)?
    private var cellWidth:((CGSize)->CGFloat)?
    
    init(cellClass:CollectionViewCell.Type, dataModel:AnyObject? = nil) {
        self.rowID = CollectionView.generateIncrementalID()
        self.cellClass = cellClass
        self.dataModel = dataModel
    }
    
    func setCellHeight(cellHeight:@escaping (CGSize) -> CGFloat) {
        self.cellHeight = cellHeight
    }
    
    func setCellWidth(cellWidth:@escaping (CGSize) -> CGFloat) {
        self.cellWidth = cellWidth
    }
    
    func getCellHeight(parentSize:CGSize) -> CGFloat? {
        return cellHeight?(parentSize)
    }
    
    func getCellWidth(parentSize:CGSize) -> CGFloat? {
        return cellWidth?(parentSize)
    }
}

extension CollectionViewRow:Equatable {
    static func == (lhs: CollectionViewRow, rhs: CollectionViewRow) -> Bool {
        return lhs.rowID == rhs.rowID
    }
}
