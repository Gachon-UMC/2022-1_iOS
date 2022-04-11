//
//  ViewController.swift
//  LandingPageProject
//
//  Created by 이해주 on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scrollView = SubViews().scrollView
    lazy var contentView = SubViews().contentView
    lazy var appBarLogo = SubViews().appBarLogo
    lazy var introduceSectionTitle = SubViews().introduceSectionTitle
    lazy var introduceDescription = SubViews().introduceDescription
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        setScrollViewLayout()
        setContentLayout()
        setIntroduceSection()


        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: appBarLogo)
    }
    
    func setIntroduceSection() {
        /* Section Title */
        introduceSectionTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        introduceSectionTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        
        /* Description */
        introduceDescription.topAnchor.constraint(equalTo: introduceSectionTitle.bottomAnchor, constant: 12).isActive = true
        introduceDescription.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        introduceDescription.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        introduceDescription.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20).isActive = true


    }
    
    func setContentLayout() {
        /* ContentView Stretched Layout */
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
        /* Add SubViews*/
        contentView.addSubview(introduceSectionTitle)
        contentView.addSubview(introduceDescription)
        
    }
    
    
    func setScrollViewLayout() {
        /* ScrollView Stretched Layout */
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    


}

