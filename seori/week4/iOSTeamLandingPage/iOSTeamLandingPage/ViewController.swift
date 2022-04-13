//
//  ViewController.swift
//  iOSTeamLandingPage
//
//  Created by 서은수 on 2022/04/13.
//

import UIKit

class ViewController: UIViewController {

    // scroll view 안에 있는 내부 뷰.
    @IBOutlet weak var contentView: UIView!
    
    // navigation bar item으로 넣을 이미지 설정. (umc 로고)
    var umcImage: UIImageView = {
        let umcImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        umcImage.image = UIImage(named: "image_1")
        umcImage.contentMode = .scaleAspectFit
        return umcImage
    }()
    
    // team label 설정.
    var teamLabel: UILabel = {
        let teamLabel = UILabel()
        teamLabel.text = "UMC IOS TEAM"
        teamLabel.textColor = .lightGray
        teamLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return teamLabel
    }()
    
    // team introduction label 설정.
    var introLabel: UILabel = {
        let introLabel = UILabel()
        introLabel.text = "UMC GACHON iOS 팀은 자유롭고 활기찬 분위기 속에\n서 정보와 지식을 공유하며 성장하는 네트워크를 형성하는 \n것이 목표입니다. 팀원 모두 서로에게 좋은 자극이 되는 건\n강한 관계를 유지하고 있습니다. 함께 성장하기에 거리낌 \n없이 참여할 수 있는 열정 가득한 iOS 개발자를 기다리고 \n있습니다. 우리 iOS 팀은 여러분들의 많은 지원과 관심을 \n기다리고 있습니다!"
        introLabel.numberOfLines = 0
        introLabel.textColor = .gray
        introLabel.font = UIFont.systemFont(ofSize: 16)
        
        let highlighted = NSMutableAttributedString(string: introLabel.text!)
        highlighted.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "highlighting")!, range: (introLabel.text! as NSString).range(of: "UMC GACHON iOS"))
        introLabel.attributedText = highlighted
        
        return introLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        // navigation bar 세팅.
        setNavigationBar()
        
        // label 세팅.
        setLabels()
    }

    // navigation bar 세팅.
    func setNavigationBar() {
        // leftBarButtonItem을 umcImage로 설정.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: umcImage)
        
        // 색깔 설정.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .black
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        // 스크롤 했을 때도 색깔이 똑같이 black으로 보이도록 설정.
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setLabels() {
        // 내부 뷰에 label 추가.
        contentView.addSubview(teamLabel)
        contentView.addSubview(introLabel)
        
        // 레이아웃 설정.
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        
        teamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21).isActive = true
        teamLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14).isActive = true
        
        introLabel.topAnchor.constraint(equalTo: teamLabel.bottomAnchor, constant: 13).isActive = true
        introLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14).isActive = true
    }
}

