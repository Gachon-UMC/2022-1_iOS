//
//  FavoriteViewController.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController {
    
    var delegate: ReceiveDataDelegate!
    var originItems: [UsedItemModel.UsedItem] = []
    var usedItems: [UsedItemModel.UsedItem] = []
    

    

    
    lazy var backArrowButton: UIBarButtonItem = {
        let barBtnItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(routeBack))
        return barBtnItem
    }()
    
    @objc func routeBack() {
        delegate.receiveChildData(self, data: originItems)
        _ = navigationController?.popToRootViewController(animated: true)

    }
            
    
    
    /* Subviews */
    
    lazy var tableView = UsedItemTableView().tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = backArrowButton
        
        tableView.dataSource = self
        tableView.delegate = self
        originItems = usedItems
        

        
        let filteredItems = usedItems.filter { item in
            item.isLiked == true
        }
        
        usedItems = filteredItems

    

    }
    
    override func viewDidLayoutSubviews() {
        self.view.backgroundColor = .white
        self.title = "관심목록"
        self.view.addSubview(tableView)
        
        
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


extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usedItemCell", for: indexPath) as! UsedItemTableViewCell
        
        cell.titleLabel.text = usedItems[indexPath.row].title
        cell.thumnail.image = UIImage(named: usedItems[indexPath.row].imagePath)
        cell.heartIcon.configuration?.image = usedItems[indexPath.row].isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = usedItems[indexPath.row]
        originItems[selectedItem.id].isLiked = !usedItems[indexPath.row].isLiked
        usedItems.remove(at: indexPath.row)
        tableView.reloadData()
    }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let responsiveCellHeight = self.view.frame.height * CGFloat(0.19)
        return responsiveCellHeight
    }
    
}
