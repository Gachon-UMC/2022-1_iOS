//
//  NewsItemCell.swift
//  NewsApp
//
//  Created by 이해주 on 2022/05/03.
//

import UIKit

class NewsItemCell: UITableViewCell {
        
    static let cellID = "newsCell"
    
    lazy var labelStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(sizedBox)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
       return stackView
    }()
    
    lazy var sizedBox: UIView = {
       let view = UIView()
       
       return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "News Your Jets- Atala Falcons, Minmain Dol News Your Jets- Atala Falcons, Minmain Dol"
        label.numberOfLines = 1
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
            
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "News Your Jets- Atala Falcons, Minmain Dol News Your Jets- Atala Falcons, Minmain Dol same as yo so what is going one"
        label.numberOfLines = 3
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    lazy var thumbnailImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "thumbnail"))
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(onImageDoubleTap))
//        doubleTap.numberOfTouchesRequired = 1
//        doubleTap.numberOfTapsRequired = 2
        image.addGestureRecognizer(doubleTap)
    
        return image
    }()
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        manageSubviews()
        manageLayout()
    }
    
    func manageSubviews() {
        contentView.addSubview(thumbnailImage)
        contentView.addSubview(labelStackView)

    }
    
    /* MARK: INTENT */
    @objc func onImageDoubleTap() {
        print("Image Tapped")
    }
    
    
    
    func manageLayout() {
        /* Label StackView */
        labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        labelStackView.rightAnchor.constraint(equalTo: thumbnailImage.leftAnchor, constant: -20).isActive = true
        labelStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        
        /* Thumbnail */
        thumbnailImage.heightAnchor.constraint(equalToConstant: contentView.frame.height - 60).isActive = true
        thumbnailImage.widthAnchor.constraint(equalToConstant: contentView.frame.height - 60).isActive = true
        thumbnailImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        thumbnailImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
      
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been impl")
     }
    

}
