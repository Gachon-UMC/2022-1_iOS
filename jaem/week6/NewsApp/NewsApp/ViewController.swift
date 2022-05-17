//
//  ViewController.swift
//  NewsApp
//
//  Created by 송재민 on 2022/05/04.
//

import UIKit

class ViewController: UIViewController {
    
    var articles = [Article]()
    var model = ArticleModel()
    
    @IBOutlet var tableView: UITableView!
    var newsData :Array<Dictionary<String,Any>>?
    
    /*뉴스 데이터 가져오기*/
    /*
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=f2a79448bc5142e192ada2c486b2f162")!) { (data, response, error) in
            if let dataJson = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    let articles = json["articles"] as! Array<Dictionary<String,Any>>
                    self.newsData = articles
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
                catch{
                    
                }
            }
        }
        
        task.resume()
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.delegate = self
        model.getArticles()
        
        tableView.delegate = self
        tableView.dataSource = self
        let newsNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(newsNib, forCellReuseIdentifier: "NewsTableViewCell")
        
        self.navigationItem.title = "News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //getNews()
    }
    


}

extension ViewController : ArticleModelProtocol{
    
    func articleRetrieved(articles: [Article]){
        print("news retrieved from news model")
        self.articles = articles
        tableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
        if let news = newsData{
            return news.count
        }else{
            return 0
        }*/
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else{
            return UITableViewCell()
        }
        
        let article = self.articles[indexPath.row]
        
        cell.displayArticle(article: article)
        
        cell.likeClickedAction = {
            cell.heartSelected
            ? cell.heartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            : cell.heartBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            cell.heartSelected = !cell.heartSelected
        }
        
        /*
        cell.likeClickedAction = {
            if(cell.heartSelected == false){
                cell.heartBtn.setImage(UIImage(systemName: "heart_fill"), for: .normal)
                cell.heartSelected = true
            }else{
                cell.heartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
                cell.heartSelected = true
            }
        }*/
    
        
        //let idx = indexPath.row
        
        /*
        if let news = newsData{
            
            let row = news[idx]
            if let r = row as? Dictionary<String, Any>{
                if let title = r["title"] as? String{
                    cell.titleLbl.text = title
                }
                if let content = r["description"] as? String{
                    cell.contentLbl.text = content
                }
                if let imageUrl = r["urlToImage"] as? String{
                    let url = URL(string: imageUrl)
                    cell.newsImg.kf.setImage(with: url)
                }
            }
        }
         */
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let newsDetail = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        /*
        if let news = newsData{
            let row = news[indexPath.row]
            if let r = row as? Dictionary<String, Any>{
                if let title = r["title"] as? String{
                    newsDetail.newsTitle = title
                }
                if let content = r["description"] as? String{
                    newsDetail.newsContent = content
                }
                if let imageUrl = r["urlToImage"] as? String{
                    newsDetail.imageUrl = imageUrl
                }
            }
        }*/
        
        newsDetail.newsTitle = articles[indexPath.row].title ?? ""
        newsDetail.newsContent = articles[indexPath.row].description ?? ""
        newsDetail.imageUrl = articles[indexPath.row].urlToImage ?? ""
        newsDetail.author = articles[indexPath.row].author ?? ""
        newsDetail.newsDate = articles[indexPath.row].publishedAt ?? ""
        
        //showDetailViewController(newsDetail, sender: nil)
        self.navigationController?.pushViewController(newsDetail, animated: true)
    }
     
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176
    }
}

#if canImport(SwiftUI) && (DEBUG)
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    let viewController: UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ViewController_Preview: PreviewProvider {
    
    static var previews: some View {
        ViewControllerRepresentable(viewController: UINavigationController(rootViewController: ViewController()))
    }
}
#endif
