//
//  RankViewController.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/26.
//

import UIKit

class RankViewController: UIViewController {
  // MARK: Variables
  @IBOutlet weak var userTableView: UITableView!
  
  var userViewModel = UserViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableViewConfig()
  }
  
  // MARK: Actions
  private func tableViewConfig() {
    userTableView.dataSource = self
    userTableView.delegate = self
    userTableView.register(UINib(nibName: "RankTableViewCell", bundle: nil), forCellReuseIdentifier: "RankTableViewCell")
    
    userTableView.separatorInset.right = 20
  }
  
  @IBAction func tapDeleteAllButton(_ sender: UIButton) {
    let alert = UIAlertController(title: "Delete All", message: "Are you sure you want to delete them all?", preferredStyle: .alert)
    let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: { _ in
      self.userViewModel.removeAllUser()
      self.userTableView.reloadData()
    })
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    alert.addAction(confirmAction)
    alert.addAction(cancelAction)
    self.present(alert, animated: true)
  }
}

// MARK: TableView
extension RankViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userViewModel.getUserList().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "RankTableViewCell", for: indexPath) as? RankTableViewCell else { return UITableViewCell() }
    
    cell.numberLabel.text = String(indexPath.row + 1)
    cell.userLabel.text = userViewModel.getUserListStringArray()[indexPath.row]
    cell.selectionStyle = .none
    
    return cell
  }
  
  
}
