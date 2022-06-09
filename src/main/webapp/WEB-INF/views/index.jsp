<%-- Created by IntelliJ IDEA. User: 201712029@office.induk.ac.kr Date: 2021-06-30 Time: 오전 11:40 To change this
    template use File | Settings | File Templates. --%>
    <!DOCTYPE html>
    <html lang="ko">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@include file="header.jsp" %>
            <main class="flex flex-col">
                <div class="mt-1 p-10 md:p-16 xl:px-60 xl:py-40 bg-white grid grid-cols-2 grid-rows-4 items-center">
                    <div class="col-span-2 row-span-1">
                        <h1 class="font-medium text-lg sm:text-xl md:text-3xl xl:text-4xl">
                            <span class="block"> 죽기 전 </span>
                            <span class="mt-2 block">내가 이루고 싶은 것들을 모아서,</span>
                            <span class="mt-2 block"> Mybucket </span>
                        </h1>
                    </div>
                    <div class="col-start-1 row-span-1">
                        <p class="text-sm md:text-base xl:text-xl text-gray-600">
                            여행, 직무, 자기계발, 취미 등 계획만 세워두었던 다양한 버킷
                            리스트를<br />
                            Mybucket과 함께 달성해보세요.
                        </p>
                    </div>
                    <div class="col-start-2 row-start-2 row-span-3 justify-self-center -ml-10 -mt-14">
                        <img class="rounded-2xl shadow-lg" src="<c:url value=" /images/main/main.png" />" alt="main"/>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.member}">
                            <div class="row-start-4 row-span-1">
                                <a class="px-6 py-3 m-1 mb-2 leading-loose text-sm md:text-base xl:text-xl text-center text-white font-semibold bg-mainGreen2-100 hover:bg-mainGreen2-200 rounded-xl"
                                    href="<c:url value=" /bucketlist/members/signup" />"
                                >가입하고 버킷리스트 달성하기</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row-start-4 row-span-1">
                                <a class="px-6 py-3 m-1 mb-2 leading-loose text-sm md:text-base xl:text-xl text-center text-white font-semibold bg-mainGreen2-100 hover:bg-mainGreen2-200 rounded-xl"
                                    href="<c:url value=" /bucketlist/dashboard" />"
                                >버킷리스트 목록으로 이동하기</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="bg-white text-center text-3xl text-gray-500">
                    <i id="arrow_icon" class="cursor-pointer fa-solid fa-chevron-down"></i>
                </div>
                <div class="p-4 md:p-8 xl:px-32 xl:py-32 bg-white flex justify-between">
                    <div class="w-1/2 px-6 md:px-10 xl:px-20">
                        <h2 class="font-medium text-base sm:text-lg md:text-2xl xl:text-3xl">
                            <span class="block mb-2">이번 생에는 꼭 이루고 싶은</span>
                            <span>버킷 리스트를 작성해보세요.</span>
                        </h2>
                        <p class="mt-10 text-sm md:text-base xl:text-lg text-gray-600">
                            여행, 도전, 경험, 기술, 교육 중 카테고리를 지정해서<br>
                            나만의 버킷 리스트를 추가할 수 있어요.<br>
                            내가 생각해왔던 모든 것이 버킷 리스트가 될 수 있답니다!
                        </p>
                    </div>
                    <div class="w-1/2">
                        <img class="rounded-2xl shadow-lg" src="<c:url value=" /images/main/main-list.png" />"
                        alt="main"/>
                    </div>
                </div>
                <div class="p-4 md:p-8 xl:px-96 xl:py-32 bg-gray-100 flex justify-between items-center">
                    <div class="">
                        <img class="w-3/4 rounded-2xl shadow-xl" src="<c:url value=" /images/main/main-profile.png" />"
                        alt="main"/>
                    </div>
                    <div class="pr-4">
                        <h2 class="font-medium text-md sm:text-lg md:text-2xl xl:text-3xl">
                            <span>나의 버킷리스트 달성 현황을 확인할 수 있어요.</span>
                        </h2>
                        <p class="mt-10 text-sm md:text-base xl:text-lg text-gray-600">
                            달성한 버킷리스트 현황을 보면 뿌듯함 두 배, 자신감 두 배!<br>
                            체크하지 않아 발견하지 못했던 나의 의지를 마이버킷에서 확인해볼 수 있어요.<br>
                            과연 1년동안 몇 개의 버킷리스트를 달성할 수 있을까요?
                        </p>
                    </div>
                </div>
                <div class="p-4 md:p-8 xl:px-96 xl:py-32 border-b bg-white flex flex-col justify-center items-center">
                    <span class="block text-xl my-6">그럼 이제, 마이버킷과 함께하세요!</span>
                    <span id="tour_btn"
                        class="cursor-pointer px-6 py-3 m-1 mb-2 leading-loose text-sm md:text-base xl:text-xl text-center text-white font-semibold bg-mainGreen2-100 hover:bg-mainGreen2-200 rounded-xl">홈페이지
                        둘러보기</span>
                </div>
                <!-- footer  -->
                <div class="w-full h-48 lg:h-56 p-6 xl:px-96 xl:py-8 bg-white flex justify-between items-center">
                    <div class="w-full h-full flex flex-col justify-between">
                        <img src="/images/logo-s.png" alt="logo" class="w-40 h-auto m-1" />
                        <div class="block text-sm lg:text-base">나의 버킷리스트를 위해, MYBUCKET</div>
                        <div class="text-xs lg:text-base flex justify-between items-center">
                            <span>ⓒ 2022.Team Berner4 Copy all rights reserved.</span>
                            <span class="ml-auto">Contact Us.</span>
                            <span class="pl-4">
                                <a href="https://github.com/kimjw0010/bucket-list" target="_blank">
                                    <i class="text-3xl fa-brands fa-github"></i>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </main>

            <script type="module" src="<c:url value=" /js/autoScroll.js" />"></script>
            <script type="module" src="<c:url value=" /js/searchCategory.js" />"></script>
            </body>

    </html>