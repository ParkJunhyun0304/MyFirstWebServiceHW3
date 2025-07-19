# 22100304 박준현
# 오늘의집 가구 관리 시스템

---

웹 기반의 가구 관리 시스템으로, 간단한 가구 CRUD 기능을 제공합니다.  
MVC 패턴을 기반으로 한 Spring Framework 기반 프로젝트입니다.

<br/>

---

## 기술 스택

| 구성 요소 | 사용 기술 |
|-----------|-----------|
| Language  | Java 11   |
| Framework | Spring MVC, MyBatis |
| Build Tool | Maven    |
| Database  | MariaDB |
| View      | JSP |
| Server    | Tomcat 9  |

<br/>

---

## 프로젝트 구조

<pre>
src
└── main
├── java
│ └── org.example.WebServiceHW3
│ ├── controller # 컨트롤러 (요청 처리)
│ ├── mapper # MyBatis Mapper 인터페이스
│ └── vo # VO (Value Object)
├── resources
│ └── mappers # MyBatis XML 매퍼
└── webapp
├── WEB-INF
│ └── views
│ └── todayHome # JSP 페이지들 (list, write, edit, view 등)
└── web.xml # 웹 설정 파일

</pre>


---

## 주요 기능

- **가구 등록** : 이름, 가격, 카테고리, 크기(W x D x H) 정보 입력
- **가구 조회** : 전체 리스트 및 상세 정보 확인
- **가구 수정** : 리스트에서 선택한 항목 수정
- **가구 삭제** : 다중 선택 삭제 기능
- **카테고리** : 0~10 사이 정수로 구분되며, 프론트에서 이름으로 변환됨

## 실행 예시

### 메인화면
<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 32 12" src="https://github.com/user-attachments/assets/57caaaa3-4542-426d-ab97-4bb732ed6720" />

---

### 가구 상세보기
- 가구의 이름을 클릭
<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 34 06" src="https://github.com/user-attachments/assets/3a961484-a654-4199-a736-66efc6a7284a" />

### 가구 추가기능
<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 32 52" src="https://github.com/user-attachments/assets/c4bcde07-3ddb-473a-b75a-eacb40ec1516" />
<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 32 55" src="https://github.com/user-attachments/assets/388993cd-2ee8-4c70-8f9e-18cef10fe2eb" />

- 추가된 모습

---

### 가구 수정기능

<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 33 10" src="https://github.com/user-attachments/assets/60008881-5b79-4bad-b306-8748c3571f28" />

<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 33 12" src="https://github.com/user-attachments/assets/60f69d97-26a4-4508-b50a-dbb31c3b26f6" />

- 수정된 모습

--- 
### 가구 가격별 정렬 기능
<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 33 17" src="https://github.com/user-attachments/assets/6e119f38-7d75-4455-9bb6-1613bfe33808" />

### 가구 카테고리별 정렬 기능
<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 33 31" src="https://github.com/user-attachments/assets/f1823900-6ced-4856-82a4-c7bb20cc598d" />

---
### 가구 삭제기능
<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 33 40" src="https://github.com/user-attachments/assets/7239330d-5e4c-44a0-bbd8-7b4960986268" />

- 삭제할 가구를 선택

<img width="1920" height="1080" alt="스크린샷 2025-07-19 오후 8 33 44" src="https://github.com/user-attachments/assets/27723f3b-880d-4c82-8fd6-8fb106ad03fc" />
