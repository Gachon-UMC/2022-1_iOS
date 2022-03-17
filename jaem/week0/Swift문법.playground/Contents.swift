import UIKit

var greeting = "Hello, playground"

/*1. 변수와 상수 선언*/
// 1.1 상수
let name : String = "Uno"
let swift = "Swift"

// 1.2 변수
var year : Int = 2022
var y = 2022

year = 2023
print(year)

/*2. 함수 만들기*/
func sum(a: Int, b: Int) -> Int{
    return a+b
}

//print(sum(a:y, b:2))

func multiply(a: Int, b: Int) -> Int{
    a*b // 한 줄일 경우 'return' 생략 가능
}

print(multiply(a:2, b:3))

/* 3. 이름 짓기 */
// 3.1 Lower camel case - 인스턴스 / 메소드 / 함수
// 시작은 소문자 나머지 단어의 시작은 대문자
let viewController = UIViewController()


// 3.2 Upper camel case - 구조체 / 클래스 / 프로토콜
// 시작과 나머지 단어의 시작 모두 대문자

struct Person{
    let a: Int
    let b: Int
} // 구조체는 자동으로 초기화 함수 생성

class Operator{
    let a: Int
    let b: Int
    
    init(a: Int, b:Int){ //초기화 함수
        self.a = a
        self.b = b
    }
} // 클래스는 자동으로 초기화 함수 생성 x

protocol Flyable{
    func fly()
}
