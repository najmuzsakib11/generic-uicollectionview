//
//  CustomCollectionView.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    
    private var sectionList:[CollectionViewSection] = []
    private static var incrementalID = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureAtInit()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configureAtInit()
    }
    
    func configureAtInit() {
        dataSource = self
        delegate = self
    }
    
    func register(_ cellClass: CollectionViewCell.Type) {
        let nib = UINib(nibName: cellClass.defaultReuseIdentifier, bundle: nil)
        super.register(nib, forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier)
    }
    
    @available (*, unavailable)
    override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) { }
}

extension CollectionView {
    
    var numberOfSection : Int {
        return sectionList.count
    }
    
    class func generateIncrementalID() -> Int{
        incrementalID = incrementalID + 1
        return incrementalID
    }
    
    @discardableResult func addSection() -> CollectionViewSection {
        let section = CollectionViewSection.init()
        sectionList.append(section)
        return section
    }
    
    @discardableResult func addSection(at index:Int) -> CollectionViewSection {
        precondition(index <= sectionList.count, "Section index not found")
        let section = CollectionViewSection.init()
        sectionList.insert(section, at: index)
        return section
    }
    
    func addRow(at sectionIndex:Int, row:CollectionViewRow) {
        let section = getSection(at: sectionIndex)
        section.addRow(row: row)
    }
    
    func getSection(at index:Int) -> CollectionViewSection {
        precondition(index < sectionList.count, "Section not found.")
        return sectionList[index]
    }
    
    func getSection(with sectionID:Int) -> CollectionViewSection? {
        return sectionList.filter({$0.sectionID == sectionID}).first
    }
    
    func getRow(with rowID:Int) -> CollectionViewRow? {
        return sectionList.compactMap({$0.getRow(with: rowID)}).first
    }
    
    func getRow(at indexPath:IndexPath) -> CollectionViewRow {
        let section = getSection(at: indexPath.section)
        return section.getRow(at: indexPath.row)
    }
    
    func getIndexPath(with rowID:Int) -> IndexPath? {
        for (sectionIndex, section) in sectionList.enumerated() {
            for (rowIndex, row) in section.getRowList().enumerated() {
                guard row.rowID != rowID else { return IndexPath.init(row: rowIndex, section: sectionIndex)}
            }
        }
        return nil
    }
}

extension CollectionView:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionList[section].getRowList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = getRow(at: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row.cellClass.defaultReuseIdentifier, for: indexPath)
        if let cell = cell as? CollectionViewCell {
            cell.prepareCell(with: row)
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionList.count
    }
}

extension CollectionView:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let row = getRow(at: indexPath)
        let cellWidth = row.getCellWidth(parentSize: collectionView.frame.size)
        let cellHeight = row.getCellHeight(parentSize: collectionView.frame.size)
        let estimatedSize = row.cellClass.estimatedCellSize(parentViewSize: collectionView.frame.size)
        return CGSize.init(width: cellWidth ?? estimatedSize.width, height: cellHeight ?? estimatedSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionList[section].minimumInterLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionList[section].minimumInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionList[section].sectionInsets
    }
}