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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavi()
    }

    // navigation bar 구성.
    func initNavi() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftStackView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightStackView)
    }

}

