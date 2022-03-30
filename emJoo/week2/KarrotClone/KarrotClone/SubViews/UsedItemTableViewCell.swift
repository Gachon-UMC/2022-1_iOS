//
//  UsedItemTableViewCell.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//



import UIKit

class UsedItemTableViewCell: UITableViewCell {

  
    static let cellId = "usedItemCell"

    /* Cell Subvies */
    let thumnail: UIImageView = {
        let img = UIImageView(image: UIImage(named: "image1"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 8
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        
        return img
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "서초4동 · 끌올 1분 전"
        label.numberOfLines = 1
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.tintColor = .systemGray6
        
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "30000원"
        label.numberOfLines = 1
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "맥북프로 싸게 팝니다 맥북프로 싸게 팝니다 맥북프로 싸게 팝니다"
        label.numberOfLines = 2
        label.font = label.font.withSize(17)
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    

   
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.semanticContentAttribute = .forceRightToLeft

        return stackView
    }()
    
    
    let heartIcon: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "heart")
        let btn = UIButton(configuration: config, primaryAction: nil)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(clickHeart) , for: .touchUpInside)
        
        return btn
    }()
    
    /* Filled Align Sized Box */
    let sizedBox: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(thumnail)
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(heartIcon)

        setStackView()
        

    }
    
    
    @objc func clickHeart() {
        heartIcon.configuration?.image = UIImage(systemName: "heart.fill")
    }
    
    
    
    func setStackView() {
        
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(sizedBox)
        
        stackView.leftAnchor.constraint(equalTo: thumnail.rightAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: thumnail.bottomAnchor, constant: -16).isActive = true
        
        /* StackView's subviews */
        thumnail.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        thumnail.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        thumnail.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        thumnail.widthAnchor.constraint(equalToConstant: contentView.frame.height - 32).isActive = true
        heartIcon.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 0).isActive = true
        heartIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16 ).isActive = true
  
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
