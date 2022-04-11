//  수학 게임에서 사용되는 모델

import Foundation

struct MathModel {
    var oneDigitNum1 = Int.random(in: 1..<10)
    var oneDigitNum2 = Int.random(in: 1..<10)
    var twoDigitNum1 = Int.random(in: 10..<20)
    var twoDigitNum2 = Int.random(in: 10..<20)
    var mathGame: MathGame
    
    func answerOnSubmit(_ answer: Int) {
        print(answer)
    }
    
    mutating func generateExpression(level: Int) {
        // 각 자릿수 숫자를 초기화
        oneDigitNum1 = Int.random(in: 1..<10)
        oneDigitNum2 = Int.random(in: 1..<10)
        twoDigitNum1 = Int.random(in: 10..<100)
        twoDigitNum2 = Int.random(in: 10..<100)
        
        // 초기화된 각 자릿수 숫자 인자값으로 store data를 initialize 진행
        switch level {
        case 0: // ex) 6 + 2
            mathGame = MathGame(firstN: oneDigitNum1, secondN: oneDigitNum2, thirdN: nil, answer: oneDigitNum1 + oneDigitNum2)
        case 1: // ex) 12 + 7
            mathGame = MathGame(firstN: twoDigitNum1, secondN: oneDigitNum1, thirdN: nil, answer: twoDigitNum1 + oneDigitNum1)
        case 2: // ex) 43 + 29
            mathGame = MathGame(firstN: twoDigitNum1, secondN: twoDigitNum2, thirdN: nil, answer: twoDigitNum1 + twoDigitNum2)
        case 3: // ex) 3 + 21 + 46
            mathGame = MathGame(firstN: oneDigitNum1, secondN: twoDigitNum1, thirdN: twoDigitNum2, answer: oneDigitNum1 + twoDigitNum1 + twoDigitNum2)
        case 4: // ex) 21 X 3 + 9
            mathGame = MathGame(firstN: twoDigitNum1, secondN: oneDigitNum1, thirdN: oneDigitNum2, answer: (twoDigitNum1 * oneDigitNum1) + oneDigitNum2)
            
        default:
            mathGame = MathGame(firstN: oneDigitNum1, secondN: oneDigitNum2, thirdN: nil, answer: oneDigitNum1 + oneDigitNum2)
        }
    }
    
    mutating func generateNumber() {
        print(oneDigitNum1)
        oneDigitNum1 = Int.random(in: 1..<10)
    }
        
    
    // 선택된 레벨에 따라 계산에 사용되는 인자값이 다르게 initialize됨.
    init(level: Int) {
        switch level {
        case 0: // ex) 6 + 2
            mathGame = MathGame(firstN: oneDigitNum1, secondN: oneDigitNum2, thirdN: nil, answer: oneDigitNum1 + oneDigitNum2)
        case 1: // ex) 12 + 7
            mathGame = MathGame(firstN: twoDigitNum1, secondN: oneDigitNum1, thirdN: nil, answer: twoDigitNum1 + oneDigitNum1)
        case 2: // ex) 43 + 29
            mathGame = MathGame(firstN: twoDigitNum1, secondN: twoDigitNum2, thirdN: nil, answer: twoDigitNum1 + twoDigitNum2)
        case 3: // ex) 3 X 21 + 46
            mathGame = MathGame(firstN: oneDigitNum1, secondN: twoDigitNum1, thirdN: twoDigitNum2, answer: oneDigitNum1 + twoDigitNum1 + twoDigitNum2)
        case 4: // ex) 21 X 3 X 9
            mathGame = MathGame(firstN: twoDigitNum1, secondN: oneDigitNum1, thirdN: oneDigitNum2, answer: (twoDigitNum1 * oneDigitNum1) + oneDigitNum2)
            
        default:
            mathGame = MathGame(firstN: oneDigitNum1, secondN: oneDigitNum2, thirdN: nil, answer: oneDigitNum1 + oneDigitNum2)
        }
    }
    
   
    


    struct MathGame {
        var firstN: Int
        var secondN: Int
        var thirdN : Int? // 문제 난이도에 따라 3번 째 인자값이 없을 수 있음
        var answer: Int // 문제 정답
   
    }
    
}
