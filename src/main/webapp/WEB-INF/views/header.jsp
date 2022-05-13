<%--
  Created by IntelliJ IDEA.
  User: rlawl
  Date: 2022-05-12
  Time: 오후 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<c:url value="/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/form.css"/>"/>
    <title>회원가입</title>
</head>
<body>
<header>
    <nav class="relative px-6 flex justify-between items-center bg-white drop-shadow-sm">
        <a href="<c:url value="/"/>" class="nav-responsive">
            <img src="<c:url value="/images/logo-s.png"/>" alt="logo" class="w-40 h-auto m-1"/>
        </a>
        <div class="nav-responsive">
            <a class="px-6 py-3 m-1 mb-3 leading-loose text-sm text-center font-semibold bg-gray-50 hover:bg-gray-100 rounded-xl"
               href="#">
                로그인
            </a>
            <a class="px-6 py-3 m-1 mb-2 leading-loose text-sm text-center text-white font-semibold bg-mainGreen2-100 hover:bg-mainGreen2-200 rounded-xl"
               href="<c:url value="/bucketlist/members/signup"/>">회원가입</a>
        </div>
    </nav>
</header>