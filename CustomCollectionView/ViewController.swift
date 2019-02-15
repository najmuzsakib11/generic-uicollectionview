//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 21/1/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectioinView: CustomCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regeisterCollectionViewCells()
        populateCollectionView()
    }
    
    func regeisterCollectionViewCells() {
        collectioinView.register(LabelCollectionViewCell.self)
        collectioinView.register(TextFieldCollectionViewCell.self)
    }
    
    func populateCollectionView() {
        let row = CustomCollectionViewRow.init(cellClass: LabelCollectionViewCell.self)
        let section1 = collectioinView.addSection()
        section1.addRow(row: row)
        section1.addRow(row: row)
        row.setCellHeight(cellHeight: { _ in 40 })
        
        let section2 = collectioinView.addSection()
        let textInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        let dataModel = TextFieldCollectionViewCellModel.init(textInsets: textInsets, placeHolderText: "Type Your Name")
        let row2 = CustomCollectionViewRow.init(cellClass: TextFieldCollectionViewCell.self, dataModel: dataModel as AnyObject)
        section2.addRow(row: row2)
        collectioinView.reloadData()
    }
}
