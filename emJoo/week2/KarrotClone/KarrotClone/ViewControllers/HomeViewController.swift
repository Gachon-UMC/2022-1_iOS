//
//  ViewController.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import UIKit

class HomeViewController: UIViewController {
   
    /* Dummy Data */
    var usedItems = UsedItemModel().usedItems
    
    /* Subviews  */
    let locationBarButton = AppbarViews().locationBarButton
    let groupButton = AppbarViews().rightGroupBarButtons
    lazy var rightGroupBarButtons: UIBarButtonItem = {
        let barbtnitem = UIBarButtonItem(customView: groupButton)
        return barbtnitem
    }()
    
    lazy var tableView = TableVeiw().tableView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let heartIcon = groupButton.subviews[1] as! UIButton
        heartIcon.addTarget(self, action: #selector(routeToFavoriteView), for: .touchUpInside)
        
    }
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        self.navigationItem.leftBarButtonItem = locationBarButton
        self.navigationItem.rightBarButtonItem = rightGroupBarButtons
        self.view.backgroundColor = .white
        
        setTableView()

        
    }
    
    
    @objc func routeToFavoriteView() {
        let vc = FavoriteViewController()
//        vc.userdetails = userViewModels[indexPath.row]
        vc.usedItems = usedItems
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setTableView() {
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
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
        usedItems[indexPath.row].isLiked = !usedItems[indexPath.row].isLiked
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let responsiveCellHeight = self.view.frame.height * CGFloat(0.19)
        return responsiveCellHeight
    }
    
    
        
    
    
    
}
