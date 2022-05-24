//
//  ViewController.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/23.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    private var categoryVM = CategoryViewModel()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 셀 갯수 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryVM.getCounts()
    }
    
    // 셀 내용 지정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {
            fatalError()
        }
        
        cell.categoryLabel.text = categoryVM.getCategory(indexPath.row)
        
        return cell
    }
    
    // 셀 높이 지정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    // 셀 선택됐을 때 실행.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell else {
            fatalError()
        }
        
        selectedCell.accessoryType = .checkmark
    }
    
    // 해당 셀의 선택이 취소됐을 때 실행. (ex. 다른 셀이 새로 선택됐을 때, 기존에 선택돼 있던 셀에서 실행된다.)
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell else {
            fatalError()
        }
        
        selectedCell.accessoryType = .none
    }
    
}
