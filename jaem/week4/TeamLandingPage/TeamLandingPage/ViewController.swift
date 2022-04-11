//
//  ViewController.swift
//  TeamLandingPage
//
//  Created by 송재민 on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var introductionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.changeTextColor()
    }

    func changeTextColor(){
        guard let text = self.introductionLabel.text else{return}
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: "newGreen") as Any, range: (text as NSString).range(of: "UMC GACHON iOS"))
        self.introductionLabel.attributedText = attributeString
    }
}

