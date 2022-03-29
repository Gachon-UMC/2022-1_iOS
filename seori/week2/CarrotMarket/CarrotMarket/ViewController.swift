//
//  ViewController.swift
//  CarrotMarket
//
//  Created by 서은수 on 2022/03/27.
//

import UIKit

class ViewController: UIViewController {

    var usedItems = UsedItemModel().usedItems
    
    @IBOutlet weak var leftStackView: UIStackView!
    @IBOutlet weak var rightStackView: UIStackView!
    
    @IBOutlet weak var customTableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        customTableView.delegate = self
        customTableView.dataSource = self
        
        customTableView.rowHeight = 150

        // initNavi()
    }

    // navigation bar 구성.
    func initNavi() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftStackView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightStackView)
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = customTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell else {
            preconditionFailure("테이블 뷰 가져오기 실패")
        }

        customCell.usedItemImage.image = UIImage(named: usedItems[indexPath.row].imagePath)

        customCell.usedItemTitle.text = usedItems[indexPath.row].title
        customCell.usedItemSubdescription.text = usedItems[indexPath.row].subDescription
        customCell.usedItemPrice.text = String(usedItems[indexPath.row].price) + "원"

        return customCell
    }
}
