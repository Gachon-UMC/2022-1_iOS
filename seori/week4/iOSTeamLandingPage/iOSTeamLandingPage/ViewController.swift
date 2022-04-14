//
//  ViewController.swift
//  iOSTeamLandingPage
//
//  Created by 서은수 on 2022/04/13.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables & Constants
    
    // scroll view 안에 있는 내부 뷰.
    @IBOutlet weak var contentView: UIView!
    
    // navigation bar item으로 넣을 이미지 설정. (umc 로고)
    var umcImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        imageView.image = UIImage(named: "image_1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // team label 설정.
    var teamLabel = UILabel()
    
    // team described label 설정.
    var describedLabel: UILabel = {
        let label = UILabel()
        label.text = "UMC GACHON iOS 팀은 자유롭고 활기찬 분위기 속에서 정보와 지식을 공유하며 성장하는 네트워크를 형성하는 것이 목표입니다. 팀원 모두 서로에게 좋은 자극이 되는 건강한 관계를 유지하고 있습니다. 함께 성장하기에 거리낌 없이 참여할 수 있는 열정 가득한 iOS 개발자를 기다리고 있습니다. 우리 iOS 팀은 여러분들의 많은 지원과 관심을 기다리고 있습니다!"
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 팀소개 label 생성.
    var teamIntroLabel = UILabel()
    
    // 인재상 label 생성.
    var talentLabel = UILabel()
    // 인재상의 요소 5개 label 생성.
    var talentElement1 = UILabel()
    var talentElement2 = UILabel()
    var talentElement3 = UILabel()
    var talentElement4 = UILabel()
    var talentElement5 = UILabel()
    
    // 스터디 label 생성.
    var studyLabel = UILabel()
    // 스터디 요소 3개 label 생성.
    var studyElement1 = UILabel()
    var studyElement2 = UILabel()
    var studyElement3 = UILabel()
    
    // 인재상의 요소를 담을 stackView 생성.
    lazy var talentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [talentElement1, talentElement2, talentElement3, talentElement4, talentElement5])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .equalSpacing

        return stackView
    }()
    
    // 스터디 요소를 담을 stackView 생성.
    lazy var studyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [studyElement1, studyElement2, studyElement3])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .equalSpacing

        return stackView
    }()
    
    // Collection View 설정.
    @IBOutlet weak var collectionView: UICollectionView!
    // 팀 멤버들의 정보를 받아온다.
    var membersInfo = TeamMembers.getMembersInfo()
    
    // hits view 설정.
    var hitsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "highlighting")
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // hits label 설정.
    var hitsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        // navigation bar 세팅.
        setNavigationBar()
        // labels 세팅.
        setLabels()
        
        // collection view의 dataSource 설정.
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 14, bottom: 0, right: 14)
        
        // Hits View 세팅.
        setHitsView()
    }

    // MARK: - Functions
    
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
    
    // 여러 label들이 똑같이 가지는 속성을 함수로 세팅해 준다.
    func mainLabelAttr(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func subLabelAttr(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    // 글자 하이라이팅 기능.
    func highlighting(label: UILabel, text: String) -> NSMutableAttributedString {
        let highlighted = NSMutableAttributedString(string: label.text!)
        highlighted.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "highlighting")!, range: (label.text! as NSString).range(of: text))
        return highlighted
    }
    
    // labels 세팅.
    func setLabels() {
        // text 내용 설정, highlighting 효과 넣기.
        teamLabel = mainLabelAttr("UMC IOS TEAM")
        describedLabel.attributedText = highlighting(label: describedLabel, text: "UMC GACHON iOS")
        
        teamIntroLabel = mainLabelAttr("팀 소개")
        talentLabel = mainLabelAttr("인재상")
        studyLabel = mainLabelAttr("스터디")
        
        talentElement1 = subLabelAttr("• 💻 온라인 모임에도 활발하게 참여하고 분위기를 즐겁게 같이 만들어가실 분!")
        talentElement2 = subLabelAttr("• 💻 새로운 기술을 배우는 걸 좋아하고 남들과 공유하는 걸 즐기시는 분!")
        talentElement2.attributedText = highlighting(label: talentElement2, text: "남들과 공유")
        
        talentElement3 = subLabelAttr("• 🍎 iOS에 열정 넘치고 애플 아니면 안되는 사람! (aka. 앱등이)")
        talentElement4 = subLabelAttr("• 🔥 동아리에 확실한 목표를 가지고 적극적으로 활동하실 분!")
        talentElement5 = subLabelAttr("• 🍺 술은 못마셔도 남들과 어울리기 좋아하는 분!")
        
        studyElement1 = subLabelAttr("• ✨ 유데미 강의를 들으며 워크북을 작성!")
        studyElement2 = subLabelAttr("• 🔥 저희는 Challenged Based Learning 학습을 해요. 매주 실습 과제로 단순 이론 보다는 직접 부딪치며 야생학습(?)을 합니다!")
        studyElement2.attributedText = highlighting(label: studyElement2, text: "Challenged Based Learning")
        studyElement3 = subLabelAttr("• 💻 매주 서로의 코드를 리뷰하는 문화를 가지고 있습니다!")
        
        
        // 내부 뷰에 label과 stackView 추가.
        contentView.addSubview(teamLabel)
        contentView.addSubview(describedLabel)
        contentView.addSubview(teamIntroLabel)
        contentView.addSubview(talentLabel)
        contentView.addSubview(studyLabel)
        
        contentView.addSubview(talentStackView)
        contentView.addSubview(studyStackView)
        
        // 레이아웃 설정.
        teamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21).isActive = true
        teamLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14).isActive = true
        
        describedLabel.topAnchor.constraint(equalTo: teamLabel.bottomAnchor, constant: 13).isActive = true
        describedLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14).isActive = true
        describedLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width / 1.08).isActive = true
        
        teamIntroLabel.topAnchor.constraint(equalTo: describedLabel.bottomAnchor, constant: 40).isActive = true
        teamIntroLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14).isActive = true
        teamIntroLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 10).isActive = true
    
        talentLabel.topAnchor.constraint(equalTo: teamIntroLabel.bottomAnchor, constant: 215).isActive = true
        talentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14).isActive = true
        
        talentStackView.topAnchor.constraint(equalTo: talentLabel.bottomAnchor, constant: 13).isActive = true
        talentStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 14).isActive = true
        talentStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -14).isActive = true
        talentStackView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        studyLabel.topAnchor.constraint(equalTo: talentStackView.bottomAnchor, constant: 40).isActive = true
        studyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14).isActive = true
        
        studyStackView.topAnchor.constraint(equalTo: studyLabel.bottomAnchor, constant: 13).isActive = true
        studyStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 14).isActive = true
        studyStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -14).isActive = true
        studyStackView.heightAnchor.constraint(equalToConstant: 85).isActive = true
    }
    
    // Hits View 세팅.
    func setHitsView() {
        // hitsView 추가.
        contentView.addSubview(hitsView)
        
        // 레이아웃 설정.
        hitsView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        hitsView.topAnchor.constraint(equalTo: studyStackView.bottomAnchor, constant: 43).isActive = true
        hitsView.widthAnchor.constraint(equalToConstant: 52).isActive = true
        hitsView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        // hits 데이터 불러오면서 업데이트 하기.
        getHitsNum()
        
        // hitsLabel 추가.
        hitsView.addSubview(hitsLabel)
        
        // 레이아웃 설정.
        hitsLabel.centerXAnchor.constraint(equalTo: hitsView.centerXAnchor, constant: 0).isActive = true
        hitsLabel.centerYAnchor.constraint(equalTo: hitsView.centerYAnchor, constant: 0).isActive = true
    }
    
    // 저장되어 있는 hitsNum을 불러온다. (& hits 1 증가)
    func getHitsNum() {
        DispatchQueue.main.async {
            // key 값을 통해 값을 불러옴.
            var hitsNum = UserDefaults.standard.integer(forKey: "hitsNum")
            // 현재 값에 1 증가.
            hitsNum += 1
            // 증가된 값으로 값 재설정.
            UserDefaults.standard.setValue(hitsNum, forKey: "hitsNum")
            // label의 text를 새로 설정.
            self.hitsLabel.text = "hits : " + String(hitsNum)
        }
    }
}

// MARK: - UICollectionDataSource

// carousel을 사용하기 위한 설정.
extension ViewController: UICollectionViewDataSource {
    
    // section 갯수 설정.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // section 하나당 들어갈 item 갯수 설정.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return membersInfo.count
    }
    
    // item 설정.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as! CarouselCell
        
        cell.teamMembers = membersInfo[indexPath.row]
        
        return cell
    }
}

