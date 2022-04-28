//
//  SecondViewController.swift
//  Protocol
//
//  Created by 송재민 on 2022/04/09.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    func dochange() {
        previousVC?.label.text = self.textField.text
    }

    var previousVC : ViewController?
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dochange()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousVC?.delegate = self
    }
    

}
