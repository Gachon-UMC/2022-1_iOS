/* Main View Controller에서 사용되는 SubViews */
import Foundation
import UIKit


class SubView {
    
    lazy var logo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "DiceeLogo")

        return img
    }()
    
    lazy var mainLabel: UILabel = {
       let label = UILabel()
        label.text = "Start Game"
        label.textColor = .white
        label.font = label.font.withSize(42)
        
        
        return label
    }()
    
    
    lazy var dice1: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "DiceOne")
        
        let btn = UIButton(configuration: config, primaryAction: nil)
        btn.tag = 1
        
        return btn
    }()
    
    lazy var dice2: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "DiceOne")
        
        let btn = UIButton(configuration: config, primaryAction: nil)
        btn.tag = 2
        
        return btn
    }()
    
    
    
    lazy var rollButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .red
        config.buttonSize = .large
        config.title = "Roll"
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 28, bottom: 10, trailing: 28)

        
        let btn = UIButton(configuration: config, primaryAction: nil)
        
        return btn
    }()
    
}
