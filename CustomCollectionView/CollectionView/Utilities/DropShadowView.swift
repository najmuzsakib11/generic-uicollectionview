//
//  ShadowView.swift
//  SwiftTest
//
//  Created by Najmuz Sakib on 1/2/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

@IBDesignable
class DropShadowView: UIView {
    
    private var shadowLayer: CAShapeLayer!
    private var fillColor = UIColor.clear
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowRadius:CGFloat = 10.0
    @IBInspectable var shadowOpacity:Float = 0.2
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadowLayer()
    }
    
    func addShadowLayer() {
        guard shadowLayer == nil else { return }
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = backgroundColor?.cgColor ?? fillColor.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
}
