//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by 송재민 on 2022/05/04.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    var likeClickedAction :(()->())?
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var heartBtn: UIButton!
    
    var articleToDisplay:Article?
    var heartSelected:Bool = false
    
    func displayArticle(article:Article){
        articleToDisplay = article
        
        titleLbl.text = articleToDisplay!.title
        
        contentLbl.text = articleToDisplay!.description
        
        guard articleToDisplay!.urlToImage != nil else{
            return
        }
        
        let urlString = articleToDisplay!.urlToImage!
        let url = URL(string: urlString)
        
        guard url != nil else{
            print("coudn't create url object")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!){
            (data, response, error) in
            if(error == nil && data != nil){
                self.newsImg.kf.setImage(with: url)
            }
        }
        dataTask.resume()
    }
    
    @objc func likeClicked(){
        likeClickedAction?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.heartBtn.addTarget(self, action: #selector(likeClicked), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
