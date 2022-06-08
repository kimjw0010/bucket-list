<%--
  Created by IntelliJ IDEA.
  User: Mihyun Lee
  Date: 2022-05-27
  Time: 오후 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div x-show="modalOpen" class="fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title"
     role="dialog" aria-modal="true">
    <div
            class="flex items-end justify-center min-h-screen px-4 text-center md:items-center sm:block sm:p-0">
        <div x-cloak @click="modalOpen = false" x-show="modalOpen"
             x-transition:enter="transition ease-out duration-300 transform" x-transition:enter-start="opacity-0"
             x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in duration-200 transform"
             x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
             class="fixed inset-0 transition-opacity bg-gray-500 bg-opacity-40" aria-hidden="true"></div>

        <div x-cloak x-show="modalOpen" x-transition:enter="transition ease-out duration-300 transform"
             x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
             x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
             x-transition:leave="transition ease-in duration-200 transform"
             x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100"
             x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
             class="inline-block w-full max-w-xl p-8 my-20 overflow-hidden text-left transition-all transform bg-white rounded-lg shadow-xl 2xl:max-w-2xl">
            <div class="flex items-center justify-between space-x-4">
                <h1 class="text-2xl font-medium text-gray-800 "> 🪣 버킷리스트 추가하기</h1>

                <button id="close_modalA" @click="modalOpen = false"
                        class="text-gray-600 focus:outline-none hover:text-gray-700">
                    <i class="fa-solid fa-xmark fa-lg"></i>
                </button>
            </div>

            <p class="mt-2 text-md text-gray-500 ">
                이번 생에는 꼭 이루고 싶은 나의 버킷리스트를 작성해보세요.
            </p>

            <form id="bucketlistAdd" name="bucketlistAdd" class="mt-5" method="post"
                  action="/bucketlist/dashboard/addAjax" enctype="multipart/form-data">
                <div>
                    <label for="bucket_title"
                           class="block text-md text-gray-700 capitalize dark:text-gray-200">제목</label>
                    <input placeholder="Vanilla JS 프로젝트 개발하기" type="text" id="bucket_title" name="title"
                           class="block w-full px-3 py-2 mt-2 text-gray-600 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:border-mainGreen3 focus:outline-none focus:ring focus:ring-mainGreen3 focus:ring-opacity-40">
                </div>

                <div class="mt-4">
                    <label for="bucket_category"
                           class="block text-md text-gray-700 capitalize dark:text-gray-200">카테고리</label>
                    <select id="bucket_category" name="category_idx"
                            class="block w-full px-3 py-2 mt-2 text-gray-600 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:border-mainGreen3 focus:outline-none focus:ring focus:ring-mainGreen3 focus:ring-opacity-40">
                        <option value="1">✈️ 여행</option>
                        <option value="2">⛷️ 도전</option>
                        <option value="3">💐 경험</option>
                        <option value="4">⚒️ 기술</option>
                        <option value="5">🎓 교육</option>
                    </select>
                </div>

                <div class="mt-4">
                    <label for="bucket_image" class="block text-md text-gray-700 capitalize dark:text-gray-200">대표
                        이미지</label>
                    <input type="file"
                           class="block w-full px-3 py-2 mt-2 text-gray-600 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:border-mainGreen3 focus:outline-none focus:ring focus:ring-mainGreen3 focus:ring-opacity-40"
                           id="bucket_image" name="imageFormA" accept="image/gif, image/bmp, image/png, image/jpeg">
                </div>

                <div class="flex justify-end mt-6">
                    <button type="button" onclick="addBucketList()"
                            class="px-3 py-2 text-sm tracking-wide text-white capitalize transition-colors duration-200 transform bg-mainGreen2-100 rounded-md hover:bg-mainGreen2-200 focus:outline-none focus:bg-mainGreen2-200 focus:ring focus:ring-mainGreen3 focus:ring-opacity-50">
                        추가
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function addBucketList() {
        var formData = new FormData();
        formData.append('title', $('#bucket_title').val());
        formData.append('category_idx', $('#bucket_category').val());

        console.log(formData.get("title"));
        console.log(formData.get("category_idx"));
        if ($('input[name="imageFormA"]').get(0).files[0] != null) {
            formData.append('imageForm', $('input[name="imageFormA"]').get(0).files[0]);
        }

        if (formData.get("title") == null || formData.get("title") == "" || $('input[name="imageFormA"]').get(0).files[0] == null) {
            alert("모든 입력값을 넣어주세요.");
            return 0;
        }
        $.ajax({
            type: 'POST',
            url: "<c:url value='/bucketlist/dashboard/addAjax'/>",
            processData: false,
            contentType: false,
            enctype: "multipart/form-data",
            data: formData,
            error: function () {

                alert("통신 오류2");
            },
            success: function (bucketItems) {
                $("#bucketList").children().remove();
                var bucketList = "";
                for (var a = 0; a < bucketItems.length; a++) {
                    var category = "";
                    if (bucketItems[a].category_idx == 1)
                        category = "✈️ 여행";
                    else if (bucketItems[a].category_idx == 2)
                        category = "⛷️ 도전";
                    else if (bucketItems[a].category_idx == 3)
                        category = "💐 경험";
                    else if (bucketItems[a].category_idx == 4)
                        category = "⚒️ 기술";
                    else if (bucketItems[a].category_idx == 5)
                        category = "🎓 교육";


                    bucketList += "<div aria-label=\"card " + a + 1 + "\" tabindex=\"0\"" +
                        "class=\"cursor-pointer focus:outline-none mb-6 bg-white p-6 shadow rounded\">" +
                        "<div class=\"flex items-center pb-4\">" +
                        "    <img" +
                        "        src=\"/images/bucketItem/" + bucketItems[a].src + "\"" +
                        "        alt=\"bucketImg\" class=\"w-16 h-16 rounded-full\" />" +
                        "    <div class=\"flex items-start justify-between w-full\">" +
                        "        <div class=\"pl-4 w-full\">";
                        if(bucketItems[a].status) {
                            bucketList +=
                                "            <p tabindex=\"0\" class=\"focus:outline-none text-xl font-medium leading-5 text-gray-400 line-through\">" +
                                "                " + bucketItems[a].title + "</p>";
                        } else {
                            bucketList +=
                                "            <p tabindex=\"0\" class=\"focus:outline-none text-xl font-medium leading-5 text-gray-800\">" +
                                "                " + bucketItems[a].title + "</p>";
                        }
                        bucketList +=
                        "            <p tabindex=\"0\" class=\"focus:outline-none text-sm leading-normal pt-2 text-gray-500\">작성 일자 :" +
                        "                " + bucketItems[a].created_at.substring(0, 10) + "</p>" +
                        "            <div tabindex=\"0\" class=\"focus:outline-none flex flex-wrap justify-between pt-2\">" +
                        "                <div class=\"py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100\">" + category + "" +
                        "                </div>" +
                        "                <div class=\"flex flex-wrap justify-between mt-2 sm:mt-0\">" +
                        "                    <div>" +
                        "                        <div @click=\"editModalOpen =!editModalOpen\" onclick=\"setEdit(" + bucketItems[a].idx + ", '" + bucketItems[a].title + "', " + bucketItems[a].category_idx + ", '" + bucketItems[a].src + "')\"" +
                        "                             class=\"py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100";
                        if(bucketItems[a].status)
                            bucketList += "   hidden   ";
                        bucketList += "\">" +
                            "                            수정" +
                            "                        </div>" +
                            "                    </div>" +
                            "                    <div onclick=\"completed(" + bucketItems[a].idx + ")\" class=\"py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100";
                        if(bucketItems[a].status)
                            bucketList += "   hidden   ";
                        bucketList += "\">" +
                        "                        완료" +
                        "                    </div>" +
                        "                </div>" +
                        "            </div>" +
                        "        </div>" +
                        "        <button aria-label=\"remove\" onclick=\"delBucket(" + bucketItems[a].idx + ", " + bucketItems[a].category_idx + ")\"><i class=\"fa-solid fa-minus\"></i></button>" +
                        "    </div>" +
                        "</div>" +
                        "</div>";
                }

                var active_bucketlist = 0;
                var complete_bucketlist = 0;

                for (var a = 0; a < bucketItems.length; a++) {
                    if (bucketItems[a].status) {
                        complete_bucketlist++;
                    } else {
                        active_bucketlist++;
                    }
                }

                var total_bucketlist = bucketItems.length;
                $("#total_bucketlist").html(total_bucketlist);
                $("#active_bucketlist").html(active_bucketlist);
                $("#complete_bucketlist").html(complete_bucketlist);

                $("#bucketList").html(bucketList);
                document.getElementById("close_modalA").click();
            }
        });

    }
</script>
