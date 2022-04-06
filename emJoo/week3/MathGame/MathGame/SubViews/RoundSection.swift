import UIKit

class RoundSection {
    lazy var roundSectionTitle: UIStackView = {
        let leftLabel =  UILabel()
        leftLabel.textColor = .white
        leftLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        leftLabel.text = "문제 개수"
        
        let rightLabel = UILabel()
        rightLabel.text = "범위 1~20"
        rightLabel.font = UIFont.systemFont(ofSize: 14)
        rightLabel.textColor = .gray
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(rightLabel)
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
}
