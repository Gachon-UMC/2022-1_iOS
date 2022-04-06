//
//  ViewController.swift
//  CalculateGame
//
//  Created by 조동진 on 2022/04/06.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var subView1: UIView!
  @IBOutlet weak var levelLabel: UILabel!
  @IBOutlet weak var exampleLabel: UILabel!
  @IBOutlet weak var levelSlider: UISlider!
  
  @IBOutlet weak var pickerView: UIPickerView!
  
  @IBOutlet weak var subVuew2: UIView!
  @IBOutlet weak var numOfClearLabel: UILabel!
  
  let list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
  
  var numOfClear = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // radius config
    self.subView1.layer.cornerRadius = 10
    self.subVuew2.layer.cornerRadius = 10
    pickerView.layer.cornerRadius = 10
    
    // barButtonItem config
    self.configBarButtonItem()
    
    // slider config
    levelSlider.minimumValue = 0
    levelSlider.maximumValue = 4
    
    // pickerView config
    pickerView.delegate = self
    pickerView.dataSource = self
    pickerView.tintColor = .white
    
    // notification center config
    NotificationCenter.default.addObserver(self, selector: #selector(receiveNumOfClear(_:)), name: Notification.Name("numOfClear"), object: nil)
    
    // get numOfClear from userdefaults
    let userDefaults = UserDefaults.standard
    if userDefaults.object(forKey: "numOfClear") != nil {
      self.numOfClear = userDefaults.object(forKey: "numOfClear") as! Int
      self.numOfClearLabel.text = String(numOfClear)
    } else {
      self.numOfClearLabel.text = "0"
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // slider config (default value)
    levelSlider.value = 2
  }
  
  @objc
  func receiveNumOfClear(_ notification: Notification) {
    self.numOfClear = notification.object as! Int
    
    self.numOfClearLabel.text = String(numOfClear)
    
    let userDefaults = UserDefaults.standard
    userDefaults.set(numOfClear, forKey: "numOfClear")
  }


  func configBarButtonItem() {
    let button = UIButton()
    button.setTitle("시작", for: .normal)
    button.tintColor = .white
    button.addTarget(self, action: #selector(startButtonTapped(_:)), for: .touchUpInside)

    let stackView = UIStackView(arrangedSubviews: [button])
    stackView.backgroundColor = .systemGray
    stackView.layer.cornerRadius = 13

    let barButtonItem = UIBarButtonItem(customView: stackView)
    navigationItem.rightBarButtonItem = barButtonItem
  }
  
  @objc
  func startButtonTapped(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
    
    secondViewController.level = levelSlider.value
    secondViewController.numOfQuestion = pickerView.selectedRow(inComponent: 0) + 1
    secondViewController.numOfclear = self.numOfClear
    self.navigationController?.pushViewController(secondViewController, animated: true)
  }
  
  @IBAction func sliderValueChanged(_ sender: UISlider) {
    let step: Float = 1
    let roundedValue = round(sender.value/step) * step
    sender.value = roundedValue
  }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return list.count
  }
  
  func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    return NSAttributedString(string: list[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  }
  
}
