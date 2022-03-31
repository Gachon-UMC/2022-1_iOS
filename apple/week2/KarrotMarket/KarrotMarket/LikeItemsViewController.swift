//
//  LikeItemsViewController.swift
//  KarrotMarket
//
//  Created by 조동진 on 2022/03/29.
//

import UIKit

class LikeItemsViewController: UITableViewController {
  
  var likeItems: [UsedItemModel.UsedItem]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // UITableView Cell Register
    let nibName = UINib(nibName: "UsedItemCell", bundle: nil)
    tableView.register(nibName, forCellReuseIdentifier: "UsedItemCell")
  }
  
  
  // MARK: - Table view data source
  
  // cell height
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let likeItems = self.likeItems else {
      return 0
    }

    return likeItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // custom cell 불러오기
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsedItemCell", for: indexPath) as? UsedItemCell else { return UITableViewCell() }
    
    guard let likeItems = self.likeItems else {
      return UITableViewCell()
    }
    
    cell.itemImage.image = UIImage(named: likeItems[indexPath.row].imagePath)
    cell.titleLabel.text = likeItems[indexPath.row].title
    cell.subDescriptionLabel.text = likeItems[indexPath.row].subDescription
    cell.priceLabel.text = likeItems[indexPath.row].price
    
    cell.itemImage.layer.cornerRadius = 5
    
    cell.heartButton.tag = indexPath.row
    cell.heartButton.addTarget(self, action: #selector(tappedHeartButton(sender:)), for: .touchUpInside)
    cell.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    
    return cell
  }
  
  @objc
  func tappedHeartButton(sender: UIButton) {
    let object = likeItems?[sender.tag].id
    NotificationCenter.default.post(name: Notification.Name("UnlikedItems"), object: object)
    
    self.likeItems?.remove(at: sender.tag)
    
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}
