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
    let sectionInsets:UIEdgeInsets
    let minimumInterItemSpacing:CGFloat
    let minimumInterLineSpacing:CGFloat
    
    private var rowList : [CustomCollectionViewRow]
    
    init(sectionInsets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0), minimumInterLineSpacing: CGFloat = 10, minimumInterItemSpacing: CGFloat = 0) {
        sectionID = CustomCollectionView.generateIncrementalID()
        rowList = []
        self.sectionInsets = sectionInsets
        self.minimumInterItemSpacing = minimumInterItemSpacing
        self.minimumInterLineSpacing = minimumInterLineSpacing
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
    
    func getRow(with rowID:Int) -> CustomCollectionViewRow? {
        for row in rowList {
            if row.rowID == rowID {
                return row
            }
        }
        return nil
    }
}
