//
//  ViewController.swift
//  TodoApp_MVVM
//
//  Created by 서은수 on 2022/05/19.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    private var todoVM = TodoViewModel()
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupAttributes()
    }

    // MARK: - Functions
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupAttributes() {
        /* tableView attr */
        
        // 맨 첫번째 separator를 제거.
        tableView.tableHeaderView = UIView()
        // separator의 좌우 간격 설정.
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    // MARK: - Actions
    
    // plus 버튼을 누르면 할 일 추가하는 액션 실행.
    @IBAction func tappedPlusButton(_ sender: Any) {
        // alert 컨트롤러 생성.
        let alert = UIAlertController(title: "Todo", message: nil, preferredStyle: .alert)
        
        // 컨트롤러에 textField 추가.
        alert.addTextField(configurationHandler:  { (textField) in
            textField.placeholder = "Add Your Todo" // placeholder 설정.
        })
        
        // Confirm 버튼 액션 생성.
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            // textField에 적힌 값을 inputContent로 가져오기.
            let inputContent = alert.textFields?[0] ?? UITextField()
            print("Text field: \(inputContent.text ?? "")")     // test
            
            // VM을 통해 inputContent의 내용을 Todo로 추가하기.
            self.todoVM.addTodo(todo: TodoModel.Todo(id: UUID(), content: inputContent.text ?? ""))
            
            // 값이 업데이트 됐으니 테이블뷰를 리로드.
            self.tableView.reloadData()
        })
        
        // Cancel 버튼 액션 생성.
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        // 컨트롤러에 액션을 추가.
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        // 구성한 컨트롤러 present.
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 셀 갯수 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(todoVM.getTodoList().count)   // test
        return todoVM.getTodoList().count
    }
    
    // 셀 내용 구성.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.cellID) as? TodoTableViewCell else {
            preconditionFailure("테이블뷰 불러오기 실패")
        }
        
        cell.todoLabel.text = todoVM.getTodoList()[indexPath.row].content
        
        return cell
    }
    
    // 셀 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    // 셀 선택시 실행되는 메서드.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)    // test
        
        // 선택된 셀 생성.
        let selectedRow = tableView.indexPathForSelectedRow
        let selectedCell = tableView.cellForRow(at: selectedRow!) as! TodoTableViewCell
        
        // 선택된 할 일 데이터 가져오기.
        let selectedTodo = todoVM.getTodoList()[selectedRow!.row]
        // Finish 값 토글 & 그에 따라 체크 이미지 변경.
        todoVM.toggleFinished(selectedTodo.id, selectedCell.checkImageView)
    }
}
