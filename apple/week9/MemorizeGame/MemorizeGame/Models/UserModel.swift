//
//  UserModel.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/28.
//

import Foundation

struct UserModel {
  var userList: [User] = [] {
    didSet {
      saveData()
      userList = userList.sorted(by: { $0.clearTime < $1.clearTime })
    }
  }
  
  func getUserList() -> [User] {
    return userList
  }
  
  func getUserListStringArray() -> [String] {
    var userStringArray: [String] = []
    
    for user in userList {
      userStringArray.append(user.name + " / " + user.date + " / " + user.clearTime)
    }
    
    return userStringArray
  }
  
  mutating func addUser(user: User) {
    userList.append(user)
  }
  
  mutating func removeAllUser() {
    userList.removeAll()
  }
  
  mutating func loadData() {
    if let data = UserDefaults.standard.value(forKey: "userList") as? Data {
      let userList = try? PropertyListDecoder().decode([User].self, from: data)
      
      self.userList = userList ?? []
    }
  }
  
  mutating func saveData() {
    UserDefaults.standard.set(try? PropertyListEncoder().encode(userList), forKey: "userList")
  }
  
  struct User: Codable {
    let name: String
    let date: String
    let clearTime: String
  }
}

