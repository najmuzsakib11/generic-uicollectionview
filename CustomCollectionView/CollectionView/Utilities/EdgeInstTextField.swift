//
//  EdgeInstTextField.swift
//  CustomCollectionView
//
//  Created by Najmuz Sakib on 6/2/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class EdgeInsetTextField: UITextField {
    
    @IBInspectable
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override func textRect(forBounds bounds:CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
}
