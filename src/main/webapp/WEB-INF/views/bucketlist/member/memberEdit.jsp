<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../header.jsp"%>
<%
    Member member = (Member)session.getAttribute("member");

    String src = "/images/member/" + member.getSrc();
%>
<main class="mt-10 flex justify-center">
    <div class="wrapper bg-white flex justify-center mt-5 w-full">
        <form id="login-form" action="?" method="post" class="w-full mx-16 ">
            <input type="hidden" name="_method" value="PUT">
            <div class="w-full">
                <div class="filebox mt-8 mb-4 flex justify-center">
                    <c:choose>
                        <c:when test="${empty member.src}">
                            <div class="w-40 h-40 object-cover bg-blue-50 rounded-full shadow-xl"></div>
                        </c:when>
                        <c:otherwise>
                            <img class="w-40 h-40 object-cover bg-white rounded-full shadow-xl" src="<%=src%>" alt="profile"/>
                        </c:otherwise>
                    </c:choose>

                    <label for="input-file">
                        <i class="fa-solid fa-circle-plus"></i>
                    </label>
                    <input type="file" id="input-file" name="imageForm">
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
                    <label for="re-user-pw" class="input-label"> 비밀번호 확인</label>
                    <input type="password" id="re-user-pw" name="password2" value=""
                           class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                           autocomplete="off"/>
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

<script>
    window.onload = () => {
        const getPass = () => {
            const pass = document.getElementById('user-pw').value;
            const repass = document.getElementById('re-user-pw').value;
            return [pass, repass]
        }
        document.getElementById('user-signout-button').onclick = e => {
            const [pass, repass] = getPass()

            if ((pass !== repass) || (pass !== "<%=member.getPassword()%>")) {
                alert('패스워드가 틀립니다.');
                return;
            }

            if (confirm('정말 삭제하시겠습니까?')) {
                document.getElementsByName("_method")[0].value = "delete";
                $('#login-form').submit();
            }
        }
        document.getElementById('user-submit-button').onclick = e => {
            const [pass, repass] = getPass()

            if (pass && repass && pass !== repass) {
                alert('패스워드가 틀립니다.');
                return;
            }

            if (confirm('정말 수정하시겠습니까?')) {
                document.getElementById("login-form").enctype = "multipart/form-data";
                document.getElementsByName("_method")[0].value = "put";
                $('#login-form').submit();
            }
        }
    }
</script>