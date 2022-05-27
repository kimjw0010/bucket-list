<%--
  Created by IntelliJ IDEA.
  User: Mihyun Lee
  Date: 2022-05-27
  Time: 오후 8:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div x-show="editModalOpen" class="fixed inset-0 z-50 overflow-y-auto"
     aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <div
            class="flex items-end justify-center min-h-screen px-4 text-center md:items-center sm:block sm:p-0">
        <div x-cloak @click="editModalOpen = false" x-show="editModalOpen"
             x-transition:enter="transition ease-out duration-300 transform"
             x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
             x-transition:leave="transition ease-in duration-200 transform"
             x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
             class="fixed inset-0 transition-opacity bg-gray-500 bg-opacity-40"
             aria-hidden="true">
        </div>

        <div x-cloak x-show="editModalOpen"
             x-transition:enter="transition ease-out duration-300 transform"
             x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
             x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
             x-transition:leave="transition ease-in duration-200 transform"
             x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100"
             x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
             class="inline-block w-full max-w-xl p-8 my-20 overflow-hidden text-left transition-all transform bg-white rounded-lg shadow-xl 2xl:max-w-2xl">
            <div class="flex items-center justify-between space-x-4">
                <h1 class="text-2xl font-medium text-gray-800 "> 🪣 버킷리스트 수정하기</h1>

                <button @click="editModalOpen = false"
                        class="text-gray-600 focus:outline-none hover:text-gray-700">
                    <i class="fa-solid fa-xmark fa-lg"></i>
                </button>
            </div>

            <p class="mt-2 text-md text-gray-500 ">
                더 멋진 버킷 리스트를 기대할게요! ✨
            </p>

            <form class="mt-5">
                <div>
                    <label for="bucket-title"
                           class="block text-md text-gray-700 capitalize dark:text-gray-200">제목</label>
                    <input placeholder="Vanilla JS 프로젝트 개발하기" type="text"
                           id="bucket-title"
                           class="block w-full px-3 py-2 mt-2 text-gray-600 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:border-mainGreen3 focus:outline-none focus:ring focus:ring-mainGreen3 focus:ring-opacity-40">
                </div>

                <div class="mt-4">
                    <label for="bucket-category"
                           class="block text-md text-gray-700 capitalize dark:text-gray-200">카테고리</label>
                    <select
                            id="bucket-category"
                            class="block w-full px-3 py-2 mt-2 text-gray-600 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:border-mainGreen3 focus:outline-none focus:ring focus:ring-mainGreen3 focus:ring-opacity-40">
                        <option>✈️ 여행</option>
                        <option>⛷️ 도전</option>
                        <option>💐 경험</option>
                        <option>⚒️ 기술</option>
                        <option>🎓 교육</option>
                    </select>
                </div>

                <div class="mt-4">
                    <label for="bucket-image"
                           class="block text-md text-gray-700 capitalize dark:text-gray-200">대표
                        이미지</label>
                    <input
                            class="block w-full px-3 py-2 mt-2 text-gray-600 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:border-mainGreen3 focus:outline-none focus:ring focus:ring-mainGreen3 focus:ring-opacity-40"
                            id="bucket-image" type="file">
                </div>

                <div class="flex justify-end mt-6">
                    <button type="button"
                            class="px-3 py-2 text-sm tracking-wide text-white capitalize transition-colors duration-200 transform bg-mainGreen2-100 rounded-md hover:bg-mainGreen2-200 focus:outline-none focus:bg-mainGreen2-200 focus:ring focus:ring-mainGreen3 focus:ring-opacity-50">
                        완료
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
