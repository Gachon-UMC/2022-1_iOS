/* Anchor & NSLayout을 이용하여 인터페이스 구현 */

/*   TroubleShooting
 1.  UIStackView 다른 클래스 호출할 경우 Subview들의 property를 변경하지 못함.
 */


import UIKit

class ViewController: UIViewController {
    static let diceImagePath = ["DiceOne", "DiceTwo" ,"DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    
    /* State Variables (상태를 저장하는 변수) */
    var isPlaying: Bool = false
    var displayNum: Int?
    var firstDiceNum: Int?
    var secondDiceNum: Int?
    
    
    /* Interface (Subviews) */
    lazy var logo = SubView().logo
    lazy var mainLabel = SubView().mainLabel
    lazy var dice1 = SubView().dice1
    lazy var dice2 = SubView().dice2
    lazy var rollButton = SubView().rollButton
    lazy var buttonStackView: UIStackView = { // TS(1)
        let stackView = UIStackView(arrangedSubviews: [dice1, dice2])
        stackView.axis = .horizontal
        stackView.spacing = 28
        
        return stackView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Layer Background Image (백그라운드 이미지)
        view.layer.contents = #imageLiteral(resourceName: "GreenBackground").cgImage
        
        
        // Add Subviews (서브 연동)
        view.addSubview(logo)
        view.addSubview(mainLabel)
        view.addSubview(buttonStackView)
        view.addSubview(rollButton)
        
        
        // Add target (타겟 메소드 적용)
        rollButton.addTarget(self, action: #selector(tapRollButton), for: .touchUpInside)
        dice1.addTarget(self, action: #selector(tapDice), for: .touchUpInside)
        dice2.addTarget(self, action: #selector(tapDice), for: .touchUpInside)
    
        
        
        
        // Resizeing Make 적용
        logo.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Constraints (constant값 제약 조건)
        logo.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60).isActive = true
        mainLabel.topAnchor.constraint(equalTo: logo.layoutMarginsGuide.bottomAnchor, constant: 42).isActive = true
        rollButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: rollButton.layoutMarginsGuide.topAnchor, constant: -82).isActive = true
        
        
        
        // Align Contrains with NS (Align 레이아웃 설정)
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: Intent (내부 비즈니스 로직)
    
    
//    dev : dice Button 메소드 연결 (전달받은 UIButton의 Tag 값에 따라 예외처리 진행)
    @objc func tapDice (sender: UIButton) {
        let randomDiceNum = Int.random(in: 0..<5)
        
        if sender.tag == 1 { // 조건: 첫 번째 주사위 버튼이 클릭 되었을 경우
            self.dice1.configuration?.image = UIImage(named: ViewController.diceImagePath[randomDiceNum])
            checkAnswer(dice1Num: randomDiceNum, dice2Num: nil)
            
            
        } else { // 조건 : 두 번째 주사위 버튼이 클릭 되었을 경우
            self.dice2.configuration?.image = UIImage(named: ViewController.diceImagePath[randomDiceNum])
            checkAnswer(dice1Num: nil, dice2Num: randomDiceNum)
            
        }
    }

    
    
    // 'Roll' Button을 클릭 했을 때
    @objc func tapRollButton () {
                
        // Genereate Random Int Number (랜덤 숫자 생성)
        let randomDiceNum1 = Int.random(in: 0..<6)
        let randomDiceNum2 = Int.random(in: 0..<6)
        self.firstDiceNum = randomDiceNum1
        self.secondDiceNum = randomDiceNum2
        
        if !isPlaying { // 조건: 게임을 진행하고 있지 않다면 == 초기화면 화면 일 때
            let generateNum = Int.random(in: 2..<13)
            self.mainLabel.text = String(generateNum)
            self.displayNum = generateNum
            
            // Dice 이미지 변경
            self.dice1.configuration?.image = UIImage(named: ViewController.diceImagePath[randomDiceNum1])
            self.dice2.configuration?.image = UIImage(named: ViewController.diceImagePath[randomDiceNum2])
            

            isPlaying = true
            
        } else { // 조건 : 게임을 진행하고 있을 때
            // Dice 이미지 변경
            self.dice1.configuration?.image = UIImage(named: ViewController.diceImagePath[randomDiceNum1])
            self.dice2.configuration?.image = UIImage(named: ViewController.diceImagePath[randomDiceNum2])
            
        }

        // 게임 성공 여부 확인 로직
        checkAnswer(dice1Num: randomDiceNum1, dice2Num: randomDiceNum2)
        
        
    }
    
    
    // 조건에 따라 Alert창을 보여줌
    func showAlert () {
        // should show alert
        let alert = UIAlertController(title: "Your Correct", message: "Greate Job", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirm", style: .cancel) { _ in
            self.resetHandler()
        }
        alert.addAction(confirm)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    // 모든 State Varialbe과 인터페이스 초기값들을 리셋
    func resetHandler () {
        self.mainLabel.text = "Start Game"
        self.displayNum = nil
        self.firstDiceNum = nil
        self.secondDiceNum = nil
        self.isPlaying = false
        self.dice1.configuration?.image = UIImage(named: "DiceOne")
        self.dice2.configuration?.image = UIImage(named: "DiceOne")
    }
    
    
    // 주사위 숫자를 파라미터로 받아 정답을 판별하는 로직
    func checkAnswer(dice1Num: Int?, dice2Num: Int?) {
        // 전달 받은 dice 숫자를 Nullable을 기준으로 예외처리를 진행 (삼항연산자)
        // ex) 첫 번째 주사위 클릭 -> 두 번째 주사위 == nil -> 두 번째 주사위 숫자 값에 전역변수에 저장된 값 할당
        guard let firsNum = dice1Num == nil ? self.firstDiceNum : dice1Num else { return }
        guard let secondNum = dice2Num == nil ? self.secondDiceNum : dice2Num else { return }
        
        if self.displayNum == firsNum + secondNum + 2 {
            showAlert()
        }
        
    }
}

