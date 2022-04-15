//
//  HomeViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/15.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // cell의 구분선을 제거.
        tableView.separatorStyle = .none
        
        // Nib 파일을 셀로 등록.
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 한 section에 몇 개의 cell을 넣을 것인지 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 어떠한 cell을 보여줄 것인지 설정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()    // else -> 기본 셀을 반환.
        }
        // cell이 선택됐을 때 색깔 바뀌는 효과 제거.
        cell.selectionStyle = .none
        return cell
    }
    
    // cell의 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
}
