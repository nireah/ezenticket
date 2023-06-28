# EZEN Ticket
* 콘서트 예매 사이트
* Spring 프로젝트
* 개인 프로젝트

## 🚩 프로젝트 목적
개인 사이드 프로젝트로 Spring 사용 경험 및 숙련도 향상을 위하여 진행

## 🖥 프로젝트 소개
* 회원 사용자와 비회원 사용자는 콘서트 정보를 확인할 수 있다.
* 회원 사용자는 좌석을 예매할 수 있으며 예매내역을 조회, 취소할 수 있다.
* 관리자는 콘서트 정보를 등록, 수정, 삭제할 수 있다.
* 사이트는 예매 수수료를 받아 수익을 창출한다.

## 📆 개발 기간
* 2023.03.30. ~ 2023.04.12. (2주)

## 📃 개발 내용
* 메인 페이지 및 사이트메쉬
* 콘서트 관리 - 콘서트 CRUD
* 예매 관리 - 예매 CRUD

## ⚙ 개발 환경
* `Java 8`
* `JDK 1.8`
* **IDE**: STS 4
* **Framework**: Spring
* **Database**: OracleDB 11g XE
* **ORM**: MyBatis
* **DBCP**: HikariCP
* 기타 주요 라이브러리: jdbc, lombok, aspectJ, log4j, log4j2

***
## 📌 주요 개발 기능
#### 좌석배치도 - <a href="https://github.com/nireah/ezenticket/blob/5c718dfb70b772be715d38b247b23feda137fac9/src/main/webapp/WEB-INF/views/ticketing/seat1.jsp#L54-L145">코드보기<a>
* 열은 숫자로, 행은 알파벳으로 반복문을 실행하여 좌석배치도를 구현함.
* 좌석등급에 따라 체크박스 색상이 다르게 나타나도록 구현함.
* 콘서트마다 장소번호를 부여하여 그 번호에 따라 다른 좌석배치도가 출력되도록 구현함.
* 이미 예매된 좌석 리스트를 받아와서 이에 해당하는 좌석은 disabled 되도록 구현함.

#### 검색 및 페이징 처리
* sitemesh에 포함되어 있는 검색창에 검색어를 입력하여 검색.
* 해당 검색어가 포함된 콘서트 리스트가 출력되도록 구현함. - **<a href="https://github.com/nireah/ezenticket/blob/09ddb560251a4a063d992a61c2b245252b42d5a2/src/main/resources/com/ezen_ticket/concert/mapper/ConcertMapper.xml#L7-L19">코드보기<a>**
* JSTL의 반복문을 이용하여 4개 * 2행으로 한 페이지에 총 8개씩 출력하도록 구현함. - **<a href="https://github.com/nireah/ezenticket/blob/5c718dfb70b772be715d38b247b23feda137fac9/src/main/webapp/WEB-INF/views/concert/list.jsp#L72-L104">코드보기<a>**

#### 콘서트 수정, 삭제 제한 - <a href="https://github.com/nireah/ezenticket/blob/5c718dfb70b772be715d38b247b23feda137fac9/src/main/java/com/ezen_ticket/concert/controller/ConcertController.java#L198-L221">코드보기<a>, <a href="https://github.com/nireah/ezenticket/blob/09ddb560251a4a063d992a61c2b245252b42d5a2/src/main/resources/com/ezen_ticket/concert/mapper/ConcertMapper.xml#L127-L130">코드보기<a>
* 해당 콘서트의 예매내역이 있는지를 Boolean 타입으로 반환하는 쿼리를 실행하여 확인 후 true가 반환될 경우 수정, 삭제가 불가능하도록 구현함.

#### 콘서트 환불 규정 - <a href="https://github.com/nireah/ezenticket/blob/5c718dfb70b772be715d38b247b23feda137fac9/src/main/webapp/WEB-INF/views/ticketing/view.jsp#L13-L55">코드보기<a>
* 현재 날짜와 관람일을 시간으로 변환한 뒤 그 차이를 계산하여 환불 버튼을 클릭했을 때 그 기간 차이를 기준으로 환불금액 알림창이 나오도록 구현함.
