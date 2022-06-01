//
//  SucceedViewController.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/06/01.
//

import UIKit

class SucceedViewController: UIViewController {
    
    // MARK: - Properties
    
    // 게임 플레이 시간 측정 종료 시간.
    var gamePlayTime = 0.0
    
    @IBOutlet weak var succeedView: UIView!
    @IBOutlet weak var gamePlayTimeLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttributes()
        addTargets()
        
        // TODO: 시간 포맷팅 방식 변경하기.
        gamePlayTimeLabel.text = "\(Int(gamePlayTime)):\(Int((gamePlayTime - Double(Int(gamePlayTime))) * 100))"
    }
    
    // MARK: - Functions
    
    private func setupAttributes() {
        /* succeed view attr */
        succeedView.layer.cornerRadius = 12
    }

    private func addTargets() {
        // 버튼 액션 연결.
        confirmButton.addTarget(self, action: #selector(tappedConfirmButton), for: .touchUpInside)
    }
    
    @objc
    private func tappedConfirmButton() {
        // rankVC로 화면 전환.
        guard let rankVC = storyboard?.instantiateViewController(withIdentifier: "rankVC") as? RankViewController else { return }
        
        // TODO: Completion에 rankVC로 playTime 데이터 전달하기.
        present(rankVC, animated: true, completion: nil)
    }

}
