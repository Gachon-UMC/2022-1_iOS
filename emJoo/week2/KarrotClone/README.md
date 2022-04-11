## Set Button Action Inside Custom Cell

1. 어떤 이슈가 있었는지
- TableView Cell의 하트 Icon Button을 클릭했을 때 usedItems의 `isLiked` 값을 기준으로 값이 토글되고 하트가 채워지는 인터렉션 구현하려고 했지만 실패
    - CustomCell 에서 ViewController (TableView Method)로 값을 어떻게 연동할지 모르겠음
2. 이 이슈를 해결하려고 어떤 시도를 했었는지
    - Delegate 패턴을 이용해서 값을 넘겨주려고 했지만 반응이 없거나 Optional 에러가 발생
    
3. 이슈를 해결하지 못하고 어떤 방법으로 우회했는지 
    -  그냥 TableCell을 클릭하면 필요한 인터렉션과 값이 변경되도록 함
