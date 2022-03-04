# HBank <br>
http://172.21.200.26:8081/bank/home </br>
서버 열려있을 때만 들어오실 수 있슴니다 ^^*


### 개발 환경
- JavaSE 1.6
- Oracle DBMS (ojdbc6.jar)
- Spring MVC project
- Tomcat 9.0


### 금융결제원 API <br>
금융결제원 개발자사이트에서 제공하는 오픈API</br>
그 중 내가 사용한 API들 
- 사용자인증
- 토큰발급
- 등록계좌조회
- 계좌정보변경
- 계좌해지
- 잔액조회
- 거래내역조회
- 출금이체
- 수취인조회
- 입금이체


### 개발 배경 <br>
입사 후 개인 미니 프로젝트를 해보자! 해서 spring framework를 사용할만한 주제를 찾아보다가 <br>
회사 흐름에 맞게 개인뱅킹 사이트를 개발해보고 싶다는 생각을 했음 <br>
단순히 DB에 계좌 만들고,, 이체 요청 시 DB만 수정하는 식으로 하려던 초기 계획과는 달리 <br>
다양한 은행에서 사용하는 금융결제원 API를 본격적으로 사용하게 되는데 ... (더보기) <br>
개발기간 : 2022-01-24 ~ 2022-02-18 <br>


### 화면

- 참고사항 <br>
사용자인증 및 계좌 등록을 거쳐 토큰을 발급받아야함 <br>
토큰이 발급되면 개인정보 입력 후에 회원가입 > DB에 유저정보 저장 <br>
모든 API 사용에는 토큰이 필수이기 때문에 세션에 같이 설정해줌

<hr>

- Main
![image](https://user-images.githubusercontent.com/90125028/154598590-aab9342d-e554-4f84-9f8e-6381c226b233.png)

<hr>

- Account <br>
: 사용자가 가진 계좌 리스트를 볼 수 있음
잔액조회, 계좌변경, 계좌해지
![image](https://user-images.githubusercontent.com/90125028/154598776-745a972c-039d-44e2-95b6-f25ed7100111.png)

<hr>

- Transfer  <br>
: 출금이체, 수취인조회, 입금이체 <br>
![image](https://user-images.githubusercontent.com/90125028/154622598-ca89134e-9287-4c37-930d-812c99f61245.png)

영상 > https://user-images.githubusercontent.com/90125028/154620899-702ceac9-fe0b-4189-962a-5238bea267f6.mp4
 
 **제일 어렵고 신경 많이 씀..**
<hr>

- Transaction
![image](https://user-images.githubusercontent.com/90125028/154621271-973b6fbb-b75d-4b18-8fdc-c5d38294d71f.png)

<hr>

- Product
![image](https://user-images.githubusercontent.com/90125028/156714208-28056713-6702-4431-9f05-c4a775309434.png)

- Product/Status
![image](https://user-images.githubusercontent.com/90125028/156714776-2887e69f-2e70-4728-aaa5-db992a6af541.png)




이 외에도 한 땀 한 땀 신경쓴 기능, 디테일들이 많으나 여기에선 생략..

<hr>

### P.S <br>
처음 API를 시도해볼때는 정말 막막했다. 특히나 금융결제원 개발자사이트에서 정보를 친절하게 제공하고 있지 않았다. <br>
자료실에 있는 API 명세서를 꼭 꼼꼼히 살펴보는 것이 좋다.<br>
꽤 아쉬웠던 점은.. 각 API들의 DB가 연동되지 않는다는 것이다. 개발자들을 위해 오픈해놓은 것이다 보니..<br>
개발자사이트의 테스트정보관리 > 응답정보 에서 세팅해놓은대로만 응답한다.<br>
<br>
개발과 동시에 API 연동을 하려면 시행착오가 많을 수 밖에 없다.<br>
개발에 적용시키기 전에 API가 제대로 req, res 되는지 확인해볼 수 있는 사이트를 적극 활용했다. <br>
링크 > https://www.postman.com/ <br>
<br>
개인뱅킹에는 예금, 출금, 대출 등 상품도 다양하고 기능이 매우 많으니 <br>
개인적으로 더 디벨롭시켜봐도 좋을 듯 <br>
퇴근하고 여유가 있다면 ^_^..

<hr>
[Bank.zip](https://github.com/60limm/HBank/files/8094327/Bank.zip)
[Bank0304.zip](https://github.com/60limm/HBank/files/8183694/Bank0304.zip)


