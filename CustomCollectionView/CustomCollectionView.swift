//
//  CustomCollectionView.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

protocol CustomCollectionViewCellProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
    static func estimatedCellSize(parentViewSize:CGSize) -> CGSize
    func prepareCell(with row: CustomCollectionViewRow)
}

extension CustomCollectionViewCellProtocol {
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
    
    func register(_ cellClass: CustomCollectionViewCellProtocol.Type) {
        let nib = UINib(nibName: cellClass.defaultReuseIdentifier, bundle: nil)
        super.register(nib, forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier)
    }
    
    @available (*, unavailable)
    override func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
        
    }
    
    @available (*, unavailable)
    override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        
    }
}
extension CustomCollectionView {
    class func generateIncrementalID() -> Int{
        incrementalID = incrementalID + 1;
        return incrementalID
    }
}

extension CustomCollectionView {
    @discardableResult func addSection() -> CustomCollectionViewSection {
        let section = CustomCollectionViewSection.init()
        sectionList.append(section)
        return section
    }
    
    @discardableResult func addSection(at index:Int) -> CustomCollectionViewSection {
        guard index <= sectionList.count else {
            fatalError("Section index not found")
        }
        let section = CustomCollectionViewSection.init()
        sectionList.insert(section, at: index)
        return section
    }
    
    func addRow(at sectionIndex:Int, row:CustomCollectionViewRow) {
        let section = getSection(at: sectionIndex)
        section.addRow(row: row)
    }
    
    func getSection(at index:Int) -> CustomCollectionViewSection {
        guard index < sectionList.count else {
            fatalError("Section not found")
        }
        return sectionList[index]
    }
    
    func getSection(with sectionID:Int) -> CustomCollectionViewSection? {
        for section in sectionList {
            if section.sectionID == sectionID {
                return section
            }
        }
        return nil
    }
    
    func getRow(with rowID:Int) -> CustomCollectionViewRow? {
        for section in sectionList {
            if let row = section.getRow(with:rowID) {
                return row
            }
        }
        return nil
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
        
        if let cell = cell as? CustomCollectionViewCellProtocol {
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
        return row.cellSize ?? row.cellClass.estimatedCellSize(parentViewSize: collectionView.frame.size)
    }
}
