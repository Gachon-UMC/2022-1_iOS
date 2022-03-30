//
//  ViewController.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import UIKit

class ViewController: UIViewController {
    
    /* Dummy Data */
    var usedItems = UsedItemModel().usedItems
    
    /* Subviews  */
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        self.navigationItem.leftBarButtonItem = AppbarViews().locationBarButton
        self.navigationItem.rightBarButtonItem = AppbarViews().rightGroupBarButtons
        self.view.backgroundColor = .white
        
        setTableView()
        
    }
    
    func setTableView() {
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usedItemCell", for: indexPath) as! UsedItemTableViewCell
        
        cell.titleLabel.text = usedItems[indexPath.row].title
        cell.thumnail.image = UIImage(named: usedItems[indexPath.row].imagePath)
        
    
        cell.heartIcon.addTarget(self, action: #selector(tapHeartIcon), for: .allTouchEvents)
    

        
        
        return cell
    }
    
    @objc func tapHeartIcon() {
        print("TAPPED")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let responsiveCellHeight = self.view.frame.height * CGFloat(0.19)
        return responsiveCellHeight
    }
    
    
    
    
}
