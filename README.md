# 가천대 UMC에 오신 여러분을 환영해요!

가천대 UMC의 새로운 멤버가 되신 여러분을 환영합니다.

여러분이 보고 계시는 이 곳은 앞으로 여러분이 스터디를 진행하면서, 과제를 올리게 될 공간이에요!

우선, 각자 폴더를 만들고 그 안에 txt 파일을 올려보도록 할까요?

## 나만의 폴더 만들기
- 혹시 아직 Git을 설치하지 않으셨나요? 아래 링크에서 자신의 운영체제에 맞게 Git을 설치해주세요!
    * https://git-scm.com/book/ko/v2/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EC%84%A4%EC%B9%98

1. 먼저 이 공간을 여러분의 컴퓨터로 가져와봅시다! 아래 명령어를 명령창에 입력하면 된답니다.
    - 윈도우라면 이 공간을 저장해 둘 폴더로 이동해서, 폴더 경로 입력창에 `cmd`라고 입력해주세요!
    - 리눅스 / 맥이라면 터미널을 열어서 저장해둘 폴더로 이동해주세요!
    <img width="800" alt="clone_example" src="https://user-images.githubusercontent.com/3215313/158018075-c1acc0a4-1abe-4eda-8612-058c92c869da.png">

    - 이동하셨다면 아래 명령어를 따라 입력해보세요!
        * 이따가 또 다른 명령어를 입력해야 하니, 명령 프롬포트 (터미널)을 아예 닫지는 말아주세요!
    ```
    git clone https://github.com/Gachon-UMC/[운영진이 레포 주소 넣기]
    ```
    <img width="800" alt="clone_example" src="https://user-images.githubusercontent.com/3215313/158018063-d3115ca0-aeda-4198-aba5-bb5d55206271.png">


2. 위의 과정에서 에러가 발생하지 않았다면, 새로운 폴더가 생겼을거에요! 들어가볼까요?
    - 이미 다른 스터디원이 폴더를 만들지 않았다면, README.md (이 파일)만이 존재할거에요!
    - 다른 폴더가 있다면, 다른 스터디원이 이 과정을 끝마친 경우이니 건들지 말아주세요!

3. 이제 평소에 폴더를 생성했던 것처럼, 영어로 나의 폴더를 만들어봅시다.
    - 폴더 이름은 나인 것을 확인할 수 있는 이름으로 해주세요! (예: 에릭이라면 eric, 유캔이라면 ucan...)
    - 앞으로 여러분의 과제는 지금 만든 그 폴더 내에 올리게 될 거에요!
        <img width="800" alt="new_folder" src="https://user-images.githubusercontent.com/3215313/158018112-9ee6da74-1c28-4455-af81-8d09115e38aa.png">


4. 폴더 안에 week0이라는 폴더를 또 만들고, txt 파일을 만들어봅시다.
    <img width="800" alt="new_folder2" src="https://user-images.githubusercontent.com/3215313/158018133-f9c9d2cc-590e-40a9-bd46-9d88bea4e84d.png">
    - txt 이름은 폴더와 동일하게 만들어봅시다!
    <img width="800" alt="new_file" src="https://user-images.githubusercontent.com/3215313/158018153-05d5f327-bc02-41bf-9d86-25b7a65d8a9d.png">
    - txt 파일 안에는 간단하게 자기소개를 작성해주세요! (이상한 말은 안돼요!)

5. 이제 GitHub에 새로 만든 폴더와, txt 파일을 올려볼까요?
    - 명령창에 아래 명령어들을 순서대로 입력해봅시다!  
        * 아까 열었던 명령창을 닫았다면, 1번 과정에 있는 명령창 여는 방법을 다시 한 번 따라해주세요! (git clone 명령어는 다시 치지 않아도 됩니다!)

    ```
        cd [운영진이 레포 이름 넣기]
        git add .
        git commit -m "My First Update"
        git push origin main
    ```

    <img width="800" alt="push" src="https://user-images.githubusercontent.com/3215313/158018236-bf961762-0ab4-4bd2-bdc3-7939da731aa7.png">


