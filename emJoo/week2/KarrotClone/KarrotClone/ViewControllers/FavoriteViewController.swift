//
//  FavoriteViewController.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController {
    
    var usedItems: [UsedItemModel.UsedItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        self.view.backgroundColor = .white
        self.title = "관심목록"
    }
    
    
}
