//
//  AppBarViews.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import UIKit

class AppbarViews {
    
    /* left Bar Custom Button */
    let locationBarButton: UIBarButtonItem = {
        /* Location Label */
        let locationLabel = UILabel()
        locationLabel.text = "역삼동"
        locationLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        /* Location Icon Button */
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.image = UIImage(systemName: "arrowtriangle.down.circle")
        buttonConfig.baseForegroundColor = .black
        buttonConfig.buttonSize = .small
        let locationBtn = UIButton(configuration: buttonConfig, primaryAction: nil)
        
        let stackView = UIStackView(arrangedSubviews: [locationLabel, locationBtn])
        let barButton = UIBarButtonItem(customView: stackView)
        return barButton
    }()
    
    /* Right Bar Custom Button */
    let rightGroupBarButtons: UIBarButtonItem = {
        var searchConfig = UIButton.Configuration.plain()
        var heartConfig = UIButton.Configuration.plain()
        var bellConfig = UIButton.Configuration.plain()
        
        searchConfig.image = UIImage(systemName: "magnifyingglass")
        heartConfig.image = UIImage(systemName: "heart")
        bellConfig.image = UIImage(systemName: "bell")
        
        searchConfig.baseForegroundColor = .black
        heartConfig.baseForegroundColor = .black
        bellConfig.baseForegroundColor = .black
        
        searchConfig.buttonSize = .small
        searchConfig.buttonSize = .small
        bellConfig.buttonSize = .small
      
        let serachIconBtn = UIButton(configuration: searchConfig, primaryAction: nil)
        let heartIconBtn = UIButton(configuration: heartConfig, primaryAction: nil)
        let bellIconBtn = UIButton(configuration: bellConfig, primaryAction: nil)
        

        let stackView = UIStackView(arrangedSubviews: [serachIconBtn, heartIconBtn, bellIconBtn])
        
        let barButton = UIBarButtonItem(customView: stackView)
        return barButton
    }()
    
}
