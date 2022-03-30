//
//  ViewController.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import UIKit

class HomeViewController: UIViewController, ReceiveDataDelegate {
    /* Dummy Data */
    var usedItems = UsedItemModel().usedItems
    
 
    
    /* Subviews  */
    
    let locationBarButton = AppbarViews().locationBarButton
    
    let groupButton = AppbarViews().rightGroupBarButtons
    lazy var rightGroupBarButtons: UIBarButtonItem = {
        let barbtnitem = UIBarButtonItem(customView: groupButton)
        return barbtnitem
    }()
    
    lazy var tableView = UsedItemTableView().tableView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tableview Default Setting
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register Route Action
        let heartIcon = groupButton.subviews[1] as! UIButton
        heartIcon.addTarget(self, action: #selector(routeToFavoriteView), for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews() {
        self.navigationItem.leftBarButtonItem = locationBarButton
        self.navigationItem.rightBarButtonItem = rightGroupBarButtons
        self.view.backgroundColor = .white
        setTableView()

    }
    
    
    // TableView Contraints 설정
    func setTableView() {
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: INTENT
    
    // `FavoriteViewController`로 Route
    /// 1. usedItems 값들 전달
    /// 2. delegate 연결
    @objc func routeToFavoriteView() {
        let vc = FavoriteViewController()
        vc.usedItems = usedItems
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // 이전 ViewController에서 받은 값들을 Tableview에 업데이트
    func receiveChildData(_ child: UIViewController, data: [UsedItemModel.UsedItem]) {
        usedItems = data
        tableView.reloadData()
    }
    
    
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsedItemTableViewCell.cellId, for: indexPath) as! UsedItemTableViewCell
        let selectedItem = usedItems[indexPath.row]
        
        cell.titleLabel.text = selectedItem.title
        cell.thumnail.image = UIImage(named: selectedItem.imagePath)
        cell.locationLabel.text = selectedItem.subDescription
        cell.priceLabel.text = String(selectedItem.price)
        cell.heartIcon.image = selectedItem.isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        usedItems[indexPath.row].isLiked = !usedItems[indexPath.row].isLiked
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let responsiveCellHeight = self.view.frame.height * CGFloat(0.19)
        return responsiveCellHeight
    }
    
}


// MARK: Delegate Protocol
// `FavoriteViewContrller`에서 isLiked Toggle 값을 `HomeViewController`에서 받기 위한 프로토콜

protocol ReceiveDataDelegate: AnyObject {
    func receiveChildData(_ child: UIViewController, data: [UsedItemModel.UsedItem])
}

