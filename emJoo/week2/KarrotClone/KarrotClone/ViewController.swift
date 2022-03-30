//
//  ViewController.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import UIKit

class ViewController: UIViewController {
    
    /* Subviews */
    let locationBarButton = AppbarViews().locationBarButton
    let rightGroupBarButtons = AppbarViews().rightGroupBarButtons
    
//    /* TableView */
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = locationBarButton
        self.navigationItem.rightBarButtonItem = rightGroupBarButtons
    }
    
    override func viewDidLayoutSubviews() {
        self.view.backgroundColor = .white
    }
    
    
}

