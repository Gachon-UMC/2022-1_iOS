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
    public var runTimeStr: String!
    
    @IBOutlet weak var succeedView: UIView!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttributes()
        addTargets()
    }
    
    // MARK: - Functions
    
    private func setupAttributes() {
        /* succeed view attr */
        succeedView.layer.cornerRadius = 12
        
        /* runTime label attr */
        runTimeLabel.text = runTimeStr
    }

    private func addTargets() {
        // 버튼 액션 연결.
        confirmButton.addTarget(self, action: #selector(tappedConfirmButton), for: .touchUpInside)
    }
    
    @objc
    private func tappedConfirmButton() {
        // 첫 화면으로 돌아가기.
        // TODO: rankVC로 runTime 데이터 전달하기.
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

}
