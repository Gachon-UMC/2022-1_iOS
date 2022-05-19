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
    
    /// 전체 투두 리스트
    func getTodoList() -> [Todo] {
        return model.todoList
    }
    
    /// 체크 표시 토글 로직
    func toggleFinished(_ selectedId: UUID, _ checkImageView: UIImageView) {
        guard let selectedTodo = getTodoList().first(where: {$0.id == selectedId}) else { return }
        
        /*
         isFinished 값이 전환되기 전의 값을 가지고 image를 세팅하는 것이기 때문에 로직을 반대로.
         -> isFinished가 현재 true라면 model 안에서 false가 되어 올 것이므로 image를 .none로 설정.
         -> isFinished가 현재 false라면 model 안에서 true가 되어 올 것이므로 image를 checkmark로 설정.
         */
        if selectedTodo.isFinished {
            checkImageView.image = .none
        } else {
            checkImageView.image = UIImage(systemName: "checkmark")
        }
        
        return model.toggleFinished(selectedId)
    }
    
    /// 할일 추가
    func addTodo(todo: Todo) {
        model.addTodo(todo: todo)
    }
    
    /// 할일 삭제
    func deleteTodo(_ selectedId: UUID) {
        model.deleteTodo(selectedId)
    }
    
}
