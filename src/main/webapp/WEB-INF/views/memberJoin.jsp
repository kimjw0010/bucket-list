<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jinhyeok kim
  Date: 2022-05-08
  Time: 오후 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="<c:url value="/css/index.css"/>" />
<%--  <link rel="stylesheet" href="/dist/output.css" />--%>
  <title>회원가입</title>
</head>
<body>
<header>
  <nav>
    <a href="/">
      <img src="<c:url value="/images/logo-s.png"/>"
            alt="logo"
            class="w-48 h-auto ml-10 m-2"
      />
    </a>
    <div>
      <a href=""></a>
      <a href=""></a>
    </div>
  </nav>
</header>
<main class="mt-10 flex justify-center">
  <div class="wrapper bg-white flex justify-center mt-5 w-full">
    <form id="login-form" method="post">
      <div class="w-full">
        <div class="mt-10 mb-4">
          <label for="user-name" class="input-label"> 이름 </label>
          <input
                  type="text"
                  id="user-name"
                  name="UserName"
                  class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                  placeholder="김버킷"
                  autocomplete="off"
          />
        </div>
        <div class="mb-4">
          <label
                  for="user-email"
                  class="input-label focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
          >
            이메일
          </label>
          <input
                  type="email"
                  id="user-email"
                  name="UserEamil"
                  class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                  placeholder="mybucket@bucket.co.kr"
                  autocomplete="off"
          />
        </div>
        <div class="mb-6">
          <label for="user-name" class="input-label"> 비밀번호 </label>
          <input
                  type="password"
                  id="user-pw"
                  name="UserPW"
                  class="input-field focus:ring-2 focus:ring-mainGreen2 focus:outline-none invalid:ring-2 invalid:ring-red-400"
                  placeholder="영어,숫자 또는 특수문자 조합 10~20자 이내"
                  autocomplete="off"
          />
        </div>
        <div class="mb-5">
          <div class="flex flex-col mb-6">
            <label class="mb-2 font-bold"
            ><input type="checkbox" /> 모두 동의하기</label
            >
            <label class="mb-2"
            ><input type="checkbox" /> 이용약관, 개인정보처리방침에
              동의합니다.</label
            >
            <label class="mb-2"
            ><input type="checkbox" /> (선택) 소식 및 정보 수신에
              동의합니다.</label
            >
          </div>
          <button
                  type="submit"
                  name="submit"
                  id="user-submit-button"
                  class="input-submit bg-mainGreen2 text-white mb-10"
          >
            회원가입하고 Bucket 이용하기
          </button>
        </div>
      </div>
    </form>
  </div>
</main>
</body>
</html>

