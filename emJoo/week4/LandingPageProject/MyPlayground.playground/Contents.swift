import UIKit

struct ExpensiveTask {
    // Loop을 이용해 연산이 많이 필요한 무거운 Function 재현
    static func loadProfileImageHistory() -> Int {
        var images: [Int] = []
        for i in 1...4000 { images.append(i) }
        return images.last!
    }
}

struct UserProfile {
    var name: String
    var birhY: Int
    var showProfileHistoryImage = ExpensiveTask.loadProfileImageHistory()
    lazy var showProfileInfo = {
        return "프로필 닉네임은 \(name)이고 \(String(birhY))에 태어났습니다"
    }()
}

var porfile1 = UserProfile(name: "제스퍼", birhY: 1994)
print(porfile1.showProfileInfo)
 
