//
//  CustomCollectionViewSection.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CollectionViewSection {
    
    let sectionID:Int
    let sectionInsets:UIEdgeInsets
    let minimumInterItemSpacing:CGFloat
    let minimumInterLineSpacing:CGFloat
    
    private var rowList : [CollectionViewRow]
    
    var numberOfRows: Int {
        return rowList.count
    }
    
    init(sectionInsets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0), minimumInterLineSpacing: CGFloat = 10, minimumInterItemSpacing: CGFloat = 0) {
        sectionID = CollectionView.generateIncrementalID()
        rowList = []
        self.sectionInsets = sectionInsets
        self.minimumInterItemSpacing = minimumInterItemSpacing
        self.minimumInterLineSpacing = minimumInterLineSpacing
    }
    
    func addRow(row:CollectionViewRow) {
        rowList.append(row)
    }
    
    func getRow(at index:Int) -> CollectionViewRow {
        precondition(index < rowList.count, "Row not found")
        return rowList[index]
    }
    
    func getRowList() -> [CollectionViewRow] {
        return rowList
    }
    
    func getRow(with rowID:Int) -> CollectionViewRow? {
        return rowList.filter({$0.rowID == rowID}).first
    }
}

extension CollectionViewSection:Equatable {
    static func == (lhs: CollectionViewSection, rhs: CollectionViewSection) -> Bool {
        return lhs.sectionID == rhs.sectionID
    }
}
