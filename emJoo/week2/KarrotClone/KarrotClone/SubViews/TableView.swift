//
//  TableView.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import UIKit

class UsedItemTableView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UsedItemTableViewCell.self, forCellReuseIdentifier: UsedItemTableViewCell.cellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // TableView 마진 레이아웃 (양옆 공백)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        tableView.tableHeaderView = UIView()
        
        return tableView
    }()
    
    
    func setTableView(_ view: UIView) {
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    

    
}
