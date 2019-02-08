//
//  CustomCollectionView.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

typealias CustomCollectionViewCell = UICollectionViewCell & CustomCollectionViewCellProtocol
typealias CustomCollectionViewCellType = CustomCollectionViewCell.Type

protocol CustomCollectionViewCellProtocol {
    
    func prepareCell(with row: CustomCollectionViewRow)
    static func estimatedCellSize(parentViewSize:CGSize) -> CGSize
}

extension CustomCollectionViewCellProtocol where Self:UICollectionViewCell{
    
    static var defaultReuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static func estimatedCellSize(parentViewSize:CGSize) -> CGSize {
        return CGSize.init(width: 100, height: 60)
    }
    
    func prepareCell(with row: CustomCollectionViewRow) { }
}


class CustomCollectionView: UICollectionView {
    
    private var sectionList: [CustomCollectionViewSection]
    private static var incrementalID = 0
    
    required init?(coder aDecoder: NSCoder) {
        sectionList = []
        super.init(coder: aDecoder)
        dataSource = self
        delegate = self
    }
    
    func register(_ cellClass: CustomCollectionViewCellType) {
        let nib = UINib(nibName: cellClass.defaultReuseIdentifier, bundle: nil)
        super.register(nib, forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier)
    }
    
    @available (*, unavailable)
    override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) { }
}

extension CustomCollectionView {
    
    class func generateIncrementalID() -> Int{
        incrementalID = incrementalID + 1;
        return incrementalID
    }
    
    @discardableResult func addSection() -> CustomCollectionViewSection {
        let section = CustomCollectionViewSection.init()
        sectionList.append(section)
        return section
    }
    
    @discardableResult func addSection(at index:Int) -> CustomCollectionViewSection {
        precondition(index <= sectionList.count, "Section index not found")
        let section = CustomCollectionViewSection.init()
        sectionList.insert(section, at: index)
        return section
    }
    
    func addRow(at sectionIndex:Int, row:CustomCollectionViewRow) {
        let section = getSection(at: sectionIndex)
        section.addRow(row: row)
    }
    
    func getSection(at index:Int) -> CustomCollectionViewSection {
        precondition(index < sectionList.count, "Section not found.")
        return sectionList[index]
    }
    
    func getSection(with sectionID:Int) -> CustomCollectionViewSection? {
        return sectionList.filter({$0.sectionID == sectionID}).first
    }
    
    func getRow(with rowID:Int) -> CustomCollectionViewRow? {
        return sectionList.compactMap({$0.getRow(with: rowID)}).first
    }
    
    func getRow(at indexPath:IndexPath) -> CustomCollectionViewRow {
        let section = getSection(at: indexPath.section)
        return section.getRow(at: indexPath.row)
    }
}

extension CustomCollectionView:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionList[section].getRowList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = getRow(at: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row.cellClass.defaultReuseIdentifier, for: indexPath)
        
        if let cell = cell as? CustomCollectionViewCell {
            cell.prepareCell(with: row)
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionList.count
    }
}

extension CustomCollectionView:UICollectionViewDelegateFlowLayout {
    
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
