//
//  ShadowView.swift
//  SwiftTest
//
//  Created by Najmuz Sakib on 1/2/19.
//  Copyright © 2019 Najmuz Sakib. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    @IBInspectable var shadowLayer: CAShapeLayer!
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var fillColor = UIColor.white
    @IBInspectable var shadowRadius:CGFloat = 3.0
    @IBInspectable var shadowOpacity:Float = 0.1
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadowLayer()
    }
    
    func addShadowLayer() {
        guard shadowLayer == nil else {
            return
        }
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0, height: 1)
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
}
