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
    lazy var talentSectionTitle = SubViews().talentSectionTitle
    lazy var talentOtionList = SubViews().talentOtionList
    lazy var studySectionTitle = SubViews().studySectionTitle
    lazy var studyOptionList = SubViews().studyOptionList

        
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
        createVLabelList(talentsDescriptionList, talentOtionList)
        setStudySectionLayout()
        createVLabelList(studyDescriptionList, studyOptionList)
    
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: appBarLogo)
    }
    
    
    // Create Vertical Label List (It creates Label Based on array of String)
    func createVLabelList(_ passedArray: [String], _ aimStackView: UIStackView) {
          for i in 0..<passedArray.count {
              /* Content Opiton Label */
              let optionLabel = UILabel()
              let element = passedArray[i]
              optionLabel.textColor = UIColor(named: "lightGrey")
              optionLabel.font = UIFont.systemFont(ofSize: 12)
              optionLabel.text = element
              optionLabel.numberOfLines = .max
              
              /* Leading Dot */
              let dot = UIImageView(image: UIImage(named: "dot"))
              dot.contentMode = .scaleAspectFit
              
              /* Stack View */
              let optionStackView = UIStackView()
              optionStackView.addArrangedSubview(dot)
              optionStackView.addArrangedSubview(optionLabel)
              optionStackView.sizeToFit()
              optionStackView.layoutIfNeeded()
              optionStackView.distribution = .fillProportionally
              optionStackView.alignment = .leading

              aimStackView.addArrangedSubview(optionStackView)
          }
    }
    
    
    func setStudySectionLayout() {
        /* Tilte */
        studySectionTitle.topAnchor.constraint(equalTo: talentOtionList.bottomAnchor, constant: 56).isActive = true
        studySectionTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        /* Label List Stack View */
        studyOptionList.topAnchor.constraint(equalTo: studySectionTitle.bottomAnchor, constant: 12).isActive = true
        studyOptionList.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        studyOptionList.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20).isActive = true
    }
    
    
    func setTalentSectionLayout() {
        /* Title */
        talentSectionTitle.topAnchor.constraint(equalTo: introduceDescription.bottomAnchor, constant: 56).isActive = true
        talentSectionTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        /* Label List Stack View */
        talentOtionList.topAnchor.constraint(equalTo: talentSectionTitle.bottomAnchor, constant: 12).isActive = true
        talentOtionList.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        talentOtionList.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20).isActive = true
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
        contentView.addSubview(studySectionTitle)
        contentView.addSubview(studyOptionList)
    }
    
    
    func setScrollViewLayout() {
        /* ScrollView Stretched Layout */
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}



