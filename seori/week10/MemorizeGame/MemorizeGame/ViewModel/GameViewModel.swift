//
//  GameViewModel.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/24.
//

import Foundation

/// - GameVC 코드 위에서 게임을 끝내기 위해 만든 프로토콜.
/// - 즉, finishGame 함수의 구현을 GameVC에서 한다.
protocol GameSuccessProtocol {
    /// - gameVC에서 구현, gameVM에서 호출되는 함수.
    /// - 시간 측정을 종료하고, succeedVC를 띄워준다.
    func finishGame()
}

class GameViewModel {
    
    // MARK: - Properties
    
    /* Model */
    @Published private var gameModel = GameModel()
    // 새로운 타입을 정의.
    typealias Card = GameModel.Card
    
    // 프로토콜을 위한 delegate 변수 정의.
    var delegate: GameSuccessProtocol?
    
    // 선택된(클릭된) 셀(= 카드)들의 인덱스.
    public var selectedIndices = [Int]() {
        // 선택된 인덱스 리스트 값이 변화할 때마다 아래의 코드를 실행.
        didSet {
            // 인덱스 리스트의 크기.
            let count = selectedIndices.count
            // 리스트의 크기가 2이고, 해당 인덱스의 카드 데이터 2개의 값이 같을 때에만 실행.
            if count == 2, isSameData(gameModel.getCard(selectedIndices[0]).data,
                                      gameModel.getCard(selectedIndices[1]).data) {
                // 각 카드의 isRight 값을 true로 변경.
                for i in 0...1 {
                    gameModel.setRightCard(selectedIndices[i])
                }
                
                // 인덱스 리스트 초기화.
                selectedIndices.removeAll()
                print("Remove All") // test
                
                // 카드의 모든 쌍을 다 맞췄는지 확인 -> 즉, 성공 여부를 확인하는 것.
                if isSuccess() {
                    print("Success!")   // test
                    
                    // protocol을 사용하여 GameVC에서 구현된 finishGame 함수를 실행한다.
                    // finishGame => 게임을 마무리. (= 시간 측정 종료, Alert 띄우기 실행)
                    delegate?.finishGame()
                }
            }
        }
    }
    
    // MARK: - Public Functions
    
    /* 게임 카테고리 관련 함수 */
    /// - 게임 카테고리 갯수 반환.
    public func getCategoryCounts() -> Int {
        gameModel.getCategoryCounts()
    }
    /// - 해당 게임 카테고리의 이름 반환.
    public func getCategory(_ index: Int) -> String {
        gameModel.getCategory(index)
    }
    
    /* 게임 전 로드 함수 */
    /// - 해당 카테고리의 게임 데이터를 가져온다.
    public func loadingGameData(_ categoryIndex: Int) {
        gameModel.loadingGameData(categoryIndex)
    }
    
    /* 게임 중 쓰이는 함수 */
    /// - 특정 인덱스에 위치한 카드의 정보를 반환.
    public func getCard(_ cardIndex: Int) -> Card {
        gameModel.getCard(cardIndex)
    }
    
    /// - 카드가 선택됐을 때, 각 상황에 따라 다르게 처리해주는 함수.
    /// - View가 이 내용을 알 필요는 없는 것 같아서 ViewModel에 두었다.
    public func selectCard(_ index: Int) -> Int {
        // 이전에 이미 선택했던 셀일 때
        if selectedIndices.contains(index) {
            // 선택 해제 -> 카드를 뒷면으로 전환.
            removeSelectedIndices(index)
            return 1
            
        // 새로 선택한 셀일 때
        } else {
            // 선택된 셀이 2개보다 적을 때에만 실행
            if selectedIndices.count < 2 {
                // 선택! -> 카드를 앞면으로 전환.
                addSelectedIndices(index)
                return 2
            // 이미 선택된 셀이 2개 이상인 상황에서 새로 선택? -> 무시한다
            } else { return 3 }
        }
    }
    
    // MARK: - Private Functions
    /* 즉, GameViewModel 내에서만 쓰이고 밖에서는 몰라도 되는 함수들 */
    
    /// - 새로 선택된 인덱스를 배열에 추가.
    private func addSelectedIndices(_ index: Int) {
        selectedIndices.append(index)
        print("VM - addSelectedIndices", selectedIndices) // test
    }
    
    /// - 선택이 해제된 인덱스를 배열에서 제거.
    private func removeSelectedIndices(_ index: Int) {
        if let removedIndex = selectedIndices.firstIndex(of: index) {
            selectedIndices.remove(at: removedIndex)
            print("VM - removeSelectedIndices", selectedIndices) // test
        }
    }
    
    /// - 두 카드의 데이터(String)를 넣고 값이 같은지 비교.
    private func isSameData(_ firstCardData: String, _ secondCardData: String) -> Bool {
        firstCardData == secondCardData
    }
    
    /// - 게임이 끝났는지(= 모든 카드가 쌍을 찾았는지) 확인해주는 함수.
    private func isSuccess() -> Bool {
        for i in 0...11 {
            // 하나의 카드라도 쌍을 찾지 못했으면 아직 성공 전인 것. -> false를 리턴.
            if !gameModel.getCard(i).isRight {
                return false
            }
        }
        
        // 모든 카드의 isRight 값이 true면 게임 성공! -> true를 리턴.
        return true
    }
}
