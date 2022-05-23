<%--
  Created by IntelliJ IDEA.
  User: rlawl
  Date: 2022-05-12
  Time: 오후 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<header>
    <nav class="relative h-full px-6 xl:px-52 flex justify-between items-center bg-white drop-shadow-sm">
        <a href="<c:url value="/bucketlist"/>">
            <img src="<c:url value="/images/logo-s.png"/>" alt="logo" class="w-40 h-auto m-1"/>
        </a>
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
                    <a class="px-6 py-3 m-1 mb-2 leading-loose text-sm text-center text-white font-semibold bg-mainGreen2-100 hover:bg-mainGreen2-200 rounded-xl"
                       href="<c:url value="/bucketlist/members/logout"/>"><c:out value="${sessionScope.member.email}"></c:out>  로그아웃</a>
                </c:otherwise>
            </c:choose>
            <!-- user menu -->
            <div class="mx-4 h-12 w-12 inline-block relative" x-data="{ showMenu : false }" @click.away="showMenu = false">
                <div
                        class="h-12 w-12 cursor-pointer rounded-full border-2 border-transparent bg-indigo bg-no-repeat bg-cover bg-center bg-blue-50"
                        style="
                background-image: url('https://ui-avatars.com/api/?name=G&color=7F9CF5&background=EBF4FF');
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
                    background-image: url('https://ui-avatars.com/api/?name=G&color=7F9CF5&background=EBF4FF');
                  "></div>
                        <div class="mt-6 text-center">
                            <div class="font-bold">Guest</div>
                            <div class="text-gray-500 text-sm">guest@gmail.com</div>
                        </div>
                        <div class="mt-6">
                            <button
                                    class="px-4 py-2 text-sm bg-white rounded-xl border transition-colors duration-150 ease-linear border-gray-200 text-gray-500 focus:outline-none focus:ring-0 font-bold hover:bg-gray-50 focus:bg-indigo-50 focus:text-indigo">
                                설정
                            </button>
                        </div>
                    </div>
                    <div class="border-b border-gray-200 text-sm text-center">
                        <a href="#" class="px-3 py-4 block hover:bg-gray-50 transition-colors duration-150 ease-linear">🚀
                            대시보드</a>
                    </div>
                    <div class="border-b border-gray-200 p-4 text-center">
                        <button
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
        </div>
    </nav>
</header>