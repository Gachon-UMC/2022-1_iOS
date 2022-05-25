//
//  ViewController.swift
//  Todo_MVVM
//
//  Created by 송재민 on 2022/05/18.
//

import UIKit

class ViewController: UIViewController {
    
    var todoVM = TodoVM() // View Model
    var todoList: Array<TodoVM.Todo> = []
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    @IBOutlet weak var editDoneBtn: UIBarButtonItem!
    
    /*edit 버튼 액션*/
    @IBAction func editTable(_ sender: Any) {
        if(self.todoTableView.isEditing){
            self.editDoneBtn.title = "Edit"
            self.todoTableView.setEditing(false, animated: true)
        }else{
            self.editDoneBtn.title = "Done"
            self.todoTableView.setEditing(true, animated: true)
        }
    }
    
    /*추가 버튼 액션*/
    @IBAction func addTodo(_ sender: Any) {
        let alert = UIAlertController(title: "Todo", message: nil, preferredStyle: .alert)
        alert.addTextField{ textField in
            textField.placeholder = "Add Your Todo"
        }
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler:{ _ in guard let text = alert.textFields?[0].text else {return}
            if text != ""{
                self.todoVM.addTodo(todo: TodoModel.Todo(id: UUID(), todo: text, isFinished: false))
                self.todoList = self.todoVM.todoList()
                self.todoTableView.reloadData()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoList = todoVM.todoList()

        self.todoTableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.todoTableView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        self.todoTableView.tableHeaderView = UIView()
        self.todoTableView.dataSource = self
        self.todoTableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        cell.selectionStyle = .none
        cell.todoLabel.text = todoList[indexPath.row].todo
        
        if(todoList[indexPath.row].isFinished){
            cell.checkIcon.image = UIImage(systemName: "checkmark")
        }else{
            cell.checkIcon.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 44
        }
    
    /*edit 동작*/
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            self.todoVM.deleteTodo(todoList[indexPath.row].id)
            self.todoList = self.todoVM.todoList()
            self.todoTableView.reloadData()
        }
    }
    
    /*Row 이동*/
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let targetItem: String = self.todoList[sourceIndexPath.row].todo
        
        self.todoVM.deleteTodo(todoList[sourceIndexPath.row].id)
        self.todoVM.insertTodo(todo: TodoModel.Todo(id: UUID(), todo: targetItem, isFinished: false), index: destinationIndexPath.row)
        
        self.todoList = self.todoVM.todoList()
        self.todoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.todoVM.completeTodo(self.todoList[indexPath.row].id)
        
        self.todoList = self.todoVM.todoList()
        self.todoTableView.reloadData()

    }
}


