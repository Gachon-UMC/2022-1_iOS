import Foundation


struct UsedItemModel {

    var usedItems: [UsedItem] = [
        // MARK: title, subdecription, price, imagePath를 각각 다르게 설정해주세요!!
        UsedItem(id: 0, title: "맥북 프로 2016년형 512GB 싸게 올립니다 찔러보기 금지 네고 금지 살사람만 연락해주세요", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image1"),
        UsedItem(id: 1, title: "빈티지 티셔츠 팝니다", subDescription: "서초4동 · 끌올 1분 전", price: 70000, imagePath: "image2"),
        UsedItem(id: 2, title: "강아지 옷", subDescription: "서초4동 · 끌올 1분 전", price: 8000, imagePath: "image3"),
        UsedItem(id: 3, title: "포켓몬빵 스티커", subDescription: "서초4동 · 끌올 1분 전", price: 20000, imagePath: "image4"),
        UsedItem(id: 4, title: "015B 엘피", subDescription: "서초4동 · 끌올 1분 전", price: 200000, imagePath: "image5"),
        UsedItem(id: 5, title: "멋진 썬글라스 팝니다", subDescription: "서초4동 · 끌올 1분 전", price: 20000, imagePath: "image6"),
        UsedItem(id: 6, title: "데임 통기타", subDescription: "서초4동 · 끌올 1분 전", price: 100000, imagePath: "image7"),
        UsedItem(id: 7, title: "게이밍 마우스", subDescription: "서초4동 · 끌올 1분 전", price: 10000, imagePath: "image8"),
        UsedItem(id: 8, title: "모니터", subDescription: "서초4동 · 끌올 1분 전", price: 80000, imagePath: "image9")
    
    
    ]


    struct UsedItem : Identifiable {
        let id: Int
        let title: String
        let subDescription: String
        let price: Int
        let imagePath: String
        var isLiked: Bool = false
    }

    
   
}
