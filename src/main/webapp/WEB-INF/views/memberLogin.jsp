<%--
  Created by IntelliJ IDEA.
  User: Mihyun Lee
  Date: 2022-05-19
  Time: 오전 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<c:url value="/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/dist/output.css"/>"/>
    <title>로그인</title>
</head>
<body>
<%@include file="header.jsp"%>
<main class="mt-10 flex justify-center">
    <div class="wrapper bg-white flex justify-center mt-5 w-full">
        <form id="login-form" action="" method="post" class="w-full mx-16">
            <input type="hidden" name="_method" value="put" />
            <div class="w-full">
                <div class="mt-10 mb-4">
                    <label for="user-email"
                           class="input-label focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400">
                        이메일
                    </label>
                    <input type="email" id="user-email" name="email"
                           class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                           autocomplete="off"/>
                </div>
                <div class="mb-4">
                    <label for="user-pw" class="input-label"> 비밀번호 </label>
                    <input type="password" id="user-pw" name="password"
                           class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                           autocomplete="off"/>
                </div>
                <div class="mt-10 mb-5">
                    <button
                            type="button"
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
</body>
</html>

