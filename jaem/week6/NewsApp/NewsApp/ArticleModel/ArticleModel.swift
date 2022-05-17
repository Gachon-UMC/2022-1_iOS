//
//  NewsModel.swift
//  NewsApp
//
//  Created by 송재민 on 2022/05/12.
//

import Foundation

protocol ArticleModelProtocol {
    func articleRetrieved(articles:[Article])
}

class ArticleModel{
    var delegate:ArticleModelProtocol?
    
    func getArticles(){
        let urlString = "https://newsapi.org/v2/top-headlines?country=kr&apiKey=f2a79448bc5142e192ada2c486b2f162"
        let url = URL(string: urlString)
        
        guard url != nil else{
            print("Coudln't create url object")
            return
        }
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: url!){
            (data, response, error) in
            if error == nil&&data != nil{
                let decoder = JSONDecoder()
                
                do{
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrieved(articles: articleService.articles!)
                    }
                }
                catch{
                    print("Error parsing the json")
                }
            }
        }
        datatask.resume()
    }
}
