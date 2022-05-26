//
//  RankViewController.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/23.
//

import UIKit

class RankViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteAllButton: UIBarButtonItem!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 버튼에 타겟, 액션 연결.
        deleteAllButton.target = self
        deleteAllButton.action = #selector(tappedDeleteAllButton)
    }
    
    // MARK: - Functions
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Delete All 버튼 누르면 실행될 액션 정의.
    @objc
    private func tappedDeleteAllButton() {
        print("removeAll")  // test
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension RankViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankTableViewCell.identifier) as? RankTableViewCell else { fatalError() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
}
