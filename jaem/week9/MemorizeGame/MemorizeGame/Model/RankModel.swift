//
//  RankModel.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/05/26.
//

import Foundation

struct RankModel{
    
    var rankList: [Rank] = [
        /*
        Rank(name: "Ximya", date: "2022.02.22", clearTime: "00:59"),
        Rank(name: "Jaem", date: "2022.02.10", clearTime: "01:32")*/
    ]
    
    mutating func deleteAll(){
        self.rankList = []
    }
    
    mutating func addRank(newRank: Rank){
        
        rankList.append(newRank)
        
        rankList = rankList.sorted(by: {Int($0.clearTime.replacingOccurrences(of: ":", with: ""))! < Int($1.clearTime.replacingOccurrences(of: ":", with: ""))!})
        
    }
    
    mutating func setRankList(newRankList: [Rank]){
        rankList = newRankList
    }
    
    struct Rank{
        var name: String
        var date: String
        var clearTime: String
    }
}
