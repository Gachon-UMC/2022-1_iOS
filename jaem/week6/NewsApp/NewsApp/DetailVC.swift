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
    var newsDate: String = ""
    var author: String = ""
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        let endIdx:String.Index = newsDate.index(newsDate.startIndex, offsetBy: 9)
        
        titleLbl.text = newsTitle
        contentLbl.text = newsContent
        let url = URL(string: imageUrl)
        self.newsImg.kf.setImage(with: url)
        dateLbl.text = String(newsDate[...endIdx])
        authorLbl.text = author
    }
}
