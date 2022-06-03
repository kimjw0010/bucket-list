<%--
  Created by IntelliJ IDEA.
  User: Mihyun Lee
  Date: 2022-05-19
  Time: 오전 12:07
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../header.jsp"%>
<main class="mt-10 flex justify-center">
    <div class="wrapper bg-white flex justify-center mt-5 w-full">
        <form id="login-form" action="/bucketlist/members/login" method="post" class="w-full mx-16">
            <div class="w-full">
                <div class="mt-10 mb-4">
                    <spring:bind path="member.email">
                        <label for="user-email"
                               class="input-label focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400">
                            이메일
                        </label>
                        <input type="email" id="user-email" name="email" value="${status.value}" placeholder="mybucket@bucket.co.kr"
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               autocomplete="off"/>
                        <span style="color: red">${status.errorMessage }</span>
                    </spring:bind>
                </div>
                <div class="mb-4">
                    <spring:bind path="member.password">
                        <label for="user-pw" class="input-label"> 비밀번호 </label>
                        <input type="password" id="user-pw" name="password" value="${status.value}" placeholder="영어,숫자 또는 특수문자 조합 10~20자 이내"
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               autocomplete="off"/>
                        <span style="color: red">${status.errorMessage }</span>
                    </spring:bind>
                </div>
                <div class="mt-10 mb-5">
                    <button
                            type="submit"
                            name="submit"
                            id="user-submit-button"
                            class="input-submit bg-mainGreen2-100 hover:bg-mainGreen2-200 text-white mb-10"
                    >
                        로그인
                    </button>
                </div>
            </div>
        </form>
    </div>
</main>
<script type="module" src="<c:url value="/js/searchCategory.js"/>"></script>
</body>
</html>

