//
//  ViewController.swift
//  Protocol2
//
//  Created by 조동진 on 2022/04/02.
//

import UIKit

// Protocol을 통해 Person에 기능, 능력을 부여
protocol Flyable {
  func fly()
}

protocol Runnable {
  func run()
}

// Protocol 채택 -> 채택한 protocol에서 정의하는 메서드를 정의해줌으로써 준수해야 함
class Person: Flyable, Runnable {
  func fly() {
    print("날았다.")
  }
  
  func run() {
    print("달렸다.")
  }
}

class ViewController: UIViewController {
  
  let person = Person()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    person.fly()
    person.run()
  }


}

