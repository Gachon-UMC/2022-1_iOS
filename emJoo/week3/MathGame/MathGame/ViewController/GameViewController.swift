import UIKit
import SwiftUI

class GameViewController: UIViewController, UITextFieldDelegate{
    
    var vm: Math = Math(totalRound: 0, level: 0)
    var delegate: ReceiveDataDelegate!
    var compeletedRound:Int = 0

    lazy var backArrowButton: UIBarButtonItem = {
        let barBtnItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(routeBack))
        barBtnItem.tintColor = .white
        return barBtnItem
    }()
    
    lazy var roundIndicator: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 52, height: 32))
        btn.backgroundColor = UIColor(named: "lightDark")
        btn.setTitle("\(vm.currentRound)/\(vm.totalRound)", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.backgroundColor = UIColor(named: "lightDark")
        btn.layer.cornerRadius = 16
        
        return btn
    }()
    
    lazy var mathProblemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var equalSignLabel: UILabel = {
        let label = UILabel()
        label.text = "="
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var answerTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(named: "lightDark")
        textField.textAlignment = .center
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        textField.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString(
            string: "정답",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)]
        )

        return textField
    }()
    
    lazy var answerContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightDark")
        view.layer.cornerRadius = 8
      
        return view
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavgationUISetting()
        view.addSubview(mathProblemLabel)
        view.addSubview(answerContainer)
        view.addSubview(answerTextField)
        view.addSubview(equalSignLabel)
        mathProblemLabel.text = vm.returnMathProblemLabel()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        /* MathPrombelm Label */
        mathProblemLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 120).isActive = true
        mathProblemLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        mathProblemLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        /* MathPrombelm Container */
        answerContainer.topAnchor.constraint(equalTo: mathProblemLabel.bottomAnchor, constant: 82).isActive = true
        answerContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        answerContainer.widthAnchor.constraint(equalToConstant: 154).isActive = true
        answerContainer.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        /* Texfield */
        answerTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        answerTextField.topAnchor.constraint(equalTo: answerContainer.topAnchor, constant: 0).isActive = true
        answerTextField.bottomAnchor.constraint(equalTo: answerContainer.bottomAnchor, constant: 0).isActive = true
        answerTextField.rightAnchor.constraint(equalTo: answerContainer.rightAnchor, constant:0).isActive = true
        
        /* Equal Sign */
        equalSignLabel.widthAnchor.constraint(equalToConstant: 54).isActive = true
        equalSignLabel.topAnchor.constraint(equalTo: answerContainer.topAnchor, constant: 0).isActive = true
        equalSignLabel.bottomAnchor.constraint(equalTo: answerContainer.bottomAnchor, constant: 0).isActive = true
        equalSignLabel.leftAnchor.constraint(equalTo: answerContainer.leftAnchor, constant:0).isActive = true
                
    }
    
    
    /* UI Initial Settings */
    func setNavgationUISetting() {
        self.view.backgroundColor = UIColor(named: "dark")
        self.navigationItem.leftBarButtonItem = backArrowButton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: roundIndicator)
        
    }
    
    // TextField 에서 'Rreturn을 클릭할 때'
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        print("\(vm.level)")
        if vm.math.answer == Int(text) { // 조건: 입력된 값이 정답이라면
            textField.text = "" // TextField 초기화
            vm.generateExpression() // 수식 초기화
            vm.increaseRound() // 라운드 업데이트
            if vm.isFinished { // 최종 라운드에 도달하면 Alert창을 보여줌
                showAlert()
            }
            mathProblemLabel.text = vm.returnMathProblemLabel() // 수식 라벨 값 업데이트
            roundIndicator.setTitle(vm.returnRoundLabel(), for: .normal) // 라운드 인디케이터 업데이트
        } else {
            print("정답이 아닙니다")
            print(vm.math.answer)
        }
        return true
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "성공", message: nil, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default) { _ in
            self.routeBack()
            self.delegateAction()
        }
        alert.addAction(confirm)
        self.present(alert, animated: true, completion: nil)
    }
    
    func delegateAction() {
        let willPassRound = compeletedRound + 1
        delegate.receiveChildData(self, data: willPassRound)
        print("DOES DELEGATE WORKED?")
    }


    @objc func routeBack() {
        _ = navigationController?.popToRootViewController(animated: true) // 이전 View Controller로 이동
    }
    
}




