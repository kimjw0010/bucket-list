<%@ page import="com.induk.bucketlist.domain.Member" %><%--
  Created by IntelliJ IDEA.
  User: rlawl
  Date: 2022-05-12
  Time: 오후 9:46
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<c:url value=" /css/index.css" />"/>
    <link rel="stylesheet" href="<c:url value=" /dist/output.css" />"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>MyBucket</title>
</head>
<script>
    function logout()  {
        window.location.href = '/bucketlist/members/logout'
    }
</script>
<body>
<header>
    <nav class="relative h-full px-6 xl:px-52 flex justify-between items-center bg-white drop-shadow-sm">
        <c:if test="${sessionScope.member == null}">
        <a href="/bucketlist">
            <img src="/images/logo-s.png" alt="logo" class="w-40 h-auto m-1"/>
        </a>
        </c:if>
        <c:if test="${sessionScope.member != null}">
            <a href="/bucketlist/dashboard">
                <img src="<c:url value="/images/logo-s.png"/>" alt="logo" class="w-40 h-auto m-1"/>
            </a>
        </c:if>
        <!-- Search Bar -->
        <div class="flex-grow relative" x-data="{ showMenu : false }" @click.away="showMenu = false">
            <div class="bg-white rounded-full m-2 p-2 drop-shadow-md ">
                <input readonly type="text" placeholder="&#xF002;  Explore Idea" @click="showMenu = !showMenu"
                       class="font-awesome w-full pl-4 text-lg rounded-full focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div x-show="showMenu"
                 class="bg-white border border-gray-200 absolute right-0 top-16 w-full shadow-lg rounded-xl"
                 x-transition:enter="transition ease duration-100 transform"
                 x-transition:enter-start="opacity-0 scale-90 translate-y-1"
                 x-transition:enter-end="opacity-100 scale-100 translate-y-0"
                 x-transition:leave="transition ease duration-100 transform"
                 x-transition:leave-start="opacity-100 scale-100 translate-y-0"
                 x-transition:leave-end="opacity-0 scale-90 translate-y-1">
                <div id="search-category"
                     class="p-5 flex flex-wrap justify-center items-center border-b border-gray-200 w-full">
                    <div data-category-name="travel" class="category-name" tabindex="-1">여행</div>
                    <div data-category-name="challenge" class="category-name" tabindex="-1">도전</div>
                    <div data-category-name="exprience" class="category-name" tabindex="-1">경험</div>
                    <div data-category-name="skill" class="category-name" tabindex="-1">기술</div>
                    <div data-category-name="education" class="category-name" tabindex="-1">교육</div>
                </div>
                <div id="category-content"></div>
            </div>
        </div>
        <!-- member signin / signup -->
        <div class="flex items-center">
            <c:choose>
                <c:when test="${empty sessionScope.member}">
                    <a class="w-24 px-5 py-2 m-1 leading-loose text-sm text-center bg-gray-50 hover:bg-gray-100 rounded-xl"
                       href="<c:url value="/bucketlist/members/login"/>">
                        로그인
                    </a>
                    <a class="w-24 px-5 py-2 m-1 leading-loose text-sm text-center text-white bg-mainGreen2-100 hover:bg-mainGreen2-200 rounded-xl"
                       href="<c:url value="/bucketlist/members/signup"/>">
                        회원가입
                    </a>
                </c:when>
                <c:otherwise>
                    <%
                        Member member = (Member)session.getAttribute("member");
                        String first_name = "";
                        if(member.getSrc().isEmpty()){
                            first_name = member.getName().substring(0,1).toUpperCase();
                        } else {
                            first_name = member.getSrc();
                        }
                    %>
                    <a class="px-6 py-3 m-1 mb-2 leading-loose text-sm text-center text-white font-semibold bg-mainGreen2-100 hover:bg-mainGreen2-200 rounded-xl"
                       href="<c:url value="/bucketlist/members/logout"/>"><c:out value="${sessionScope.member.email}"></c:out>  로그아웃</a>

                    <!-- user menu -->
                    <div class="mx-4 h-12 w-12 inline-block relative" x-data="{ showMenu : false }" @click.away="showMenu = false">
                        <div
                                class="h-12 w-12 cursor-pointer rounded-full border-2 border-transparent bg-indigo bg-no-repeat bg-cover bg-center bg-blue-50"
                                style="
                background-image: url('https://ui-avatars.com/api/?name=<%=first_name%>&color=7F9CF5&background=EBF4FF');
              " b :class="{ 'border-indigo-100' : showMenu }" @click="showMenu = !showMenu"></div>

                        <div x-show="showMenu"
                             class="bg-white border border-gray-200 absolute right-0 top-14 w-80 shadow-lg rounded-xl"
                             x-transition:enter="transition ease duration-100 transform"
                             x-transition:enter-start="opacity-0 scale-90 translate-y-1"
                             x-transition:enter-end="opacity-100 scale-100 translate-y-0"
                             x-transition:leave="transition ease duration-100 transform"
                             x-transition:leave-start="opacity-100 scale-100 translate-y-0"
                             x-transition:leave-end="opacity-0 scale-90 translate-y-1">
                            <div class="p-6 flex items-center justify-center border-b border-gray-200 w-full flex-col">
                                <div
                                        class="w-20 h-20 rounded-full flex items-center justify-center bg-indigo text-4xl text-white bg-no-repeat bg-cover bg-center"
                                        style="
                    background-image: url('https://ui-avatars.com/api/?name=<%=first_name%>&color=7F9CF5&background=EBF4FF');
                  "></div>
                                <div class="mt-6 text-center">
                                    <div class="font-bold"><%=member.getName()%></div>
                                    <div class="text-gray-500 text-sm"><%=member.getEmail()%></div>
                                </div>
                                <div class="mt-6">
                                    <button
                                            class="px-4 py-2 text-sm bg-white rounded-xl border transition-colors duration-150 ease-linear border-gray-200 text-gray-500 focus:outline-none focus:ring-0 font-bold hover:bg-gray-50 focus:bg-indigo-50 focus:text-indigo">
                                        설정
                                    </button>
                                </div>
                            </div>
                            <div class="border-b border-gray-200 text-sm text-center">
                                <a href="/bucketlist/dashboard" class="px-3 py-4 block hover:bg-gray-50 transition-colors duration-150 ease-linear">🚀
                                    대시보드</a>
                            </div>
                            <div class="border-b border-gray-200 p-4 text-center">
                                <button onclick="logout();"
                                        class="px-4 py-2 text-sm bg-white rounded-xl border transition-colors duration-150 ease-linear border-gray-200 text-gray-500 focus:outline-none focus:ring-0 font-bold hover:bg-gray-50 focus:bg-indigo-50 focus:text-indigo">
                                    로그아웃
                                </button>
                            </div>
                            <div class="p-4 text-xs text-center">
                                <a class="hover:underline hover:text-indigo-500 transition-colors duration-150 ease-linear"
                                   href="#">이용약관</a>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</header>