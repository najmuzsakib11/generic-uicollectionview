//
//  CustomCollectionViewSection.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CustomCollectionViewSection {
    let sectionID:Int
    
    private var rowList : [CustomCollectionViewRow]
    
    init() {
        sectionID = CustomCollectionView.generateIncrementalID()
        rowList = []
    }
    
    func addRow(row:CustomCollectionViewRow) {
        rowList.append(row)
    }
    
    func getRow(at index:Int) -> CustomCollectionViewRow {
        guard index < rowList.count else{
            fatalError("Row not found")
        }
        return rowList[index]
    }
    
    func getRowList() -> [CustomCollectionViewRow] {
        return rowList
    }
}
