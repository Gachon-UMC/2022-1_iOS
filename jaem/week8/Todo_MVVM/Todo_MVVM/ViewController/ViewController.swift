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
    
    
    @IBAction func addTodo(_ sender: Any) {
        let alert = UIAlertController(title: "Todo", message: nil, preferredStyle: .alert)
        alert.addTextField{ textField in
            textField.placeholder = "Add Your Todo"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler:{ _ in guard let text = alert.textFields?[0].text else {return}
            if text != ""{
                self.todoVM.addTodo(todo: TodoModel.Todo(id: UUID(), todo: text, isFinished: false))
            }
        }))
        
        todoTableView.reloadData()
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoList = todoVM.todoList()
        print(todoList.count)
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 44
        }
}


