//
//  FavoriteViewController.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController {
    
    /* Dummy Data & State Variables */
    
    var delegate: ReceiveDataDelegate! // Delegate 연동
    var originItems: [UsedItemModel.UsedItem] = [] // 이전 ViewController 전달할 값.
    var usedItems: [UsedItemModel.UsedItem] = [] // 해당 ViewController의 Tableview에서 보여줄 값
    
    /* Subviews */
    
    lazy var backArrowButton: UIBarButtonItem = {
        let barBtnItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(routeBack))
        barBtnItem.tintColor = .black
        return barBtnItem
    }()
    
    
    lazy var tableView = UsedItemTableView().tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = backArrowButton
        
        tableView.dataSource = self
        tableView.delegate = self
        originItems = usedItems
        
        filterUsedItems()
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
    
    // MARK: INTENT
    
    // Route Back 메소드
    @objc func routeBack() {
        delegate.receiveChildData(self, data: originItems) // 이전 ViewController로 값 전달
        _ = navigationController?.popToRootViewController(animated: true) // 이전 View Controller로 이동

    }
    
    // usedItems 리스트 중 isLiked 값이 false인 값만 필터링
    func filterUsedItems() {
        let filteredItems = usedItems.filter { item in
            item.isLiked == true
        }
        usedItems = filteredItems
    }
    

}


extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usedItemCell", for: indexPath) as! UsedItemTableViewCell
        let selectedItem = usedItems[indexPath.row]
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        
        cell.titleLabel.text = selectedItem.title
        cell.thumnail.image = UIImage(named: selectedItem.imagePath)
        cell.locationLabel.text = selectedItem.subDescription
        cell.priceLabel.text = formatter.string(for: selectedItem.price)
        cell.heartIcon.image = selectedItem.isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
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
