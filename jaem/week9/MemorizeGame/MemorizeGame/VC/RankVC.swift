//
//  RankVC.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/05/26.
//

import UIKit

class RankVC: UIViewController{
    var rankVM = RankVM()
    typealias Rank = RankVM.Rank
    
    var rankList = [Rank].self

    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    @IBOutlet weak public var rankTableView: UITableView!
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        rankVM.deleteRank()
        self.rankTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*테이블 ui 구성*/
        self.rankTableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.rankTableView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        self.rankTableView.tableHeaderView = UIView()
        self.rankTableView.dataSource = self
        self.rankTableView.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //rankList = UserDefaults.standard.value(forKey: "ranks") as! [Rank]
        
        //rankVM.setRankList(newRankList: rankList)
        
        self.rankTableView.reloadData()
        //print(UserDefaults.standard.value(forKey: "ranks"))
    }
}

extension RankVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankVM.getRankList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankTableViewCell", for: indexPath) as! RankTableViewCell
        
        cell.selectionStyle = .none
        
        cell.rankNumLabel.text = String(indexPath.row + 1)
        cell.rankNameLabel.text = rankVM.getRankList()[indexPath.row].name + " / " + rankVM.getRankList()[indexPath.row].date + " / " + rankVM.getRankList()[indexPath.row].clearTime
        
        return cell
    }
}
