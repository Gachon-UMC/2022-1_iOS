//
//  TodoModel.swift
//  Todo_MVVM
//
//  Created by 송재민 on 2022/05/18.
//

import Foundation

struct TodoModel{
    
    var todoList: [Todo] = [Todo(id: UUID(), todo: "example", isFinished: false)]

    /*mutating 키워드를 붙이면 self 프로퍼티에 새로운 인스턴스 할당 가능*/
    //투두리스트 추가
    mutating func addTodo(todo: Todo){
        todoList.append(todo)
    }
    
    //투두리스트 삭제
    mutating func deleteTodo(_ selectedId: UUID){
        guard let index = todoList.firstIndex(where: { todo in
            todo.id == selectedId
        }) else {return}
        
        todoList.remove(at: index)
    }
    
    //투두리스트 중간에 추가 (row 이동시에 사용)
    mutating func insertTodo(todo: Todo, index: Int){
        todoList.insert(todo, at: index)
    }
    
    //투두 완료/취소
    mutating func completeTodo(_ selectedId: UUID){
        guard let index = todoList.firstIndex(where: { todo in
            todo.id == selectedId
        }) else {return}
        
        todoList[index].isFinished = !todoList[index].isFinished
    }
    
    /*ID 구현을 위해 identifiable 프로토콜 사용?*/
    struct Todo: Identifiable{
        var id: UUID
        var todo: String
        var isFinished: Bool = false
    }
}
