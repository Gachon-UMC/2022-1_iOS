
import UIKit

class DifficultySection {

    
    lazy var sectionTitle: UILabel = {
        let label = UILabel()
        label.text = "난이도"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    /* Section Container */
    
    lazy var difficultyContainer: UIView = {
        let view = UIView()
        view.frame.size.height = 300
        view.backgroundColor = UIColor(named: "lightDark")
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emojiLabel)
        view.addSubview(calculateExpressionLabel)
        view.addSubview(diffitcultySideIndicator)
//        view.addSubview(slider)
        
        return view
    }()
    

    
    lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "🙂 보통"
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy var calculateExpressionLabel: UILabel = {
        let label = UILabel()
        label.text = "23 + 17 = ?"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    

    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.value = 9
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .white
        slider.isContinuous = false
        slider.translatesAutoresizingMaskIntoConstraints = false
//        slider.addTarget(self, action: #selector(onChangeValueSlider(sender:)), for: UIControl.Event.valueChanged)

        return slider
    }()
    
    lazy var diffitcultySideIndicator: UIStackView = {
        let leftLabel = UILabel()
        leftLabel.text = "🙂 매우쉬움"
        leftLabel.textColor = .white
        leftLabel.font = UIFont.systemFont(ofSize: 12)
        
        let rightLabel = UILabel()
        rightLabel.text = "😱 매우어려움"
        rightLabel.textColor = .white
        rightLabel.font = UIFont.systemFont(ofSize: 12)
    
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(rightLabel)
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    


    
}
