//
//  GameViewController.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/23.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: - Properties
    
    /* ViewModel */
    private var gameVM = GameViewModel()
    public var categoryIndex = -1
    
    // 게임 플레이 시간 측정 시작 시간.
    let startTime = CFAbsoluteTimeGetCurrent()
    // 게임 플레이 시간 측정 종료 시간.
    var gamePlayTime = 0.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var quitButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupAttributes()
        addTargets()
        
        // 프로토콜 구현을 위한 delegate 설정.
        gameVM.delegate = self
    }
    
    // MARK: - Functions
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupAttributes() {
        /* timeLabel attr */
        timeLabel.clipsToBounds = true
        timeLabel.layer.cornerRadius = 12
        timeLabel.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    private func addTargets() {
        // 버튼 액션 연결.
        quitButton.addTarget(self, action: #selector(tappedQuitButton), for: .touchUpInside)
    }
    
    // Quit 버튼 누르면 실행될 액션 정의.
    @objc
    private func tappedQuitButton() {
        dismiss(animated: true, completion: nil)
        // 1. 시간 측정 끝.
        gamePlayTime = CFAbsoluteTimeGetCurrent() - startTime
        print(gamePlayTime)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 셀 갯수 설정.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    // 셀 내용 지정.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as? GameCollectionViewCell else { fatalError() }
        
        // 해당 카테고리의 게임 데이터 로드.
        gameVM.loadingGameData(categoryIndex)
        
        // 순서대로 셀 내용 설정.
        cell.layer.cornerRadius = 11
        cell.dataLabel.text = gameVM.getCard(indexPath.item).data

        return cell
    }
    
    // 셀이 선택됐을 때 실행할 동작.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 이미 정답인 셀은 선택돼도 반응이 없어야 하기 때문에 아무 동작도 취하지 않고 메서드 종료.
        if gameVM.getCard(indexPath.item).isRight { return }
        
        // 선택된 셀.
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? GameCollectionViewCell else { return }
        
        // 상황에 따라 카드를 뒤집을지/말지 결정.
        let result = gameVM.selectCard(indexPath.item)
        
        switch result {
        case 1:
            selectedCell.showBack()
        case 2:
            selectedCell.showFront()
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    // 아이템 사이즈 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 105, height: 125)
    }
    
    // 열(column)의 최소 간격 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(12)
    }
    
    // 아이템 간의 최소 간격 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(12)
    }
}

// MARK: - GameSuccessProtocol

extension GameViewController: GameSuccessProtocol {
    
    // gameVM에서 호출되는 함수로서, 게임을 마무리 해준다.
    // 즉, 시간 측정을 종료하고 succeedVC를 띄워준다.
    func finishGame() {
        // 시간 측정 완료.
        gamePlayTime = CFAbsoluteTimeGetCurrent() - startTime
        
        // 시간 formatting...
        let digit: Double = pow(10, 2) // 10의 2제곱.
        // 3번째 자리에서 반올림한 수로 업데이트.
        gamePlayTime = round(gamePlayTime * digit) / digit
        print(gamePlayTime)   // test
        
        // succeedVC로 화면 전환.
        guard let succeedVC = storyboard?.instantiateViewController(withIdentifier: "succeedVC") as? SucceedViewController else { return }
        
        succeedVC.modalPresentationStyle = .overFullScreen
        succeedVC.modalTransitionStyle = .crossDissolve
        
        succeedVC.gamePlayTime = self.gamePlayTime
        self.present(succeedVC, animated: true, completion: nil)
    }
}
