//
//  TeamMember.swift
//  iOSTeamLandingPage
//
//  Created by 서은수 on 2022/04/13.
//

import Foundation

struct TeamMembers {

    let imagePath: String
    let nickName: String
    
    // 팀 멤버들의 정보를 배열로 가져온다.
    static func getMembersInfo() -> [TeamMembers] {
        return [
            TeamMembers(imagePath: "memoji_1", nickName: "임주"),
            TeamMembers(imagePath: "memoji_1", nickName: "애플"),
            TeamMembers(imagePath: "memoji_2", nickName: "잼"),
            TeamMembers(imagePath: "memoji_3", nickName: "서리")
        ]
    }
}

