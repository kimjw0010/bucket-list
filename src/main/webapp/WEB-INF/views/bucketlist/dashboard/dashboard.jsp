<%-- Created by IntelliJ IDEA. User: Mihyun Lee Date: 2022-05-23 Time: 오후 8:39 To change this template use File |
    Settings | File Templates. --%>
<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../header.jsp" %>
<main>
    <div class="flex flex-wrap justify-center max-h-screen mx-20">
        <div class="w-full lg:w-1/4">
            <aside>
                <div class="container flex flex-wrap items-center ">
                    <div class="w-full mt-44 bg-white shadow-lg transform duration-200 ease-in-out">
                        <div class="flex justify-center px-5 -mt-20">
                            <div>
                                <%
                                    Member member = (Member)session.getAttribute("member");
                                    String profile = "";
                                    if(member.getSrc().isEmpty()){
                                        String first_name = member.getName().substring(0,1).toUpperCase();
                                        profile = "https://ui-avatars.com/api/?name=" + first_name + "&color=7F9CF5&background=EBF4FF";
                                    } else {
                                        profile = "/images/member/" + member.getSrc();
                                    }
                                %>
                                <img class="w-44 h-44 object-cover bg-white rounded-full shadow-xl"
                                     src="<%=profile%>" alt="profile" />
                            </div>
                        </div>

                        <div class="w-full px-4 text-center my-10">
                            <div class="text-center px-14">
                                <h2 class="text-gray-800 mt-3 text-3xl font-bold"><%=member.getName()%></h2>
                                <p class="text-gray-400 mt-3"><%=member.getEmail()%></p>
                                <p class="text-gray-600 mt-3 mb-16">
                                    <c:choose>
                                        <c:when test="${member.info == null}">
                                            아무리 가까운 길이라도 가지 않으면 도달하지 못하고 아무리 쉬운
                                            일이라도 하지 않으면 이루지 못한다.
                                        </c:when>
                                        <c:otherwise>
                                            ${member.info}
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                            <div class="p-3 text-center">
                  <span class="mb-3 text-4xl font-bold block tracking-wide text-gray-600" id="total_bucketlist">
                    ${bucketItems.size()}
                  </span>
                                <span class="mb-3 text-lg block text-gray-400">Totals your Bucket List</span>
                            </div>
                            <div class="flex justify-center py-4 lg:pt-4 pt-8">
                                <div class="mr-2 p-3 text-center">
                    <span class="text-xl font-bold block tracking-wide text-gray-600" id="active_bucketlist">
                      ${active_bucketlist}
                    </span>
                                    <span class="text-sm text-red-400">Activated</span>
                                </div>
                                <div class="p-3 text-center">
                    <span class="text-xl font-bold block tracking-wide text-gray-600" id="complete_bucketlist">
                      ${complete_bucketlist}
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
                    <button data-category-name="all" onclick="categoryList(0)"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        🗒️ 전체
                    </button>
                    <button data-category-name="travel" onclick="categoryList(1)"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        ✈️ 여행
                    </button>
                    <button data-category-name="challenge" onclick="categoryList(2)"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        ⛷️ 도전
                    </button>
                    <button data-category-name="exprience" onclick="categoryList(3)"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        💐 경험
                    </button>
                    <button data-category-name="skill" onclick="categoryList(4)"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        ⚒️ 기술
                    </button>
                    <button data-category-name="education" onclick="categoryList(5)"
                            class="btn bg-white focus:text-white focus:bg-mainGreen3 shadow mx-4 mt-2">
                        🎓 교육
                    </button>
                </nav>
                <div class="flex flex-col flex-grow items-center bg-white mt-10 mx-10 py-4 shadow-lg">
                    <div x-data="{ modalOpen: false }" class="w-1/2">
                        <button @click="modalOpen =!modalOpen" onclick="resetAdd()"
                                class="w-full p-2 rounded-lg transition-colors duration-200 transform bg-mainGreen2-100 hover:bg-mainGreen2-200 text-white">
                            <i class="fa-solid fa-plus"></i>
                            새로운 버킷 리스트 추가하기
                        </button>
                        <%@include file="../modal/addModal.jsp" %>
                    </div>
                    <div aria-label="group of cards" tabindex="0" class="focus:outline-none px-4 pt-7 w-full" x-data="{ editModalOpen: false }">
                        <div class="w-full" id="bucketList">
                            <c:forEach var="bucketItem" items="${bucketItems}">
                            <div aria-label="card 1" tabindex="0"
                                 class="cursor-pointer focus:outline-none mb-6 bg-white p-6 shadow rounded">
                                <div class="flex items-center pb-4">
                                    <img
                                            src="/images/bucketItem/${bucketItem.src}"
                                            alt="bucketImg" class="w-16 h-16 rounded-full" />
                                    <div class="flex items-start justify-between w-full">
                                        <div class="pl-4 w-full">
                                            <p tabindex="0" class="focus:outline-none text-xl font-medium leading-5 text-gray-800">
                                                ${bucketItem.title}</p>
                                            <p tabindex="0" class="focus:outline-none text-sm leading-normal pt-2 text-gray-500">작성 일자 :
                                                ${bucketItem.created_at.substring(0,10)}</p>
                                            <div tabindex="0" class="focus:outline-none flex flex-wrap justify-between pt-2">
                                                <c:if test="${bucketItem.category_idx == 1}">
                                                    <div class="py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">✈️ 여행
                                                    </div>
                                                </c:if>
                                                <c:if test="${bucketItem.category_idx == 2}">
                                                    <div class="py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">⛷️ 도전
                                                    </div>
                                                </c:if>
                                                <c:if test="${bucketItem.category_idx == 3}">
                                                    <div class="py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">💐 경험
                                                    </div>
                                                </c:if>
                                                <c:if test="${bucketItem.category_idx == 4}">
                                                    <div class="py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">⚒️ 기술
                                                    </div>
                                                </c:if>
                                                <c:if test="${bucketItem.category_idx == 5}">
                                                    <div class="py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">🎓 교육
                                                    </div>
                                                </c:if>

                                                <div class="flex flex-wrap justify-between mt-2 sm:mt-0">
                                                    <c:if test="${bucketItem.status}">
                                                        <div>
                                                            <div @click="editModalOpen =!editModalOpen" onclick="setEdit(${bucketItem.idx}, '${bucketItem.title}',${bucketItem.category_idx},'${bucketItem.src}')"
                                                                 class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100 hidden">
                                                                수정
                                                            </div>
                                                        </div>
                                                        <div onclick="completed(${bucketItem.idx})" class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100 hidden">
                                                            완료
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${!bucketItem.status}">
                                                        <div>
                                                            <div @click="editModalOpen =!editModalOpen" onclick="setEdit(${bucketItem.idx}, '${bucketItem.title}',${bucketItem.category_idx},'${bucketItem.src}')"
                                                                 class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                                수정
                                                            </div>
                                                        </div>
                                                        <div onclick="completed(${bucketItem.idx})" class="py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100">
                                                            완료
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <button aria-label="remove" onclick="delBucket(${bucketItem.idx}, ${bucketItem.category_idx})"><i class="fa-solid fa-minus"></i></button>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        <%@include file="../modal/editModal.jsp" %>
                    </div>
                </div>
            </section>
        </div>
    </div>
