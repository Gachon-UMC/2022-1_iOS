//
//  TodoTableViewController.swift
//  Todo
//
//  Created by 조동진 on 2022/05/16.
//

import UIKit
typealias Todo = TodoViewModel.Todo

class TodoTableViewController: UITableViewController {
  var todoViewModel = TodoViewModel()
  
  var doneButton: UIBarButtonItem?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // variable config
    self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDoneButton))
    
    // navigationBar config
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    // tableView config
    let nibName = UINib(nibName: "TodoTableViewCell", bundle: nil)
    self.tableView.register(nibName, forCellReuseIdentifier: "TodoTableViewCell")
    self.tableView.tableHeaderView = UIView()
    self.tableView.separatorInset.left = 0
    self.tableView.separatorInset.right = 0
  }
  
  
  // MARK: Actions
  @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Todo", message: nil, preferredStyle: .alert)
    let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: { [weak self] _ in
      guard let content = alert.textFields?[0].text else { return }
      let todo = Todo(content: content, done: false)
      self?.todoViewModel.addTodo(todo: todo)
      self?.tableView.reloadData()
    })
    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
    
    alert.addAction(cancelButton)
    alert.addAction(confirmAction)
    alert.addTextField(configurationHandler: {textField in
      textField.placeholder = "Add Your Todo"
    })
    
    self.present(alert, animated: true)
  }
  
  @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
    guard !self.todoViewModel.isEmpty() else { return }
    self.navigationItem.leftBarButtonItem = self.doneButton
    self.tableView.setEditing(true, animated: true)
  }
  
  @objc func tapDoneButton() {
    self.navigationItem.leftBarButtonItem = self.editButtonItem
    self.tableView.setEditing(false, animated: true)
  }
  
  
  // MARK: - Table view data source & delegate
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.todoViewModel.getTodoList().count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as? TodoTableViewCell else { return UITableViewCell() }
    let todo = self.todoViewModel.getTodoFromIndex(index: indexPath.row)
    
    cell.contentLabel.text = todo.content
    if todo.done {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    self.todoViewModel.deleteTodo(index: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .automatic)
    
    if self.todoViewModel.isEmpty() {
      self.tapDoneButton()
    }
  }
  
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    var todoList = self.todoViewModel.getTodoList()
    let todo = todoList[sourceIndexPath.row]
    
    todoList.remove(at: sourceIndexPath.row)
    todoList.insert(todo, at: destinationIndexPath.row)
    
    self.todoViewModel.setTodoList(todoList: todoList)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.todoViewModel.editDone(index: indexPath.row)
    self.tableView.reloadRows(at: [indexPath], with: .automatic)
  }
}
