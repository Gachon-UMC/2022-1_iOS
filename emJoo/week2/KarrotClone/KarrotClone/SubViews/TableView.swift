//
//  TableView.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import UIKit

class TableVeiw {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UsedItemTableViewCell.self, forCellReuseIdentifier: "usedItemCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // TableView 마진 레이아웃 (양옆 공백)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        tableView.tableHeaderView = UIView()
        
        return tableView
    }()
    
}
