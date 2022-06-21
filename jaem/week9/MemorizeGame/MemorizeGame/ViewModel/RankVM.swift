//
//  RankVM.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/05/26.
//

import UIKit

class RankVM: ObservableObject{
    @Published public var model = RankModel()
    typealias Rank = RankModel.Rank
    
    func getRankList() -> [Rank]{
        return model.rankList
    }
    
    func deleteRank(){
        model.deleteAll()
    }
    
    func addRank(newRank: Rank){
        model.addRank(newRank: newRank)
    }
    
    func setRankList(newRankList: [Rank]){
        model.setRankList(newRankList: newRankList)
    }
}
