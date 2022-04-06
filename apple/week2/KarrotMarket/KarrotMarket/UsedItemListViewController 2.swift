//
//  UsedItemListViewController.swift
//  KarrotMarket
//
//  Created by 조동진 on 2022/03/28.
//

import UIKit

class UsedItemListViewController: UITableViewController {
  
  var usedItems = UsedItemModel().usedItems;
  var index = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // UITableView Cell Register
    let nibName = UINib(nibName: "UsedItemCell", bundle: nil)
    tableView.register(nibName, forCellReuseIdentifier: "UsedItemCell")
    
    // bar button item
    self.configBarButtonItems()
    
    // receive data from LikeItemsVC
    NotificationCenter.default.addObserver(self, selector: #selector(receiveUnlikedItemsId(_:)), name: Notification.Name("UnlikedItems"), object: nil)
  }

  @objc
  func receiveUnlikedItemsId(_ notification: Notification) {
    let unlikeItemsId = notification.object as! Int
    
    for item in usedItems {
      if item.id == unlikeItemsId {
        self.usedItems[index].isLiked = false
        
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
      
      self.index += 1
    }
    
    self.index = 0
  }
  
  func configBarButtonItems() {
    // right bar button item
    let areaLabel = UILabel()
    areaLabel.text = "복산동"
    areaLabel.font = UIFont.boldSystemFont(ofSize: 18)
    
    let arrowIcon = UIImageView(image: UIImage(systemName: "arrowtriangle.down.circle"))
    arrowIcon.tintColor = .black
    
    let leftStackView = UIStackView(arrangedSubviews: [areaLabel, arrowIcon])
    leftStackView.spacing = 4
    
    let leftBarButtonItem = UIBarButtonItem(customView: leftStackView)
    
    
    // left bar button item
    let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    let heartIcon = UIImageView(image: UIImage(systemName: "heart"))
    let bellIcon = UIImageView(image: UIImage(systemName: "bell"))
    
    searchIcon.tintColor = .black
    heartIcon.tintColor = .black
    bellIcon.tintColor = .black
    
    let rightStackView = UIStackView(arrangedSubviews: [searchIcon, heartIcon, bellIcon])
    rightStackView.spacing = 15
    
    let rightBarButtonItem = UIBarButtonItem(customView: rightStackView)
    
    
    navigationItem.rightBarButtonItem = rightBarButtonItem
    navigationItem.leftBarButtonItem = leftBarButtonItem
    
    // Add UIImageView Gesture
    let heartIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(UsedItemListViewController.tapHeartIcon))
    heartIcon.isUserInteractionEnabled = true
    heartIcon.addGestureRecognizer(heartIconTapGesture)
  }
  
  @objc
  func tapHeartIcon(sender: UITapGestureRecognizer) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let likeItemsViewController = storyboard.instantiateViewController(withIdentifier: "LikeItemsViewController") as? LikeItemsViewController else { return }
 
    likeItemsViewController.likeItems = usedItems.filter{ $0.isLiked == true }
    self.navigationController?.pushViewController(likeItemsViewController, animated: true)
  }
  
  
  
  // MARK: - Table view data source
  
  // cell height
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  
  // number of rows in section
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return usedItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // custom cell 불러오기
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsedItemCell", for: indexPath) as? UsedItemCell else { return UITableViewCell() }
    
    cell.itemImage.image = UIImage(named: usedItems[indexPath.row].imagePath)
    cell.titleLabel.text = usedItems[indexPath.row].title
    cell.subDescriptionLabel.text = usedItems[indexPath.row].subDescription
    cell.priceLabel.text = usedItems[indexPath.row].price
    
    cell.itemImage.layer.cornerRadius = 5
    
    cell.heartButton.tag = indexPath.row
    cell.heartButton.addTarget(self, action: #selector(tappedHeartButton(sender:)), for: .touchUpInside)
    if usedItems[indexPath.row].isLiked == false {
      cell.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
    } else {
      cell.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    return cell
  }
  
  @objc
  func tappedHeartButton(sender: UIButton) {
    let indexPath = IndexPath(row: sender.tag, section: 0)
    
    let cell = tableView.cellForRow(at: indexPath) as? UsedItemCell
    
    if cell?.heartButton.currentImage == UIImage(systemName: "heart") {
      cell?.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
      usedItems[indexPath.row].isLiked = true
    } else {
      cell?.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
      usedItems[indexPath.row].isLiked = false
    }
    
  }
  
}
