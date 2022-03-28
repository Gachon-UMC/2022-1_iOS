//
//  ViewController.swift
//  CarrotmarketClone
//
//  Created by 송재민 on 2022/03/28.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var usedItems = UsedItemModel().usedItems
    
    @IBOutlet weak var itemListView: UITableView!
    
    @IBOutlet weak var navBarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarView.addBorder(.bottom, color: .label, thickness: 1)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        cell.itemTitle.text = usedItems[indexPath.row].title
        cell.itemSubDes.text = usedItems[indexPath.row].subDescription
        cell.itemPrice.text = String(usedItems[indexPath.row].price)
        cell.itemImg.image = UIImage(named: usedItems[indexPath.row].imagePath)
        cell.itemLike.image = UIImage(named: "orangeEmptyHeart")
        
        cell.itemImg.layer.cornerRadius = 6
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 148
    }
}

extension UIView{
    /*view에 보더 주기*/
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat){
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = color
        self.addSubview(subview)
        switch edge{
        case .bottom:
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        default:
            break
        }
    }
}

