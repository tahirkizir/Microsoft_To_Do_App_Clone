//
//  toDoCell.swift
//  Microsoft_To_Do_App_Clone
//
//  Created by Tahir F. Kizir on 9.05.2023.
//

import UIKit

class toDoCell: UITableViewCell
{
    
    func arrangeCell(_ item:[String:Any],indexPath:IndexPath)
    {
        rawLabel.text = item.keys.first!
        valueLabel.text = "\(item.values.first! as! Int == 0 ? "" : item.values.first!)"
        rawImage.image = UIImage(named: "\(indexPath.row)")
        seperatorView.isHidden = (indexPath.row == 5 ? false : true)
    }
    
    private let rawLabel : UILabel =
    {
       let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    private let valueLabel : UILabel =
    {
       let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    private let rawImage : UIImageView =
    {
       let iv = UIImageView()
        
        iv.image = UIImage(named: "127502232")
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    private let seperatorView : UIView =
    {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemGray
        view.isHidden = true
        return view
    }()
    
    func arrangeUI()
    {
        addSubview(rawImage)
        rawImage.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 17, right: nil, paddingRight: 0, centerX: nil, paddingCenterX: 0, centerY: centerYAnchor, paddingCenterY: 0, width: 18, height: 18)
        
        addSubview(rawLabel)
        rawLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: rawImage.rightAnchor, paddingLeft: 15, right: nil, paddingRight: 0, centerX: nil, paddingCenterX: 0, centerY: centerYAnchor, paddingCenterY: 0, width: 0, height: 0)
        
        addSubview(valueLabel)
        valueLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 15, centerX: nil, paddingCenterX: 0, centerY: centerYAnchor, paddingCenterY: 0, width: 0, height: 0)
        
        addSubview(seperatorView)
        seperatorView.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 15, right: rightAnchor, paddingRight: 15, centerX: nil, paddingCenterX: 0, centerY: nil, paddingCenterY: 0, width: 0, height: 0.5)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        arrangeUI()
    }
    

    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

}
