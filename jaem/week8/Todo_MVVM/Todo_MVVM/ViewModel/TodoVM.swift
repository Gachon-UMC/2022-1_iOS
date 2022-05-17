//
//  TodoVM.swift
//  Todo_MVVM
//
//  Created by 송재민 on 2022/05/18.
//

import UIKit

class TodoVM: ObservableObject{
    @Published public var model = TodoModel()
    typealias Todo = TodoModel.Todo
    
    //전체 투두 리스트
    func todoList() -> [Todo]{
        return model.todoList
    }
    
    //투두 추가
    func addTodo(todo: Todo){
        model.addTodo(todo: todo)
    }
    
    //투두 삭제
    func deleteTodo(_ selectedId: UUID){
        model.deleteTodo(selectedId)
    }
}
