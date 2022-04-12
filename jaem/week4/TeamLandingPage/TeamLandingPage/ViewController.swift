//
//  ViewController.swift
//  TeamLandingPage
//
//  Created by 송재민 on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var introductionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var bulletText: UILabel!
    @IBOutlet weak var bulletText2: UILabel!
    
    @IBOutlet weak var hitsView: UIView!
    @IBOutlet weak var hitsLabel: UILabel!
    
    var hits: Int = 0
    var members = Member.fetchMember()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.changeTextColor()
        
        collectionView.dataSource = self
        
        bulletText.numberOfLines = 0
        bulletText.attributedText = bulletPointList(strings: ["💻 온라인 모임에도 활발하게 참여하고 분위기를 즐겁게 같이 만들어가실 분!","💻 새로운 기술을 배우는 걸 좋아하고 남들과 공유하는 걸 즐기시는 분!", "🍎 iOS에 열정 넘치고 애플 아니면 안되는 사람! (aka. 앱등이)", "🔥 동아리에 확실한 목표를 가지고 적극적으로 활동하실 분!", "🍺 술은 못마셔도 남들과 어울리기 좋아하는 분!"])
        bulletText2.numberOfLines = 0
        bulletText2.attributedText = bulletPointList(strings: ["✨유데미 강의를 들으며 워크북을 작성!","🔥 저희는 Challenged Based Learning 학습을 해요. \n\t매주 실습 과제로 단순 이론 보다는 직접 부딪치며 야생학습(?)을 합니다!", "💻 매주 서로의 코드를 리뷰하는 문화를 가지고 있습니다!"])
        
        hitsView.layer.cornerRadius = 5
        
        self.loadHits()
        self.saveHits()
    }

    /*라벨 안에서 일부 텍스트의 색상을 변경하는 함수*/
    func changeTextColor(){
        guard let text = self.introductionLabel.text else{return}
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: "newGreen") as Any, range: (text as NSString).range(of: "UMC GACHON iOS"))
        self.introductionLabel.attributedText = attributeString
    }
    
    /*bullet point 리스트*/
    func bulletPointList(strings: [String]) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 15
        paragraphStyle.minimumLineHeight = 24
        paragraphStyle.maximumLineHeight = 24
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15)]

        let stringAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor(named: "silver_text"),
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]

        let string = strings.map({ "•\t\($0)" }).joined(separator: "\n")

        return NSAttributedString(string: string,
                                  attributes: stringAttributes as [NSAttributedString.Key : Any])
    }
    
    func loadHits(){
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.string(forKey: "hits") else { return }
        hits = Int(data)!
        self.hitsLabel.text = "hits : " + String(hits)
    }
    func saveHits(){
        let userDefaults = UserDefaults.standard
        userDefaults.set(hits+1, forKey: "hits")
    }
}

/*carousel 구현*/
extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemberCollectionViewCell", for: indexPath) as! MemberCollectionViewCell
        
        let member = members[indexPath.item]
        
        cell.member = member
        
        return cell
    }
    
}
