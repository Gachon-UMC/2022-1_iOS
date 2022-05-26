//
//  TodoViewModel.swift
//  Todo
//
//  Created by 조동진 on 2022/05/18.
//

import Foundation

class TodoViewModel: ObservableObject {
  @Published public var model = TodoModel()
  typealias Todo = TodoModel.Todo
  
  init() {
    model.loadData()
  }
  
  func getTodoList() -> [Todo] {
    return model.getTodoList()
  }
  
  func setTodoList(todoList: [Todo]) {
    model.setTodoList(todoList: todoList)
  }
  
  func getTodoFromIndex(index: Int) -> Todo {
    return model.getTodoFromIndex(index: index)
  }
  
  func addTodo(todo: Todo) {
    model.addTodo(todo: todo)
  }
  
  func deleteTodo(index: Int) {
    model.deleteTodo(index: index)
  }
  
  func editDone(index: Int) {
    model.editDone(index: index)
  }
  
  func isEmpty() -> Bool {
    return model.isEmpty()
  }
}
