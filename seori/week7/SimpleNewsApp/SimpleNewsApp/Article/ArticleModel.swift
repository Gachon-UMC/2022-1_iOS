//
//  ArticleModel.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/01.
//
// News Api 관련 코드 참고: https://donggyu9410.medium.com/api-%EB%81%8C%EC%96%B4%EC%99%80%EC%84%9C-%EA%B0%84%EB%8B%A8%ED%95%9C-ios-%EC%95%B1-%EB%A7%8C%EB%93%A4%EA%B8%B01-68f78273fa1d

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(articles: [Article])
}

class ArticleModel {
    
    var delegate: ArticleModelProtocol?
    
    // 신문 기사 정보를 요청하는 함수.
    // 받은 JSON 데이터를 article 인스턴스로 파싱한 뒤, protocol과 delegate pattern을 이용해서 데이터를 ViewController로 전달한다.
    func getArticles(country: String = "us") {
        // Request articles
        // Parse the returned JSON into article instances and pass it back to the view controller with the protocol and delegate pattern
        
        // 1. 요청할 url를 string으로 담아둔다.
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country)&category=business&apiKey=8653c0d64a9a450cbfb4cdad3350e779"
        // 2. 해당 스트링으로 URL 인스턴스를 생성.
        let url = URL(string: urlString)
        // 3. 해당 url이 만약에 nil 값이라면 이곳에서 중지.
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        // 4. URLSession 생성.
        let session = URLSession.shared
        
        // 5. URLSession을 이용해서 dataTask 생성.
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            // 6. error가 없고 data를 성공적으로 불러왔을 때에만 동작한다.
            if error == nil && data != nil {
                // 7. JSON 데이터를 swift 인스턴스 객체로 바꿔주기 위해서 decoder 객체를 생성한다!
                let decoder = JSONDecoder()
                
                // 8. decode함수는 예기치못한 에러를 발생할 수 있으므로 try-catch문을 작성한다. swift문에서는 do-catch문!
                do {
                    // 9. try 문을 앞에 붙여서 JSON 데이터를 이전에 만들어준 ArticleService 모양의 swift 인스턴스로 파싱한다.
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // 10. 데이터를 성공적으로 받아왔다면 일전에 만들어놓은 ArticleModelProtocol의 articlesRetrieved 함수를 이용해서 articles를 ViewController에 보내준다. 여기서 주의할 점은 ArticleModel의 getArticles 함수는 background thread에서 동작하고 있다. 하지만 ViewController에서 articles를 받아오면 바로 화면에 띄워줘야 하기 때문에, UI관련 로직은 많은 프로세스사양을 요구하므로 main thread에서 articlesRetrieved 함수를 동작시켜주어야 한다. 때문에 DispatchQueue.main.async 구문을 사용한다!
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles: articleService.articles!)
                    }
                }
                catch {
                    print("Error parsing the json")
                }
            }
        }
        // 11. datatask 준비가 완료되었다면 datatask를 실행한다.
        datatask.resume()
    }
}
