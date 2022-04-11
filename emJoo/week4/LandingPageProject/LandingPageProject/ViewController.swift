//
//  ViewController.swift
//  LandingPageProject
//
//  Created by 이해주 on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    let descriptionText = "UMC GACHON iOS 팀은 자유롭고 활기찬 분위기 속에서 정보와 지식을 공유하며 성장하는 네트워크를 형성하는 것이 목표입니다. 팀원 모두 서로에게 좋은 자극이 되는 건강한 관계를 유지하고 있습니다. 함께 성장하기에 거리낌 없이 참여할 수 있는 열정 가득한 iOS 개발자를 기다리고 있습니다. 우리 iOS 팀은 여러분들의 많은 지원과 관심을 기다리고 있습니다!"
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var appBarLogo: UIImageView = {
        let img = UIImageView(image: UIImage(named: "umc_logo"))
        
        return img
    }()
    
    lazy var sectionTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "lightGrey")
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var introduceSectionTitle: UILabel = {
        let sectionLabel = sectionTitle
        sectionTitle.text = "UMC IOS TEAM"
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false

        return sectionLabel
    }()
    
    lazy var introduceDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "lightGrey")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .max
        label.text = descriptionText
        
        return label
    }()
    
    

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

