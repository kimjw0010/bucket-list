# bucket-list
bucket-list


application.properties - 설정 파일 한번 확인 부탁드립니다.
기본 포트 변경 : 58080
Front관련 파일은 webapp/WEB-INF/views에 넣어주시면 됩니다.

DB설정은 각자 로컬 상황에 맞게 수정해야 합니다.
username, password, url은 데이터베이스명 bucketlist 확인

@DeleteMapping 사용하기 위해 추가
spring.mvc.hiddenmethod.filter.enabled

controller, domain, dto, repository, service 생성 시 어노테이션 추가 꼭 하셔야합니다.

Mybatis Mapper는 resources/mappers에 모아서 작성해 주시면됩니다.
MemberMapper.xml을 참고하셔서 작성하시면 되는데 해당 xml 기준 5번 째줄에 매핑되는 repository를 잘 확인해 주시기 바랍니다.

