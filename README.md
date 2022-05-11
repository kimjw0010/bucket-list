# bucket-list

bucket-list

application.properties - 설정 파일 한번 확인 부탁드립니다. <br>
기본 포트 변경 : 58080 / 로컬 접속 : <br>

<br>
Front관련 파일은 webapp/WEB-INF/views에 넣어주시면 됩니다. <br>
기본 설정이 .jsp파일로 되있어서 html파일을 .jsp로 변경해서 작업해주시면 됩니다. 혹시 안되면 말씀해주세요<br>

<br>
DB설정은 각자 로컬 상황에 맞게 수정해야 합니다. <br>
username, password, url은 데이터베이스명 bucketlist 확인 <br>

<br>
@DeleteMapping 사용하기 위해 추가 <br>
spring.mvc.hiddenmethod.filter.enabled <br>

<br>
controller, domain, dto, repository, service 생성 시 어노테이션 추가 꼭 하셔야합니다. <br>

<br>
Mybatis Mapper는 resources/mappers에 모아서 작성해 주시면됩니다. <br>
MemberMapper.xml을 참고하셔서 작성하시면 되는데 해당 xml 기준 5번 째줄에 매핑되는 repository를 잘 확인해 주시기 바랍니다. <br>
