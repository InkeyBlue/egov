# egov
전자정부프레임워크 v3.8

새로운 프로젝트에 전자정부프레임워크를 처음 설치해서 적용하는 과정을 여과없이 커밋하고 있다.

처음엔 기능을 알아야 해서 올인원을 설치했다 
기능이 너무 많고 기능에 적응이 안된 상태라 변경하는게 엄두가 안났다. 
좀 더 쉽게 접근하기 위해 경량화 버전의 포털템플릿을 설치했다.

이건 조금 만만해 보였고 이것 저것 수정하다 보니 올인원에 있는 기능들이 필요해 졌고 기능을 추가하기 시작했다.
그런데 여기서 부터 난관이 시작되었다.

기존 경량화 버전은 iBatis로 되어있는데 올인원은 MyBatis로 되어 있다.
그런데 일괄로 변경하기는 너무 어렵고 기능을 일부만 추가해야 하기 때문에 우선은 두 가지를 함께 사용하는것이 필요했다.

결국 기능을 익히기 위한 테스트를 진행하면서 순차적으로 MyBatis로 옮겨야 할것 같았다.
모든 변경과정이 낯설어서 쉽지 않았다.

다행히 비교적 메뉴얼이 상세하게 잘 만들어져 있어 조금씩 적응이 되었다.
난관을 겪어가면서 구글링과 매뉴얼을 뒤져가면서 iBatis와 MyBatis를 함께 사용하도록 만들었다.

이후 회의실관리와 상담관리를 추가 했다. 
이 과정은 그다지 어렵지 않게 해결되었다.

그리고 얼마 후엔 기업회원을 추가할 필요가 생겼다.
여기서부터는 추가하는 과정이 이전보다 훨씬 힘들었다.
로그인 기능이 변경되면서 권한과 관련된 사항이 함께 변경되는데 환경설정에 대한 많은것이 종합적으로 맞물린다.

나는 인증과 관련되 부분을 스프링시크릿을 하지 않고 session 을 이용한 방법을 선택해서 진행했다.
특별한 이유는 없지만 스프링시크릿이 낯설었다.

2020.02.19 현재 UI를 변경 중이다.

