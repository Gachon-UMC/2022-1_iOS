import UIKit

/* 1. 변수와 상수 선언 */
// 1.1 상수
let name: String = "Seori"
let swift = "swift" // 타입 추론을 통한 선언.

// 1.2 변수
var year: Int = 2022
var y = 2022

year = 2023  // 변수라서 값 변경이 가능하다.

print(year)

/* 2. 함수 만들기 */
func sum (a: Int, b: Int) -> Int {
    return a + b
}

print(sum(a: 1, b: 2))

func multiply(a: Int, b: Int) -> Int {
    a * b   // 표현식이 한 줄일 때는 return 생략 가능.
}

print(multiply(a: 10, b: 2))

/* 3. 이름 짓는 방법 */
// 3.1 Lower Camel Case - 인스턴스 / 메소드 / 함수 만들 때
// - 가장 첫 시작은 소문자로, 나머지 단어의 시작은 대문자로.
let viewController = UIViewController()

// 3.2 Upper Camel Case - 구조체 / 클래스 / 프로토콜 만들 때
// - 가장 첫 시작도 대문자로, 나머지 단어의 시작도 대문자로.
struct Person {
    let a: Int
    let b: Int
}

class Operator {
    let a: Int
    let b: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

protocol Flyable {
    func fly()  // 구체적인 구현은 클래스나 구조체 내부에서 이 프로토콜을 채택한 객체가 구현하게 된다.
}