6. 지금 보고 있는 창을 새로고침하면, 여러분의 폴더와 아까 만들었던 txt 파일을 Github에서 볼 수 있을거에요!
    - 혹시라도 무언가 잘 안된다면, 같은 스터디원이나 혹은 운영진분들께 도움을 요청해보세요!

    <img width="800" alt="push_result1" src="https://user-images.githubusercontent.com/3215313/158018257-10c33b31-c031-4e09-ac85-85cf8523211b.png">

    <img width="800" alt="push_result2" src="https://user-images.githubusercontent.com/3215313/158018274-2fb8fb92-9014-4691-9b72-e07ed19833f4.png">

- 위의 과정을 잘 마치셨다면, 아래 나만의 Branch 만들기를 수행하셔서 GitHub에서 여러분만의 

## 나만의 Branch 만들기
1. 위에서 나만의 폴더를 만드셨나요? 그렇다면 이제 폴더를 넘어, 실제 협업에서 사용하는 Branch라는 공간을 만들어 봅시다!
    - [운영진이 레포 이름 넣기] 폴더로 이동해서, 명령창을 열어봅시다!
        * 윈도우라면 폴더로 들어가서, 폴더 경로 입력창에 `cmd`라고 입력해주세요!
        * 리눅스 / 맥이라면 터미널을 열어서 저장해둘 폴더로 이동해주세요!
    -  이동하셨다면 아래 명령어를 따라 입력해보세요!
        * 입력 다 하시고 명령창을 아예 닫지는 말아주세요!
        * '닉네임' 부분에는 자신의 닉네임을 영어로 적어주세요!
            - 예 : `git branch eric`


    ```
        git branch 닉네임
    ```

    <img width="800" alt="newbranch" src="https://user-images.githubusercontent.com/3215313/158018288-788a5444-ab60-4920-bd61-1e397abd9bee.png">

2. 위의 명령어를 잘 따라 입력하셨다면 나만의 Branch를 만들었어요!
    - Branch는 GitHub에서 위에서 만들었던 폴더와 유사한 개념이라고 생각하면 된답니다.
        * 혹시라도 Branch가 더 자세하게 궁금하다면? - https://git-scm.com/book/ko/v2/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-%EB%B8%8C%EB%9E%9C%EC%B9%98%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80

3. 이제 나만의 Branch로 전환해보도록 합시다!
    - '닉네임 부분에는 아까 1번에서 적었던 닉네임과 동일하게 입력해주세요!
        * 예 : `git switch eric`


    ```
        git switch 닉네임
    ```

    <img width="800" alt="switchbranch" src="https://user-images.githubusercontent.com/3215313/158018313-fe7afd88-73d8-47b8-b55c-7e66819b498a.png">

4. 아까 만들었던 txt 파일의 내용을 수정해봅시다!
    - txt 파일에 꼭 다른 글자를 입력해주세요!

5. 수정을 다 했다면, 명령창에서 아래의 명령어를 입력해봅시다.
    - '닉네임' 부분에는 아까 1번에서 적었던 닉네임과 동일하게 입력해주세요!
        * 예 : `git push origin eric`

    ```
        git add .
        git commit -m "My First Branch Update"
        git push origin 닉네임
    ```

    <img width="800" alt="pushbranch" src="https://user-images.githubusercontent.com/3215313/158018407-7f84da6b-884a-4382-9f9c-f456e593c186.png">



6. 이 페이지를 또 새로고침하고, 상단에 `main` 부분을 눌러볼까요?
    <img width="800" alt="branch_click" src="https://user-images.githubusercontent.com/3215313/157893036-956edc37-04cd-4d3e-b774-223f9e55bedb.png">

    <img width="800" alt="branch_click2" src="https://user-images.githubusercontent.com/3215313/158018432-8f738871-7b3e-445e-a688-2e26c756ecd9.png">

7. 누르면 아까 위에서 만들었던 닉네임과 같은 이름이 생겼을꺼에요! 닉네임을 눌러 볼 Branch를 전환해봅시다!

