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
        collectioinView.register(CollectionViewCellTest1.self)
        collectioinView.register(CollectionViewCellTest2.self)
    }
    
    func populateCollectionView() {
        let row = CustomCollectionViewRow.init(cellClass: CollectionViewCellTest1.self)
        let section1 = collectioinView.addSection()
        section1.addRow(row: row)
        section1.addRow(row: row)
        
        let section2 = collectioinView.addSection()
        let row2 = CustomCollectionViewRow.init(cellClass: CollectionViewCellTest2.self)
        section2.addRow(row: row2)
//        let row3 = CustomCollectionViewRow.init(cellClass: CollectionViewCellTest2.self, dataModel: nil)
        collectioinView.reloadData()
    }
}

