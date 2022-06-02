<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../header.jsp"%>
<%
    Member member = (Member)session.getAttribute("member");
%>
<main class="mt-10 flex justify-center">
    <div class="wrapper bg-white flex justify-center mt-5 w-full">
        <form id="login-form" action="#" method="#" class="w-full mx-16 ">
            <div class="w-full">
                <div class="filebox mt-8 mb-4 flex justify-center">
                    <img class="w-40 h-40 object-cover bg-white rounded-full shadow-xl"
                         src="<c:url value="/static/images/profile-sample.jpg"/>" alt="profile"/>
                    <label for="input-file">
                        <i class="fa-solid fa-circle-plus"></i>
                    </label>
                    <input type="file" id="input-file">
                </div>
                <div class="mb-4">
                    <spring:bind path="member.name">
                        <label for="user-name" class="input-label"> 이름 </label>
                        <input type="text" id="user-name" name="name" value="<%=member.getName()%>"
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               autocomplete="off"/>
                    </spring:bind>
                </div>
                <div class="mb-4">
                    <spring:bind path="member.email">
                        <label for="user-email"
                               class="input-label focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400">
                            이메일
                        </label>
                        <input readonly type="email" id="user-email" name="email" value="<%=member.getEmail()%>"
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               autocomplete="off"/>
                    </spring:bind>
                </div>
                <div class="mb-4">
                    <spring:bind path="member.password">
                        <label for="user-pw" class="input-label"> 비밀번호 </label>
                        <input type="password" id="user-pw" name="password" value=""
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               autocomplete="off"/>
                    </spring:bind>
                </div>
                <div class="mb-4">
                    <spring:bind path="member.password">
                        <label for="user-pw" class="input-label"> 비밀번호 확인</label>
                        <input type="password" id="user-pw" name="password" value=""
                               class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                               autocomplete="off"/>
                    </spring:bind>
                </div>
                <div class="my-8 flex justify-between">
                    <button type="submit" name="submit" id="user-signout-button"
                            class="mr-3 input-submit bg-mainGreen2-100 hover:bg-mainGreen2-200 text-white">
                        탈퇴
                    </button>
                    <button type="submit" name="submit" id="user-submit-button"
                            class="ml-3 input-submit bg-mainGreen2-100 hover:bg-mainGreen2-200 text-white">
                        수정
                    </button>
                </div>
            </div>
        </form>
    </div>
</main>
