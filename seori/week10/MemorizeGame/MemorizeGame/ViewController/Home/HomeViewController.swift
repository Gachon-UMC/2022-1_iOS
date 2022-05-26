//
//  HomeViewController.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/23.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    /* ViewModel */
    private var gameVM = GameViewModel()
    // 카테고리 인덱스를 저장할 변수 생성.
    private var categoryIndex = -1
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startGameButton: UIBarButtonItem!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 버튼에 타겟, 액션 연결.
        startGameButton.target = self
        startGameButton.action = #selector(tappedStartGameButton)
    }
    
    // MARK: - Functions
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Start Game 버튼 누르면 실행되는 액션.
    @objc
    func tappedStartGameButton() {
        // gameVC로 화면 전환.
        guard let gameVC = storyboard?.instantiateViewController(withIdentifier: "gameVC") as? GameViewController else { return }
        
        // 부드러운 화면 전환을 위해 crossDissolve 스타일로 설정함.
        gameVC.modalTransitionStyle = .crossDissolve
        
        // 카테고리를 정했을 때에만 화면 전환이 되도록 설정.
        if categoryIndex != -1 {
            gameVC.categoryIndex = categoryIndex    // 카테고리 값을 gameVC에게 전달.
            present(gameVC, animated: true, completion: nil)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 셀 갯수 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameVM.getCategoryCounts()
    }
    
    // 셀 내용 지정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {
            fatalError()
        }
        
        cell.categoryLabel.text = gameVM.getCategory(indexPath.row)
        
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
        
        // 선택된 셀에 checkmark 표시.
        selectedCell.accessoryType = .checkmark
        // 선택된 셀의 row 값을 카테고리 인덱스로 설정.
        categoryIndex = indexPath.row
    }
    
    // 해당 셀의 선택이 취소됐을 때 실행. (ex. 다른 셀이 새로 선택됐을 때, 기존에 선택돼 있던 셀에서 실행된다.)
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell else {
            fatalError()
        }
        
        // 선택 해제된 셀에 accessory 제거.
        selectedCell.accessoryType = .none
    }
    
}
