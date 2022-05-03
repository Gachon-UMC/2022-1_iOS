//
//  ViewController.swift
//  NewsApp
//
//  Created by 이해주 on 2022/05/03.
//

import UIKit


class ViewController: UIViewController, ReloadProtocol {
    let vm = NewsViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsItemCell.self, forCellReuseIdentifier: NewsItemCell.cellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 30, left: 16, bottom: 0, right: 30)
        tableView.delaysContentTouches = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "News"
        view.addSubview(tableView)
        vm.delegate = self
        vm.getPost()
        setTableViewLayout()
    }
    
    private func setTableViewLayout() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
    func reload() {
        tableView.reloadData()
    }
}


protocol ReloadProtocol {
    func reload()
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.newsList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedItem = vm.newsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsItemCell.cellID, for: indexPath) as! NewsItemCell
        cell.selectionStyle = .none
        cell.contentView.isUserInteractionEnabled = true
        cell.titleLabel.text = selectedItem.title
        cell.descriptionLabel.text = selectedItem.description
      
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: selectedItem.urlToImage) else { return }
            DispatchQueue.main.async {
                cell.thumbnailImage.image = UIImage(data: data)
            }
        }

   
        return cell
    }
    
    @objc func onCheckBoxValueChange() {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SElected")
    }

}


