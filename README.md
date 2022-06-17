## 🐣LeeJunHo🐣
![깃허브 이준호](https://user-images.githubusercontent.com/61109660/160550326-5393d87d-20ab-46e6-a1c1-b03c4d3dc003.png)
### 30기 iOS 파트 커리큘럼🍏    
| 주차 | 내용 | 세미나 | PR | 참고 |
|:----:|:-----:|:----:|:----:|:----:|
| `1주차` | iOS 개발 입문 : Xcode 기본 사용법, Layout 기초, View 화면 전환 |✅|✅|  | 
| `2주차` | UI 설계 기초(1) : AutoLayout, StackView, TabBarController |✅|✅|  | 
| `3주차` | UI 설계 기초(2) : ScrollView, TableView, CollectionView |✅|✅|  | 
| `4주차` | 서버 통신 기초: 서버와 클라이언트 이해, RESTful API, Alamofire를 활용한 실습 |✅|✅|[📌](https://jazz-the-it.tistory.com/25)| 
| `5주차` | 클라이언트 · 디자인 합동 세미나 |✅|✅|[📌](https://github.com/THE-SOPT-30th-DaangnMarket-Team16-2/DaangnMarket-iOS)| 
|`6주차`| 클라이언트 · 서버 합동 세미나 |✅|✅|[📌](https://github.com/THE-SOPT-30th-DaangnMarket-Team16-2/DaangnMarket-iOS)| 
|`7주차`| 서버 통신 및 데이터 전달 심화 : 서버 통신 추가 실습 |✅|✅|  | 
|`8주차`| 앱잼을 위한 프로젝트 기초 세팅 및 그 외 꿀팁 소개 | | | |

## 🎯목표
1. MVVM + RxSwift 연습
2. POP 연습
3. Coordinator 사용
4. Moya 세팅 : BaseTarget + BaseService
5. Custom UI Component 분리
6. 폴더링 완성해가기

## ✳️ 7차 과제 및 목표 점검
### ✨ 1차 과제 ~ 4차 과제를 하며 어려웠던, 또는 이슈를 해결했던 내용
 1~4차 과제에서는 인스타그램 클론코딩을 통해 기초 UI 작업 및 간단한 API 연결 작업을 진행했다. 거의 모든 부분이 이미 구현할 수 있었던 부분이었기에, 구현 자체보다는 효율성 및 새로운 기술 습득에 목표를 두었다. OB로서 iOS 파트 과제를 두 번째로 하는 것이기에 루즈해지지 않고 많은 내용을 얻어갈 수 있도록 최대한 목표를 높게 잡았다.
 이렇게 잡은 목표들은 1주차 세미나부터 ReadMe에 적어 놓았고, 항상 부족한 부분과 목표를 상기시킬 수 있도록 했다. 각각의 목표들에 대한 성취도를 스스로 평가하며 어려웠던 내용, 이슈를 해결했던 내용을 정리하려 한다.

**1. MVVM + RxSwift 연습**

 처음에 알고 있던 수준은 MVVM의 개념과 효율적인 아키텍쳐의 필요성 정도로 조금 추상적인 내용에 기대어 두루뭉실하게 알고 있었다. MVVM이 무엇인지는 설명할 수 있지만, 어떻게 구현하고 그것이 실제로 왜 도움이 되는지에 대해서 타인에게 설명을 해보라고 하면 막막해지는 수준이었다. 그나마 MVVM은 스터디를 하면서 조금 친숙해졌지만, MVVM의 핵심적인 부분을 담당하는 RxSwift에 대해서는 전혀 아는 부분이 없었다. 학기 초라 시간이 많이 남았던 만큼 바빠지기 전에 RxSwift에 대해서 빠르게 공부하고 넘어가야겠다는 생각이 들었고, 조금씩 공부해가며 미니 세션 준비도 했다. 세션 준비를 하면서 잘못된 정보를 전달하면 안되기 때문에 더 열심히 공부할 수 있었던 것 같다.
 Rx 스터디를 하면서 전반적인 RxSwift에 대한 이해도가 초반에 비할 것 없이 높아졌으나, Rx를 통한 서버통신이나 데이터 관리에 대한 부분은 아직까지 크게 유용함을 느끼지 못하고 있다. 추가로 3차 과제에서 RxCocoa를 이용한 TableView를 구성해 보았는데 섹션을 사용하기 위해 RxDataSource를 사용해야 하며 Delegate로는 Proxy를 구현해야 하는 부분 때문에, 아무래도 DiffableDataSource와 CompositionalLayout을 잘 쓰는 것이 더 도움이 되는 것 같다는 생각을 했다. 또한 Prepare 메서드로 인해서 DisposeBag이 자꾸 초기화되는 문제가 있었는데, 이 부분에 대해서는 뷰컨트롤러에 DisposeBag을 두는지, 셀 안에 DisposeBag을 두는지에 따라 달라진다는 점을 알게 되었다.

[RxSwift 기본 1편 : Observable, Observer, Subject](https://jazz-the-it.tistory.com/21)

**2. POP 연습**

 POP, Protocol-Oriented-Programming도 사실 처음에는 무슨 말인지도 제대로 모르면서 알아보자는 느낌으로 목표에 적어 놓았다. 막연히 모르는 개념에 대해서 알고 싶다고 생각한 이유는, GitHub에서 iOS 고수님들의 코드를 보면 프로토콜을 정말 능숙하게 다룬다는 느낌이 들었고, 초기에 한창 관심있어 하던 아키텍쳐에서도 결국 Protocol은 굉장히 중요했다.
 POP는 세미나 과제를 하면서, Rx 스터디 & 아키텍쳐 및 디자인패턴 스터디를 하면서 조금씩 감이 잡혔다. 아직 능숙한 사용은 멀었지만 적어도 왜 Protocol이 중요한지에 대해서는 감을 잡을 수 있었다. 추가적으로 이번 학기에 Java 수업을 들으면서 Interface와 Abstract Class를 통한 디자인 패턴을 구현하는 부분에 대해서도 종합적으로 바라볼 수 있어서 이해에 조금 도움이 되었던 것 같다.
 그래서 프로토콜은, 모듈 간 의존성을 낮춰주고(유닛 테스팅이 쉬워짐) 특정 클래스에 대한 청사진을 제공하며, 협업 시에도 코드의 구조를 살펴보기 편하게 한다. 체화되지 않은 만큼 앞으로도 꾸준히 POP를 연습하려고 한다.

**3. Coordinator 사용**

 아쉽지만 아직까지 Coordinator를 적용해보지는 못했다. 이유는 Coordinator가 사람에 따라 너무 다르게 사용하고, 다른 프로젝트에서도 유용하게 사용할 수 있는 Coordinator 구조를 만드는 일이 꽤나 고민스러웠기 때문이다. 그래도 Coordinator에 대한 예제를 많이 분석해 보고, Factory와 결합된 Coordinator라던지, 클린 아키텍쳐나 Rx와 어떻게 함께 쓰이는지에 대해 공부하며 다른 개념에 대한 이해도를 높일 수 있었다. 가장 기본적인 Coordinator를 제작하며 뷰컨트롤러의 참조를 남기냐, 남기지 않냐에 따라 화면전환이 되고 안되고가 결정된다는 것을 알게 되었는데, 이로 인해 VC 간의 push, pop, present에 대해서 다시금 짚어보며 VC의 메모리 또는 참조 관계에 대해서 공부하게 되었다. 또한 View Life Cycle과 View Drawing Cycle에 대해서도 다시 살펴보았다.

[Coordinator Pattern 기본! With RayWanderlich Tutorial!](https://jazz-the-it.tistory.com/28)

**4. Moya 세팅 : BaseTarget + BaseService**

 이 부분은 초기 목표와 가장 달라진 부분인데, Moya가 아니라 Alamofire를 BaseAPI와 BaseService를 이용하여 모듈화했다. 초기에 Moya를 이용하려고 했던 이유는 앱잼에서 가장 사용하기 쉬운 서버통신 라이브러리가 Moya라고 생각해서였는데, Spark 프로젝트 중에 Moya가 너무 두텁게 Layering되어 있고, URLSession에 대한 원론적인 접근 및 이해를 막는다고 생각하여 한 수준 낮은 Alamofire를 채택하게 되었다. Alamofire를 모듈화하면서 느낀 점은, 확실히 서버통신에 대한 이해가 URLSession -> Alamofire -> Moya 순으로 가야 Moya도 잘 쓸 수 있겠다는 점이다. 이에 대한 내용은 블로그에 정리해 놓았다.

[Alamofire를 Moya처럼 사용해보자! By Router Pattern (1편 - Foundation Setting)](https://jazz-the-it.tistory.com/25)
[Alamofire를 Moya처럼 사용해보자! By Router Pattern (2편 - Services, Routers 구현)](https://jazz-the-it.tistory.com/26)
[Alamofire를 Moya처럼 사용해보자! By Router Pattern (3편 - body, queryBody, requestPlain, Multipart 구현)](https://jazz-the-it.tistory.com/35)
[Alamofire를 Moya처럼 사용해보자! By Router Pattern (4편 - EventLogger로 통신 결과 확인하기)](https://jazz-the-it.tistory.com/36)

**5. Custom UI Component**
 
 1, 2, 3차 과제에서 반복되는 UI를 찾아서 Custom Component Class로 제작했다. 프로그래밍의 어느 부분에서든 재사용성이 높게 만드는 점은 나중에 항상 이점으로 작용하는 것 같다. 3차 과제에서는 Builder Pattern으로 원하는 Actions을 받아서 Closure에 저장하고 이를 버튼에 부여하는 Custom Navigation Bar를 제작했다. 또한 모든 Component를 작성할 때 SOLID 원칙에 맞게 작성하려고 노력했다.

**6. 폴더링 완성**

 이 부분은 1-4차 과제를 하면서는 물론이고, 합동세미나를 진행하며 조금이나마 목표를 달성할 수 있었다. 아키텍쳐, 협업, 확장성을 고려하여 폴더링을 했는데, 아직 다듬을 부분이 많다. 유용한 Extension을 정리하고, 다른 사람들의 폴더링을 보며 왜 이렇게 만들었을지 고민하고, 각각의 다른 아키텍쳐를 가진 프로젝트들이 어떤 폴더링을 채택하는지에 대해 공부하며 폴더링을 완성해 나갔다.

### ✨ 협업을 하면서 어려웠던 점, 새롭게 알게된 점
**Xcode Project에 대한 원론적인 이해**
 이번 합동세미나를 진행하며 구상해 놓은 폴더링을 시험하고, 처음으로 협업을 위한 프로젝트를 세팅해 보았다. 생각보다 모르는 부분이 너무 많았고, Git에서도 몇 번 귀찮은 충돌이 나서 열심히 구글링해서 해결했다. 이 과정에서 느낀 점은 Xcode Project에 대한 원론적인 이해가 많이 부족하다는 점이다. UI를 짜고 기능을 구현하는 일은 어떻게 해서든 해결할 수 있지만, 이 프로젝트가 어떻게 컴파일되고, 빌드되고, 실행되며, OS에 대해 관리되는지에 대한 기초적인 이해가 부족하다. 또한 프로젝트 세팅에서 관리할 수 있는 부분이 매우 많고(info.plist나 buidl setting과 같은 부분), 다른 언어와 다르게 xcodeproj라는 파일이 존재하기 때문에 생기는 문제들에 능숙하게 대처할 수 있어야 한다는 생각이 들었다. 현업에서는 이러한 부분을 해결하기 위해 Tuist와 같은 프로젝트 관리 툴을 쓴다고 하는데, 이러한 툴도 결국에는 Xcode에 대한 기본적인 이해가 뒷받침되어야 하기 때문에 앱잼 전에 시간을 내서 공부하려고 한다.

**적절한 아키텍쳐란? 협업을 위한 폴더링이란?**(합동세미나 과제에서 발췌)
 아키텍쳐와 폴더링에 대해 다시 고민하게 되었다. 완벽한 아키텍쳐란 없고, 적절한 아키텍쳐는 존재하기 때문에 애매하게 알고 있는 지식보다도 실전에서 효율을 올려줄 수 있는 구조를 채택해야 한다는 생각이 들었다. 곧 있으면 앱잼인데, 아키텍쳐를 사용하는 것이 개인적인 욕심이 아닌지, 그것이 아니게 되려면 어떻게 협업을 진행해야 하는지 생각해보자.
 사실 프로젝트 세팅에 관해서 설명해줘야 할 것들이 꽤 있는데 이번 협업에서는 팀원들에게 많은 설명을 해주진 못했다. 앱잼때는 하나하나 알려주고 시작할 것이고, 준비한 아키텍쳐나 구조에 맞는 방식으로 협업이 진행될 수 있도록 팀원들에게 그 의미를 전달할 수 있어야 할 것이다.

**Compositional Layout**
 당근마켓이 두 번째 클론코딩이기도 하고, 평소에 궁금했던 CompositionalLayout으로 뷰를 구현해 보았다. CompositionalLayout도 CollectionViewLayout을 커스텀하는 것과 같은 작업에 익숙해지면 더 잘 쓸수 있겠다는 생각이 들었다. 어떤 부분이든 기초부터 충실하자.
[[UIKit] CompositionalLayout으로 당근마켓 게시글 상세보기 뷰 구현하기](https://jazz-the-it.tistory.com/27
)

### ✨ 앞으로 공부해나갈 부분
- 프로젝트에 대한 원론적인 이해 + Tuist를 통한 프로젝트 관리
- Git에 대한 이해 : 다른 사람의 문제도 편하게 해결해줄 수 있도록
- Clean Architecture : Presentation 말고 Data Layer에 대해서 더 공부
- UNIT Test : 기본적인 개념 공부 이후 RxTest까지
- CI-CD : 체계적인 프로젝트 관리를 위해
- Combine : 개념 알고 코드 리딩 정도는 가능하도록
- SwiftUI : 최근에 Medium이나 RayWenderlchi를 보면 거의 SwiftUI에 대한 강의임. 기본적인 개념 숙지하자.
- 기술
   - Share Extension
   - Naver Map & Kakao Map
   - WebView
   - Animation : 애니메이션을 부여하는 다양한 방법이 있는데, 각각에 대해 차이점을 설명할 수 있도록 공부하기
