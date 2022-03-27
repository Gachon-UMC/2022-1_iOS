//
//  ViewController.swift
//  CarrotMarket
//
//  Created by 서은수 on 2022/03/27.
//

import UIKit

class ViewController: UIViewController {

    var usedItems = UsedItemModel().usedItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(usedItems[0].title)
    }


}

