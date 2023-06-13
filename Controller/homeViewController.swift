//
//  homeViewController.swift
//  Microsoft_To_Do_App_Clone
//
//  Created by Tahir F. Kizir on 8.05.2023.
//

import UIKit
import FirebaseAuth

class homeViewController: UIViewController
{
    
    private let toDoArray : [[String:Int]] = [["Günüm":0],["Önemli":0],["Planlanan":0],["Bana atanmış":0],["Bayrak eklenmiş e-postalar":0],["Görevler":0]]
    
    func configureUI()
    {
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, centerX: nil, paddingCenterX: 0, centerY: nil, paddingCenterY: 0, width: 0, height: 0)
    }
    
    private lazy var tableView : UITableView =
    {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(toDoCell.self, forCellReuseIdentifier: "toDoCell")
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor.white
        return tv
    }()
    
    private lazy var headerView : UIView =
    {
       let vw = UIView()
        vw.backgroundColor = UIColor.systemBackground
        
        vw.addSubview(profilImage)
        profilImage.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: vw.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, centerX: nil, paddingCenterX: 0, centerY: vw.centerYAnchor, paddingCenterY: 0, width: 20, height: 20)
        
        vw.addSubview(nameLabel)
        nameLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: profilImage.rightAnchor, paddingLeft: 15, right: nil, paddingRight: 0, centerX: nil, paddingCenterX: 0, centerY: vw.centerYAnchor, paddingCenterY: 0, width: 0, height: 0)
        
        return vw
    }()
    
    private lazy var nameLabel : UILabel =
    {
       let lbl = UILabel()
        lbl.text = "\(Auth.auth().currentUser!.email ?? Auth.auth().currentUser!.phoneNumber!)"
        lbl.textColor = UIColor(named:"lightBlack")
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return lbl
    }()
    
    private let profilImage : UIImageView =
    {
       let iv = UIImageView()
        
        iv.image = UIImage(named: "127502232")
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBackground
        configureUI()
    }

}

extension homeViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! toDoCell
        cell.arrangeCell(toDoArray[indexPath.row],indexPath:indexPath)
        return cell
    }
    
}

