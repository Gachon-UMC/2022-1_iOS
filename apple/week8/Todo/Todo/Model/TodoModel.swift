//
//  TodoModel.swift
//  Todo
//
//  Created by 조동진 on 2022/05/18.
//

import Foundation

struct TodoModel {
  var todoList: [Todo] = [] {
    willSet {
      saveData()
    }
    didSet {
      saveData()
    }
  }
  
  mutating func getTodoList() -> [Todo] {
    return todoList
  }
  
  mutating func setTodoList(todoList: [Todo]) {
    self.todoList = todoList
  }
  
  mutating func getTodoFromIndex(index: Int) -> Todo {
    return todoList[index]
  }
  
  mutating func addTodo(todo: Todo) {
    todoList.append(todo)
  }
  
  mutating func deleteTodo(index: Int) {
    todoList.remove(at: index)
  }
  
  mutating func editDone(index: Int) {
    todoList[index].done = !todoList[index].done
  }
  
  func isEmpty() -> Bool {
    return todoList.isEmpty
  }
  
  func saveData() {
    UserDefaults.standard.set(try? PropertyListEncoder().encode(todoList), forKey: "todoList")
  }
  
  mutating func loadData() {
    if let data = UserDefaults.standard.value(forKey: "todoList") as? Data {
      let todoList = try? PropertyListDecoder().decode([Todo].self, from: data)
      
      self.todoList = todoList ?? []
    }
  }
  
  struct Todo: Codable {
    var content: String
    var done: Bool
  }
}
