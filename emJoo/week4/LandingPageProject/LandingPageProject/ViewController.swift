//
//  ViewController.swift
//  LandingPageProject
//
//  Created by 이해주 on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {
    let dataArr = ["2,5","5,1"]
    
    
    let talentsOptionContentsList = ["💻 온라인 모임에도 활발하게 참여하고 분위기를 즐겁게 같이 만들어가실 분!", "💻 새로운 기술을 배우는 걸 좋아하고 남들과 공유하는 걸 즐기시는 분!", "🍎 iOS에 열정 넘치고 애플 아니면 안되는 사람! (aka. 앱등이)", "🔥 동아리에 확실한 목표를 가지고 적극적으로 활동하실 분!", "🍺 술은 못마셔도 남들과 어울리기 좋아하는 분!"]
    
    lazy var scrollView = SubViews().scrollView
    lazy var contentView = SubViews().contentView
    lazy var appBarLogo = SubViews().appBarLogo
    lazy var introduceSectionTitle = SubViews().introduceSectionTitle
    lazy var introduceDescription = SubViews().introduceDescription
    lazy var talentSectionTitle = SubViews().talentSectionTitle
    lazy var talentOtionList: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        stackView.axis = .vertical
        
        return stackView
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
        setTalentSectionLayout()
        createVLabelList(talentsOptionContentsList)
        

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: appBarLogo)
    }
    
    
    func createVLabelList(_ passedArray: [String]) {
          for i in 0..<passedArray.count {
              let optionLabel = UILabel()
              let element = talentsOptionContentsList[i]
              optionLabel.textColor = UIColor(named: "lightGrey")
              optionLabel.font = UIFont.systemFont(ofSize: 12)
              optionLabel.text = element
              optionLabel.numberOfLines = .max
              optionLabel.sizeToFit()
              talentOtionList.addArrangedSubview(optionLabel)

          }
        
        talentOtionList.topAnchor.constraint(equalTo: talentSectionTitle.bottomAnchor, constant: 12).isActive = true
        talentOtionList.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        talentOtionList.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20).isActive = true
    }
    
    
    func setTalentSectionLayout() {
        /* Title */
        talentSectionTitle.topAnchor.constraint(equalTo: introduceDescription.bottomAnchor, constant: 56).isActive = true
        talentSectionTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        /* TableView */

        
        
    }
    
    
    
    func setIntroduceSection() {
        /* Title */
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
        contentView.addSubview(talentSectionTitle)
        contentView.addSubview(talentOtionList)
        
        
    }
    
    
    func setScrollViewLayout() {
        /* ScrollView Stretched Layout */
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}



