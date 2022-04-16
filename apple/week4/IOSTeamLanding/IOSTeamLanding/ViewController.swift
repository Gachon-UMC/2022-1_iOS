//
//  ViewController.swift
//  IOSTeamLanding
//
//  Created by 조동진 on 2022/04/11.
// issues: collection view

import UIKit

class ViewController: UIViewController {
  var hits: Int = 1
  var person = Person.fetchPerson()

  @IBOutlet weak var hitsLabel: UILabel!
  @IBOutlet weak var textView1: UITextView!
  @IBOutlet weak var textView2: UITextView!
  @IBOutlet weak var textView3: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // hit Label & userDefaults config
    hitsLabelConfig()
    
    // navigationBar config
    customBarButtonItem()
    
    // custom textField
    customTextField()
  }
  
  func hitsLabelConfig() {
    self.hitsLabel.clipsToBounds = true
    self.hitsLabel.layer.cornerRadius = 5
    
    let userDefaults = UserDefaults.standard
    if userDefaults.object(forKey: "hits") != nil {
      self.hits = userDefaults.object(forKey: "hits") as! Int
      self.hits += 1
      userDefaults.set(hits, forKey: "hits")
      self.hitsLabel.text = " hits: " + String(hits) + " "
    } else {
      userDefaults.set(hits, forKey: "hits")
      self.hitsLabel.text = " hits: " + String(hits) + " "
    }
  }
  
  func customBarButtonItem() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.view.backgroundColor = .clear
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "UMC")
    let barButtonItem = UIBarButtonItem(customView: imageView)
    
    self.navigationItem.leftBarButtonItem = barButtonItem
  }
  
  func customTextField() {
    
    let attributedStr1 = NSMutableAttributedString(string: textView1.text ?? "")
    let attributedStr2 = NSMutableAttributedString(string: textView2.text ?? "")
    let attributedStr3 = NSMutableAttributedString(string: textView3.text ?? "")
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 7
    let fontSize = UIFont.systemFont(ofSize: 15)
    
    attributedStr1.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: textView1.text.count))
    attributedStr2.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: textView2.text.count))
    attributedStr3.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: textView3.text.count))
    
    attributedStr1.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange.init(location: 0, length: 14))
    attributedStr1.addAttribute(.foregroundColor, value: UIColor.systemGray3, range: NSRange.init(location: 15, length: 188))
    
    attributedStr2.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange.init(location: 70, length: 6))
    attributedStr2.addAttribute(.foregroundColor, value: UIColor.systemGray3, range: NSRange.init(location: 0, length: 69))
    attributedStr2.addAttribute(.foregroundColor, value: UIColor.systemGray3, range: NSRange.init(location: 76, length: textView2.text.count - 71))
    
    attributedStr3.addAttribute(.foregroundColor, value: UIColor.systemGray3, range: NSRange.init(location: 0, length: 33))
    attributedStr3.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange.init(location: 34, length: 25))
    attributedStr3.addAttribute(.foregroundColor, value: UIColor.systemGray3, range: NSRange.init(location: 59, length: textView3.text.count - 57))
    
    attributedStr1.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange.init(location: 0, length: 188))
    
    textView1.attributedText = attributedStr1
    textView2.attributedText = attributedStr2
    textView3.attributedText = attributedStr3
  }
}
