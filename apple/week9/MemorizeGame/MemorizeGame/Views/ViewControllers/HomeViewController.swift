//
//  HomeViewController.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/26.
//

import UIKit
typealias Card = GameModel.Card

class HomeViewController: UIViewController {
  // MARK: Variables
  @IBOutlet weak var categoryTableView: UITableView!
  
  var gameViewModel = GameViewModel()
  var selectedCard: Card?
  var isSelected = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableViewConfig()
  }
  
  // MARK: Actions
  private func tableViewConfig() {
    categoryTableView.dataSource = self
    categoryTableView.delegate = self
    categoryTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    
    categoryTableView.separatorInset.right = 20
  }
  
  @IBAction func tapStartGame(_ sender: UIButton) {
    for cell in categoryTableView.visibleCells {
      if cell.accessoryType == .checkmark { isSelected = true }
    }
    
    if isSelected {
      guard let gameViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else { return }
      
      gameViewController.card = selectedCard
      
      gameViewController.modalPresentationStyle = .fullScreen
      self.show(gameViewController, sender: nil)
    } else {
      let alert = UIAlertController(title: "Error!", message: "You didn't choose a category", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default)
      alert.addAction(okAction)
      
      self.present(alert, animated: true)
    }
  }
  
}

// MARK: TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gameViewModel.getCategoryString().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let categoryStrings = gameViewModel.getCategoryString()
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
    
    cell.categoryLabel.text = categoryStrings[indexPath.row]
    cell.selectionStyle = .none
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    for cell in tableView.visibleCells {
      if cell.accessoryType == .checkmark { cell.accessoryType = .none }
    }
    
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    
    gameViewModel.initCards()
    selectedCard = gameViewModel.getCard(index: indexPath.row)
  }
}
