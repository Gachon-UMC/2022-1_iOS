//
//  Person.swift
//  IOSTeamLanding
//
//  Created by 조동진 on 2022/04/12.
//

import Foundation
import UIKit

class Person {
  var name = ""
  var image: UIImage
  
  init(name: String, image: UIImage) {
    self.name = name
    self.image = image
  }
  
  static func fetchPerson() -> [Person] {
    return [
      Person(name: "임주", image: UIImage(systemName: "person.fill")!),
      Person(name: "애플", image: UIImage(systemName: "person.fill.turn.right")!),
      Person(name: "잼", image: UIImage(systemName: "person.fill.turn.down")!),
      Person(name: "서리", image: UIImage(systemName: "person.fill.turn.left")!)
    ]
  }
}
