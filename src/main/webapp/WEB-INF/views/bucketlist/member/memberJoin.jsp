<%--
  Created by IntelliJ IDEA.
  User: jinhyeok kim
  Date: 2022-05-08
  Time: 오후 1:24
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../header.jsp"%>
<main class="mt-10 flex justify-center">
    <div class="wrapper bg-white flex justify-center mt-5 w-full">
        <form id="login-form" action="/bucketlist/members/signup" method="post" class="w-full mx-16">
            <div class="w-full">
                <div class="mt-10 mb-4">
                    <spring:bind path="member.name">
                        <label for="user-name" class="input-label"> 이름 </label>
                        <input type="text" id="user-name" name="name" value="${status.value}"
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               placeholder="김버킷" autocomplete="off"/>
                        <span style="color: red">${status.errorMessage }</span>
                    </spring:bind>
                </div>
                <div class="mb-4">
                    <spring:bind path="member.email">
                        <label for="user-email"
                               class="input-label focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400">
                            이메일
                        </label>
                        <input type="email" id="user-email" name="email" value="${status.value}"
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               placeholder="mybucket@bucket.co.kr" autocomplete="off"/>
                        <span style="color: red">${status.errorMessage }</span>
                    </spring:bind>
                </div>
                <div class="mb-6">
                    <spring:bind path="member.password">
                        <label for="user-pw" class="input-label"> 비밀번호 </label>
                        <input type="password" id="user-pw" name="password" value="${status.value}"
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               placeholder="영어,숫자 또는 특수문자 조합 10~20자 이내" autocomplete="off"/>
                        <span style="color: red">${status.errorMessage }</span>
                    </spring:bind>
                </div>
                <div class="mb-5">
                    <div class="mb-6" id="member-agree-select">
                        <input type="checkbox" name="allAgree" id="member-agree-all" class="mb-3 font-bold"/>
                        <strong>모두 동의하기</strong>
                        <br/>
                        <input type="checkbox" name="conditionAgree" class="mb-3"/>
                        이용약관, 개인정보처리방침에 동의합니다.<br/>
                        <input type="checkbox" name="newsAgree" class="mb-3"/>
                        (선택) 소식 및 정보 수신에 동의합니다.
                    </div>
                    <button type="submit" name="submit" id="user-submit-button"
                            class="input-submit bg-mainGreen2-100 hover:bg-mainGreen2-200 text-white mb-10">
                        회원가입하고 Bucket 이용하기
                    </button>

                </div>
            </div>
        </form>
    </div>
</main>
<script type="module" src="<c:url value="/js/searchCategory.js"/>"></script>
<script type="module" src="<c:url value="/js/memberAgree.js"/>"></script>
</body>
</html>
