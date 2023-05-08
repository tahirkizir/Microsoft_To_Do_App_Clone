//
//  Extensions.swift
//  Microsoft_To_Do_App_Clone
//
//  Created by Tahir F. Kizir on 8.05.2023.
//

import UIKit



extension UIView
{
    
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat,centerX:NSLayoutXAxisAnchor?,paddingCenterX:CGFloat,centerY:NSLayoutYAxisAnchor?,paddingCenterY:CGFloat, width: CGFloat, height: CGFloat)
{
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top
        {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom
        {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right
        {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let left = left
        {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let centerX = centerX
        {
            centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX).isActive = true
        }
        if let centerY = centerY
        {
            centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY).isActive = true
        }
        if width != 0
        {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0
        {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
