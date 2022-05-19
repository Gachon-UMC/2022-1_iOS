//
//  TodoModel.swift
//  TodoApp_MVVM
//
//  Created by 서은수 on 2022/05/19.
//

import Foundation

struct TodoModel {
    
    // MARK: - Property
    
    var todoList: [Todo] = [Todo(id: UUID(), content: "Implement todo app")]
    
    // MARK: Model
    
    struct Todo: Identifiable {
        let id: UUID
        var content: String
        var isFinished = false
    }
    
    // MARK: - Functions
    
    /// 할 일(todo) 추가
    mutating func addTodo(todo: Todo) {
        todoList.append(todo)
    }
    
    /// 할 일 삭제
    mutating func deleteTodo(_ selectedId: UUID) {
        guard let index = todoList.firstIndex(where: { todo in
            todo.id == selectedId
        }) else { return }
        todoList.remove(at: index)
    }
    
    /// 할 일 끝냈을 때 체크 표시 토글
    mutating func toggleFinished(_ selectedId: UUID) {
        guard var selectedTodo = todoList.first(where: {$0.id == selectedId}) else { return }
        
        // Bool 값을 전환.
        selectedTodo.isFinished.toggle()
        
        guard let index = todoList.firstIndex(where: { todo in
            todo.id == selectedId
        }) else { return }
        
        todoList[index] = selectedTodo
    }
}
