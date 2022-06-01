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
    private var startTime = 0.0
    private var count = 3
    
    // timer 관련, 시간 관련 변수들.
    private var preTimer: Timer!
    private var gameTimer: Timer!
    
    private var runTime: Date!
    private var formatter: DateFormatter!
    private var runTimeStr: String!
    private var isThreeCountEnded = false
    
    // Outlets.
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var countThreeLabel: UILabel!
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
        
        // 게임 시작 전 3초 카운트 해줄 타이머 생성.
        preTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countThree), userInfo: nil, repeats: true)
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
    
    /// - 버튼 액션 연결.
    private func addTargets() {
        quitButton.addTarget(self, action: #selector(tappedQuitButton), for: .touchUpInside)
    }
    
    /// - timer의 1초가 지날 때마다 실행될 메서드.
    /// - 게임 시간 측정.
    @objc
    private func timerProc(){
        // TODO: 이런 로직은 VM에 안 두고 여기에 둬도 되나...? GameModel과 시간은 관련 없는 거니까?
        // 게임 시작한지 얼마나 됐는지 (run time) 측정.
        // 현재 시간에서 시작 시간(start time)을 빼서 계산하는 방법으로.
        runTime = Date() - startTime
        
        // Date를 포맷팅할 방식을 설정 -> 분초까지만 나오도록 설정함.
        formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        
        // string으로 시간 저장.
        runTimeStr = formatter.string(from: runTime)
        // label에 시간 보여줌.
        timeLabel.text = runTimeStr
    }
    
    /// - 게임 시작 전 처음 3초 셀 때 실행되는 메서드.
    @objc
    private func countThree(timer: Timer) {
        // label 숫자 변경.
        countThreeLabel.text = String(count)
        
        count -= 1
        
        if count == -1 {
            // collectionView 리로드.
            isThreeCountEnded = true
            collectionView.reloadData()
            
            // 3초를 세준 preTimer 종료.
            preTimer!.invalidate()
            
            // countLabel 안 보이게, timeLabel 보이게.
            countThreeLabel.isHidden = true
            timeLabel.isHidden = false
            
            // 게임 runTime 카운트 시작 시간을 지금으로 설정.
            startTime = CFAbsoluteTimeGetCurrent()
            // 1초 마다 timerProc 메소드 실행하도록 타이머 생성.
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerProc), userInfo: nil, repeats: true)
        }
    }
    
    /// - Quit 버튼 누르면 실행될 액션 정의.
    @objc
    private func tappedQuitButton() {
        dismiss(animated: true, completion: nil)
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
        
        // 3초 카운트 끝났으면 cell 보이게 하고 게임 시작.
        if isThreeCountEnded {
            cell.appearCell()
        }
        
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
    
    /// - gameVM에서 호출되는 함수로서, 게임을 마무리 해준다.
    /// - 즉, 시간 측정을 종료하고 succeedVC를 띄워준다.
    func finishGame() {
        // 시간 측정 완료 -> 타이머 종료.
        gameTimer!.invalidate()
        
        // succeedVC로 화면 전환.
        guard let succeedVC = storyboard?.instantiateViewController(withIdentifier: "succeedVC") as? SucceedViewController else { return }
        
        succeedVC.modalPresentationStyle = .overFullScreen
        succeedVC.modalTransitionStyle = .crossDissolve
        
        // 데이터 전달.
        succeedVC.runTimeStr = runTimeStr
        print("runTime: ", runTimeStr!) // test
        self.present(succeedVC, animated: true, completion: nil)
    }
}
