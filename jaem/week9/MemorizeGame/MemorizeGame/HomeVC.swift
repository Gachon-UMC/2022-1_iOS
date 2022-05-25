//
//  ViewController.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/05/25.
//

import UIKit

class HomeVC: UIViewController {
    
    var menuVM = MenuVM()
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var startBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*테이블 ui 구성*/
        self.menuTableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.menuTableView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        self.menuTableView.tableHeaderView = UIView()
        self.menuTableView.dataSource = self
        self.menuTableView.delegate = self
    }


}

extension HomeVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuVM.getMenuList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.selectionStyle = .none
        cell.titleLabel.text = menuVM.getMenuList()[indexPath.row].title
        cell.accessoryType = .none
        
        menuVM.getMenuList()[indexPath.row].isSelected
        ? (cell.accessoryType = .checkmark)
        : (cell.accessoryType = .none)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.menuVM.selectMenu(index: indexPath.row)
        
        self.menuTableView.reloadData()
    }
}
