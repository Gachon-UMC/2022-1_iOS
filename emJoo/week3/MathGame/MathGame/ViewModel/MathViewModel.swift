

import SwiftUI

class Math: ObservableObject {
    typealias Math = MathModel.MathGame
    
    @Published var isFinished = false // 게임 종료 여부
    @Published private(set) var currentRound: Int = 1
    @Published private(set) var totalRound:Int
    let level: Int
    @Published var model: MathModel
    
    var math: Math {
        model.mathGame
    }
    
    init(totalRound: Int, level: Int) {
        self.totalRound = totalRound
        self.level = level
        self.model = MathModel(level: level)
    }
    
    //MARK: - Intent
    

    // 현재 라운드 수 증가
    func increaseRound() {
        if currentRound < totalRound {
            currentRound += 1
        } else {
            isFinished = true
        }
    }
    
    // 새로운 수식을 generate
    func generateExpression() {
        model.generateExpression(level: level)
    }
    
    
    // 수학 문제 라벨 text값을 반환하는 메소드 (전달 받은 레벨에 따라)
    func setMathProblemLabel() -> String {
        switch level {
        case 3:
            return "\(math.firstN) + \(math.secondN) + \(math.thirdN!)"
        case 4:
            return "(\(math.firstN)X\(math.secondN)) + \(math.thirdN!)"

        default:
            return "\(math.firstN) + \(math.secondN)"
        }
    }
    
}
