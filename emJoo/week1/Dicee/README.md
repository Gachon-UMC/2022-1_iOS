## 목차
- [개발 동기](#개발-동기)
- [요약](#요약)
- [학습 키워드](#학습-키워드)


## 개발 동기
간단한 주사위 게임  
<a href ="https://github.com/appbrewery/Dicee-iOS13"> App Brewery Dicee 튜토리얼 프로젝트</a>에서 몇 가지 기능 추가된 버전

자세한 내요은
<a href ="https://confirmed-baritone-e12.notion.site/Dicee-Project-5f2b8d49329a4298b81500adbc97b1a7"> 프로젝트 개요</a> 문서 참고


## 요약

| Index          | Detail                       |
|----------------|------------------------------|
| 구현 영상          | https://www.youtube.com/watch?v=zFuCvtxuFpA |
| 구현 기간          | **2022.03.20(하루)**           |
| 기술 스택          | - Swift UI                   |


### 구현 기능
- `Roll` 버튼이 클릭 했을 때
    - 두 개의 주사위가 무작위로 변경됨
        - 각각 의 주사위는 독립적으로 바뀌어야 함
    - Start Game 텍스트는 2 ~ 12 사이의 랜덤한 숫자로 변경됨.
        - ex )Start Game → 8
        - Start Game 텍스트는 초기화면이나 게임이 리셋 될 때만 숫자로 변경됨. (게임 진행 중에는 변경 X)


- 두 주사위의 합과 호출된 랜덤 숫자가 동일하면 게임에 성공하고 즉시  `Alert Dialog` 창이 나타남
    - `Alert Dialog` 창의 `Confirm` 버튼을 누르면 게임이 리셋되고 초기 화면으로 돌아감.


- 주사위를 클릭 했을 때
    - 주사위 이미지 랜덤  변경
    - 랜던 숫자와 두 주사위 합 일치 여부 확인


## 학습 키워드
- Interface without StoryBoard
    - Anchor & Frame
    - NsLayout

- lazy
- static
    - Advantage of using static, instead of let
- Uisubview
    - rendering Condition

- UIImage
    - Configuration (new!? ios14)
/