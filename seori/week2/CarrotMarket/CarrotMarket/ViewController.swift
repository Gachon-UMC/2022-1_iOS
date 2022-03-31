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

        // tableView 사용을 위한 delegate와 dataSource 설정.
        customTableView.delegate = self
        customTableView.dataSource = self

        initNavi()
    }

    // navigation bar 구성.
    func initNavi() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftStackView)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightStackView)
        
        navigationController?.addCustomBottomLine(color: UIColor.label, height: 1.3)
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    // 행의 갯수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedItems.count
    }
    
    // 행의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

    // 행 안의 컴포넌트 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = customTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell else {
            preconditionFailure("테이블 뷰 가져오기 실패")
        }

        customCell.usedItemImage.image = UIImage(named: usedItems[indexPath.row].imagePath)
    
        customCell.usedItemTitle.text = usedItems[indexPath.row].title
        customCell.usedItemSubdescription.text = usedItems[indexPath.row].subDescription
        
        // 32000 -> 32,000원으로 formatting.
        customCell.usedItemPrice.text = usedItems[indexPath.row].price.formatted() + "원"

        return customCell
    }
}

extension UINavigationController {
    
    // navigation bar 밑에 색 있는 라인 커스텀.
    func addCustomBottomLine(color: UIColor, height: Double) {
        // Hiding Default Line and Shadow
        navigationBar.setValue(true, forKey: "hidesShadow")
        
        // Creating New line
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: height))
        lineView.backgroundColor = color
        navigationBar.addSubview(lineView)

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.widthAnchor.constraint(equalTo: navigationBar.widthAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        lineView.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
    }
}
