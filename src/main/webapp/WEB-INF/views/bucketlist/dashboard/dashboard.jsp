<%-- Created by IntelliJ IDEA. User: Mihyun Lee Date: 2022-05-23 Time: 오후 8:39 To change this template use File |
    Settings | File Templates. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<c:url value=" /css/index.css" />"/>
    <link rel="stylesheet" href="<c:url value=" /dist/output.css" />"/>
    <title>대시보드</title>
</head>

<body>
<%@include file="../../header.jsp" %>
<main>
    <div class="flex flex-wrap justify-center max-h-screen mx-20">
        <div class="w-full lg:w-1/4">
            <aside>
                <div class="container flex flex-wrap items-center ">
                    <div class="w-full mt-44 bg-white shadow-lg transform duration-200 ease-in-out">
                        <div class="flex justify-center px-5 -mt-20">
                            <div>
                                <img class="w-44 h-44 object-cover bg-white rounded-full shadow-xl"
                                     src="<c:url value=" /images/profile-sample.jpg" />"
                                     alt="profile"/>
                            </div>
                        </div>

                        <div class="w-full px-4 text-center my-10">
                            <div class="text-center px-14">
                                <h2 class="text-gray-800 mt-3 text-3xl font-bold">Guest</h2>
                                <p class="text-gray-400 mt-3">guest@gmail.com</p>
                                <p class="text-gray-600 mt-3 mb-16">
                                    아무리 가까운 길이라도 가지 않으면 도달하지 못하고 아무리 쉬운
                                    일이라도 하지 않으면 이루지 못한다.
                                </p>
                            </div>
                            <div class="p-3 text-center">
                                <span class="mb-3 text-4xl font-bold block tracking-wide text-gray-600">
                                    3
                                </span>
                                <span class="mb-3 text-lg block text-gray-400">
                                    Totals your Bucket List
                                </span>
                            </div>
                            <div class="flex justify-center py-4 lg:pt-4 pt-8">
                                <div class="mr-2 p-3 text-center">
                                    <span class="text-xl font-bold block tracking-wide text-gray-600">
                                        2
                                    </span>
                                    <span class="text-sm text-red-400">Activated</span>
                                </div>
                                <div class="p-3 text-center">
                                    <span class="text-xl font-bold block tracking-wide text-gray-600">
                                        1
                                    </span>
                                    <span class="text-sm text-green-500">Completed</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
        <div class="w-full lg:w-3/4 mt-4">
            <section class="flex flex-col h-full">
                <nav class="flex justify-center flex-wrap mt-7">
                    <button data-category-name="all"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        🗒️ 전체
                    </button>
                    <button data-category-name="travel"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        ✈️ 여행
                    </button>
                    <button data-category-name="challenge"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        ⛷️ 도전
                    </button>
                    <button data-category-name="exprience"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        💐 경험
                    </button>
                    <button data-category-name="skill"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        ⚒️ 기술
                    </button>
                    <button data-category-name="education"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        🎓 교육
                    </button>
                </nav>
                <div class="flex flex-col flex-grow items-center bg-white mt-10 mx-10 py-4 shadow-lg">
                    <button class="w-1/2 p-2 border border-white rounded-lg bg-mainGreen2-100 hover:bg-mainGreen2-200 text-white">
                        <i class="fa-solid fa-plus"></i>
                        새로운 버킷 리스트 추가하기
                    </button>
                    <div aria-label="group of cards" tabindex="0"
                         class="focus:outline-none px-4 pt-7 w-full">
                        <div class="w-full">
                            <div aria-label="card 1" tabindex="0"
                                 class="cursor-pointer focus:outline-none active:opacity-90 mb-6 bg-white p-6 shadow rounded">
                                <div class="flex items-center pb-4">
                                    <img src="https://images.unsplash.com/photo-1604175287072-b5e71423060c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687"
                                         alt="bucketImg" class="w-16 h-16 rounded-full"/>
                                    <div class="flex items-start justify-between w-full">
                                        <div class="pl-4 w-full">
                                            <p tabindex="0"
                                               class="focus:outline-none text-xl font-medium leading-5 text-gray-800">
                                                에펠탑 앞에서 사진 찍기</p>
                                            <p tabindex="0"
                                               class="focus:outline-none text-sm leading-normal pt-2 text-gray-500">
                                                작성 일자 :
                                                2022.05.23</p>
                                            <div tabindex="0"
                                                 class="focus:outline-none flex flex-wrap justify-between pt-2">
                                                <div class="py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                    ✈️ 여행
                                                </div>
                                                <div class="flex flex-wrap justify-between mt-2 sm:mt-0">
                                                    <div  class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                        수정
                                                    </div>
                                                    <div class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                        완료
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button aria-label="remove">
                                            <i class="fa-solid fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div aria-label="card 2" tabindex="0"
                                 class="cursor-pointer focus:outline-none active:opacity-90 mb-6 bg-white p-6 shadow rounded">
                                <div class="flex items-center pb-4">
                                    <img src="https://images.unsplash.com/photo-1615791287388-6f1bd87ace4e?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176"
                                         alt="bucketImg" class="w-16 h-16 rounded-full"/>
                                    <div class="flex items-start justify-between w-full">
                                        <div class="pl-4 w-full">
                                            <p tabindex="0"
                                               class="focus:outline-none text-xl font-medium leading-5 text-gray-800">
                                                한 달에 책 한 권 읽기</p>
                                            <p tabindex="0"
                                               class="focus:outline-none text-sm leading-normal pt-2 text-gray-500">
                                                작성 일자 :
                                                2022.01.28</p>
                                            <div tabindex="0"
                                                 class="focus:outline-none flex flex-wrap justify-between pt-2">
                                                <div class="py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                    ⛷️ 도전
                                                </div>
                                                <div class="flex flex-wrap justify-between mt-2 sm:mt-0">
                                                    <div class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                        수정
                                                    </div>
                                                    <div class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                        완료
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button aria-label="remove">
                                            <i class="fa-solid fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div aria-label="card 3" tabindex="0"
                                 class="cursor-pointer focus:outline-none active:opacity-90 mb-6 bg-white p-6 shadow rounded">
                                <div class="flex items-center pb-4">
                                    <img src="https://images.unsplash.com/photo-1526379095098-d400fd0bf935?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332"
                                         alt="bucketImg" class="w-16 h-16 rounded-full"/>
                                    <div class="flex items-start justify-between w-full">
                                        <div class="pl-4 w-full">
                                            <p tabindex="0"
                                               class="focus:outline-none text-xl font-medium leading-5 text-gray-800">
                                                파이썬 배우기</p>
                                            <p tabindex="0"
                                               class="focus:outline-none text-sm leading-normal pt-2 text-gray-500">
                                                작성 일자 :
                                                2022.02.11</p>
                                            <div tabindex="0"
                                                 class="focus:outline-none flex flex-wrap justify-between pt-2">
                                                <div class="py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                    🎓 교육
                                                </div>
                                                <div class="flex flex-wrap justify-between mt-2 sm:mt-0">
                                                    <div class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                        수정
                                                    </div>
                                                    <div class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                        완료
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button aria-label="remove">
                                            <i class="fa-solid fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</main>
</body>
</html>