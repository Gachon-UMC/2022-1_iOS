//
//  ViewController.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    
    let ellipsisButton = Subviews.ellipsisButton
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation bar 설정.
        setupNav()
    }
    
    // MARK: - Functions
    
    // navigation bar 설정.
    func setupNav() {
        view.addSubview(ellipsisButton)
        ellipsisButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        ellipsisButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // large title 설정.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "News"
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 34, weight: .semibold)]
        
        // right bar button item을 커스텀한 버튼으로 지정.
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: ellipsisButton)
    }
}

