//
//  Member.swift
//  TeamLandingPage
//
//  Created by 송재민 on 2022/04/12.
//

import UIKit

class Member
{
    var name = ""
    var memberImg: UIImage
    var color: UIColor
    
    init(name: String, memberImg: UIImage, color: UIColor)
    {
        self.name = name
        self.memberImg = memberImg
        self.color = color
    }
    
    static func fetchMember() -> [Member]
    {
        return[
            Member(name: "임주", memberImg: UIImage(named: "emjoo")!, color: UIColor(named: "member_bg_color")!),
            Member(name: "애플", memberImg: UIImage(named: "apple")!, color: UIColor(named: "member_bg_color")!),
            Member(name: "잼", memberImg: UIImage(named: "jaem")!, color: UIColor(named: "member_bg_color")!),
            Member(name: "서리", memberImg: UIImage(named: "seori")!, color: UIColor(named: "member_bg_color")!)
        ]
    }
}
