//
//  TodoViewModel.swift
//  TodoApp_MVVM
//
//  Created by 서은수 on 2022/05/19.
//

import UIKit

class TodoViewModel: ObservableObject {
    
    @Published public var model = TodoModel()
    typealias Todo = TodoModel.Todo // Todo라는 별칭으로 TodoModel.Todo 타입을 사용하겠다.
    
    /// 전체 투두 리스트 가져오기
    func getTodoList() -> [Todo] {
        return model.todoList
    }
    
    /// 체크 표시 토글하기
    func toggleFinished(_ selectedId: UUID, _ checkImageView: UIImageView) {
        return model.toggleFinished(selectedId)
    }
    
    /// 할 일 추가하기
    func addTodo(todo: Todo) {
        model.addTodo(todo: todo)
    }
    
    /// 할 일 삭제하기
    func deleteTodo(_ selectedId: UUID) {
        model.deleteTodo(selectedId)
    }
    
    /// 할 일(todo) 중간에 추가 -> 셀 위치 바꿀 때!
    func insertTodo(todo: Todo, index: Int) {
        model.insertTodo(todo: todo, index: index)
    }
}