</main>
<script type="module" src="<c:url value="/js/searchCategory.js"/>"></script>
<script>
    function resetAdd() {
        document.getElementById("bucket_title").value = "";
        document.getElementById("bucket_category").value = 1;
        document.getElementById("bucket_image").value = "";
    }

    function setEdit(idx, title, category_idx, src) {
        document.getElementById("bucket-idx").value = idx
        document.getElementById("bucket-title").value = title
        document.getElementById("bucket-category").value = category_idx;
        document.getElementById("bucket-src").value = src;
    }

    function completed(idx) {
        if (window.confirm("버킷리스트를 완료하시겠습니까?")) {
            var formData = new FormData();
            formData.append('idx', idx);

            $.ajax({
                type:'POST',
                url : "<c:url value='/bucketlist/dashboard/completeAjax'/>",
                processData:false,
                contentType: false,
                data: formData,
                error: function(){
                    alert("통신 오류");
                },
                success : function(bucketItems){

                    $("#bucketList").children().remove();
                    var bucketList = "";
                    for (var a = 0; a < bucketItems.length; a++) {
                        var category = "";
                        if(bucketItems[a].category_idx == 1)
                            category = "✈️ 여행";
                        else if(bucketItems[a].category_idx == 2)
                            category = "⛷️ 도전";
                        else if(bucketItems[a].category_idx == 3)
                            category = "💐 경험";
                        else if(bucketItems[a].category_idx == 4)
                            category = "⚒️ 기술";
                        else if(bucketItems[a].category_idx == 5)
                            category = "🎓 교육";

                        bucketList += "<div aria-label=\"card " + a+1 + "\" tabindex=\"0\"" +
                            "class=\"cursor-pointer focus:outline-none mb-6 bg-white p-6 shadow rounded\">" +
                            "<div class=\"flex items-center pb-4\">" +
                            "    <img" +
                            "        src=\"/images/bucketItem/" + bucketItems[a].src + "\"" +
                            "        alt=\"bucketImg\" class=\"w-16 h-16 rounded-full\" />" +
                            "    <div class=\"flex items-start justify-between w-full\">" +
                            "        <div class=\"pl-4 w-full\">" +
                            "            <p tabindex=\"0\" class=\"focus:outline-none text-xl font-medium leading-5 text-gray-800\">" +
                            "                " + bucketItems[a].title + "</p>" +
                            "            <p tabindex=\"0\" class=\"focus:outline-none text-sm leading-normal pt-2 text-gray-500\">작성 일자 :" +
                            "                " + bucketItems[a].created_at.substring(0,10) + "</p>" +
                            "            <div tabindex=\"0\" class=\"focus:outline-none flex flex-wrap justify-between pt-2\">" +
                            "                <div class=\"py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100\">" + category + "" +
                            "                </div>" +
                            "                <div class=\"flex flex-wrap justify-between mt-2 sm:mt-0\">" +
                            "                    <div>" +
                            "                        <div @click=\"editModalOpen =!editModalOpen\" onclick=\"setEdit(" + bucketItems[a].idx + ", '" + bucketItems[a].title + "', " + bucketItems[a].category_idx + ", '" + bucketItems[a].src + "')\"" +
                            "                             class=\"py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100 ";
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
                    document.getElementById("close_modalE").click();
                }
            });
        }
    }

    function categoryList(idx) {
        var formData = new FormData();
        formData.append('category_idx', idx);

        $.ajax({
            type:'POST',
            url : "<c:url value='/bucketlist/dashboard/categoryListAjax'/>",
            processData:false,
            contentType: false,
            data: formData,
            error: function(){
                alert("통신 오류");
            },
            success : function(bucketItems){

                $("#bucketList").children().remove();
                var bucketList = "";
                for (var a = 0; a < bucketItems.length; a++) {
                    var category = "";
                    if(bucketItems[a].category_idx == 1)
                        category = "✈️ 여행";
                    else if(bucketItems[a].category_idx == 2)
                        category = "⛷️ 도전";
                    else if(bucketItems[a].category_idx == 3)
                        category = "💐 경험";
                    else if(bucketItems[a].category_idx == 4)
                        category = "⚒️ 기술";
                    else if(bucketItems[a].category_idx == 5)
                        category = "🎓 교육";

                    bucketList += "<div aria-label=\"card " + a+1 + "\" tabindex=\"0\"" +
                        "class=\"cursor-pointer focus:outline-none mb-6 bg-white p-6 shadow rounded\">" +
                        "<div class=\"flex items-center pb-4\">" +
                        "    <img" +
                        "        src=\"/images/bucketItem/" + bucketItems[a].src + "\"" +
                        "        alt=\"bucketImg\" class=\"w-16 h-16 rounded-full\" />" +
                        "    <div class=\"flex items-start justify-between w-full\">" +
                        "        <div class=\"pl-4 w-full\">" +
                        "            <p tabindex=\"0\" class=\"focus:outline-none text-xl font-medium leading-5 text-gray-800\">" +
                        "                " + bucketItems[a].title + "</p>" +
                        "            <p tabindex=\"0\" class=\"focus:outline-none text-sm leading-normal pt-2 text-gray-500\">작성 일자 :" +
                        "                " + bucketItems[a].created_at.substring(0,10) + "</p>" +
                        "            <div tabindex=\"0\" class=\"focus:outline-none flex flex-wrap justify-between pt-2\">" +
                        "                <div class=\"py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100\">" + category + "" +
                        "                </div>" +
                        "                <div class=\"flex flex-wrap justify-between mt-2 sm:mt-0\">" +
                        "                    <div>" +
                        "                        <div @click=\"editModalOpen =!editModalOpen\" onclick=\"setEdit(" + bucketItems[a].idx + ", '" + bucketItems[a].title + "', " + bucketItems[a].category_idx + ", '" + bucketItems[a].src + "')\"" +
                        "                             class=\"py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100 ";
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

                $("#bucketList").html(bucketList);
                document.getElementById("close_modalE").click();
            }
        });

    }

    function delBucket(idx, category_idx) {
        if (window.confirm("버킷리스트를 삭제하시겠습니까?")) {
            var formData = new FormData();
            formData.append('idx', idx);
            formData.append('category_idx', category_idx);

            $.ajax({
                type: 'POST',
                url: "<c:url value='/bucketlist/dashboard/delAjax'/>",
                processData: false,
                contentType: false,
                data: formData,
                error: function () {
                    alert("통신 오류");
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
                            "        <div class=\"pl-4 w-full\">" +
                            "            <p tabindex=\"0\" class=\"focus:outline-none text-xl font-medium leading-5 text-gray-800\">" +
                            "                " + bucketItems[a].title + "</p>" +
                            "            <p tabindex=\"0\" class=\"focus:outline-none text-sm leading-normal pt-2 text-gray-500\">작성 일자 :" +
                            "                " + bucketItems[a].created_at.substring(0, 10) + "</p>" +
                            "            <div tabindex=\"0\" class=\"focus:outline-none flex flex-wrap justify-between pt-2\">" +
                            "                <div class=\"py-2 px-4 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100\">" + category + "" +
                            "                </div>" +
                            "                <div class=\"flex flex-wrap justify-between mt-2 sm:mt-0\">" +
                            "                    <div>" +
                            "                        <div @click=\"editModalOpen =!editModalOpen\" onclick=\"setEdit(" + bucketItems[a].idx + ", '" + bucketItems[a].title + "', " + bucketItems[a].category_idx + ", '" + bucketItems[a].src + "')\"" +
                            "                             class=\"py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100 ";
                        if (bucketItems[a].status)
                            bucketList += "   hidden   ";
                        bucketList += "\">" +
                            "                            수정" +
                            "                        </div>" +
                            "                    </div>" +
                            "                    <div onclick=\"completed(" + bucketItems[a].idx + ")\" class=\"py-2 px-4 mx-1 text-sm leading-3 text-indigo-700 rounded-full bg-indigo-100";
                        if (bucketItems[a].status)
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
                    document.getElementById("close_modalE").click();
                }
            });
        }
    }
</script>

</body>
</html>