8. 전환되었다면, 아까 수정했던 txt 파일을 찾아 이동해보고, 열어봅시다!
    - 아까와 다르게 txt 파일이 수정되었을거에요!
    - 만약 수정되지 않았다면, 중간에 무언가 잘못되었을 수 있으니 

## 내 Branch의 변경사항을 main Branch에 적용하기
1. 위의 과정을 잘 따라하셨다면, 새로 만든 Branch에만 변경 사항이 반영되고 main Branch에는 적용되지 않았을거에요! 이제 main Branch로 변경사항을 적용해봅시다!
    - 만약 위의 과정을 따라했는데 main 브랜치에 적용되었다면, 나만의 Branch를 만드는데 실패한 것이니 다시 한 번 해봅시다!

2. 이번에는 명령창이 아닌, 지금 보고 있는 GitHub 홈페이지 상단에서 **Pull requests**를 눌러봅시다!
    <img width="800" alt="pr_btn" src="https://user-images.githubusercontent.com/3215313/158005710-b5a054f9-cafe-4adb-8dc7-7a4976e30e28.png">

    - Pull Request는 말 그대로 어떤 Branch의 내용을 다른 Branch로 합치는 작업 (Pull)을 요청하는 방법이에요!
    - 개발 협업에서 필수적으로 사용한답니다!


3. 이제, Pull Request를 작성하기 위해 오른쪽에 있는 **New pull request**를 눌러봅시다!
    <img width="800" alt="newpr_btn" src="https://user-images.githubusercontent.com/3215313/158005797-3e7887b5-7c0f-45e1-9530-13898052edc4.png">

4. **compare** 부분 (파란 박스)를 누르고, 나오는 창에서 **나의 Branch (빨간 박스)를 선택**해주세요!
    <img width="800" alt="selectbrranch" src="https://user-images.githubusercontent.com/3215313/158018489-a38146cf-7d31-42da-9a98-55158f93183c.png">


5. 아래 **파란 박스**에서 변경 내용을 확인하고, 맞다면 **Create pull request**를 눌러서 본격적으로 Pull Request 글을 작성해봅시다!
    <img width="800" alt="createpr" src="https://user-images.githubusercontent.com/3215313/158018624-cdbd0852-b3a9-434b-a449-e2f3df3ff033.png">

6. **파란 박스** 부분에는 글 제목을, **초록 박스** 부분에는 자세한 내용을 작성하고 **빨간 박스**의 Create pull request를 눌러주세요!
    <img width="800" alt="write_pr" src="https://user-images.githubusercontent.com/3215313/158018688-57f9f2c0-2155-4c2d-84b5-0f50709fa63c.png">

7. 다음과 같이 **작성한 제목, 글이 잘 보이면** 성공입니다!
    
    이때, 아래의 Merge pull request를 누르면 main에 합쳐지지만 본인의 Pull Request에는 이 버튼을 누르는 것을 지양해주세요!
    <img width="800" alt="show_pr" src="https://user-images.githubusercontent.com/3215313/158018762-9bf48393-ad5f-460a-932f-c22f53b8e5a1.png">

8. 혹시라도 첫 번째 사진에서처럼 나 이외에 다른 스터디원의 Pull Request가 있다면, **파란 박스**에 의견을 남기고 Comment를 누른 다음, Merge pull request를 통해 다른 동아리원의 내용을 main Branch로 보내주세요!
    <img width="800" alt="write_pr_comment" src="https://user-images.githubusercontent.com/3215313/158018849-e24b0010-d46a-435d-8008-9ed4a594a476.png">

    <img width="800" alt="write_pr_comment" src="https://user-images.githubusercontent.com/3215313/158018880-0095e345-dcac-466c-b73e-d6114c7c804b.png">

## 여기까지 잘 따라오셨나요?
여러분은 이제 GitHub를 통해 협업을 하는 기초적인 방법을 실습해보았어요!

혹시라도 어려운 점이 있다면 같은 스터디원 또는 운영진에게 도움을 요청해보세요! :)

앞으로 UMC에서 즐거운 시간 되셨으면 좋겠습니다! 화이팅😃
