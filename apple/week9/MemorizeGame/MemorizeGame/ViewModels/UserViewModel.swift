//
//  UserViewModel.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/28.
//

import Foundation

class UserViewModel: ObservableObject {
  @Published public var model = UserModel()
  typealias User = UserModel.User
  
  init() {
    model.loadData()
  }
  
  func getUserList() -> [User] {
    return model.getUserList()
  }
  
  func getUserListStringArray() -> [String] {
    model.getUserListStringArray()
  }
  
  func addUser(user: User) {
    model.addUser(user: user)
  }
  
  func removeAllUser() {
    model.removeAllUser()
  }
}
