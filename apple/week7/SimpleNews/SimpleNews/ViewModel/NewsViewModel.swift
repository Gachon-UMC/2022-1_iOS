//
//  NewsViewModel.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/12.
//
import Alamofire

class NewsViewModel {
  var newsData: [NewsData]?
  var favoritesNewsData: [NewsData]?
  var resetHeartButton: Int?
  
  init() {
    self.newsData = []
    self.favoritesNewsData = []
    self.resetHeartButton = 0
  }
  
  // data load method
  func getNewsData(country: String, viewController: ViewController) {
    let url = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=03b86d8db9494091827fbe501a17d37a"

    AF.request(url, method: .get, parameters: nil).responseData{ response in
      switch response.result {
      case let .success(data):
        do {
          let result = try JSONDecoder().decode(NewsModel.self, from: data)
          self.newsData = result.articles
          viewController.tableview.reloadData()
        } catch(let error) {
          print(error.localizedDescription)
        }
      case let .failure(error):
        print(error.localizedDescription)
      }
    }
  }
  
  // Data manager methods
  func addFavoritesNews(data: NewsData) {
    self.favoritesNewsData?.append(data)
  }
  
  func removeFavoritesNews(index: Int) {
    self.favoritesNewsData?.remove(at: index)
  }
  
  func removeAllFavoritesNews() {
    self.favoritesNewsData?.removeAll()
  }
}
