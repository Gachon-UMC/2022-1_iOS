//
//  DetailVC.swift
//  NewsApp
//
//  Created by 송재민 on 2022/05/05.
//

import UIKit

class DetailVC : UIViewController{
    var newsTitle: String = ""
    var newsContent: String = ""
    var imageUrl: String = ""
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        
        titleLbl.text = newsTitle
        contentLbl.text = newsContent
        let url = URL(string: imageUrl)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!){
                DispatchQueue.main.async {
                    self.newsImg.image = UIImage(data: data)
                }
            }

        }
    }
}
