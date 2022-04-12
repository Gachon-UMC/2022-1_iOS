import Foundation
import UIKit

class SubViews {
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
    
    /* Introduce Section */
    
    lazy var sectionTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "lightGrey")
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var introduceSectionTitle: UILabel = {
        let sectionLabel = sectionTitle
        sectionLabel.text = "UMC IOS TEAM"
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
        
    lazy var teamSectionTitle: UILabel = {
        let sectionLabel = sectionTitle
        sectionLabel.text = "팀 소개"
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return sectionLabel
    }()
    
    
    /* Talent Section */
    
    
    lazy var talentSectionTitle: UILabel = {
        let sectionLabel = sectionTitle
        sectionLabel.text = "인재상"
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return sectionLabel
    }()
    
    lazy var talentOtionList: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 14
        stackView.axis = .vertical
        
        return stackView
    }()
    
    lazy var studySectionTitle: UILabel = {
        let label = sectionTitle
        label.text = "스터디"
        label.translatesAutoresizingMaskIntoConstraints = false 
        
        return label
    }()
    
    lazy var studyOptionList: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 14
        stackView.axis = .vertical
        
        return stackView
    }()
}
