//
//  ViewController.swift
//  Protocol
//
//  Created by 송재민 on 2022/04/09.
//

import UIKit

protocol ChangeLabelDelegate{
    func dochange()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else{
            return
        }
        nextVC.previousVC = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate : ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

