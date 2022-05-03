//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by 이해주 on 2022/05/03.
//

import UIKit

class NewsViewModel: ObservableObject {
    var newsList: [News] = []
    var delegate: ReloadProtocol?

  
    func getPost() {
        delegate?.reload()
        // URL, Optional Type
        guard let url = URL.init(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=c4237fc3e9d74fcbb84d1b7a725efc41") else { return }
        print("DID RUN?")

        fetchApi(fromUrl: url) { data in
            if let data = data {
                guard let newPost = try? JSONDecoder().decode(Newsfeed.self, from: data) else { return }
                // Background Thread에서 관리
                DispatchQueue.main.async { [weak self] in
                    self?.newsList = newPost.articles
                    print("API 호출 성공")
                    self?.delegate?.reload()
                }
            } else {
                print("호출 실패")
            }
        }
    }
    
    // Escape Closure
    func fetchApi(fromUrl url: URL, complectionHnalder: @escaping (_ data: Data?) -> ()) {
        // Networking Api Source 관리 및 예외처리 진행
        print("get")
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("API 호출 실패 [fetch 단계]")
                print("AIM")
                complectionHnalder(nil)
                return
            }
            print()
            complectionHnalder(data)
        }
        .resume()
    }
    
}
