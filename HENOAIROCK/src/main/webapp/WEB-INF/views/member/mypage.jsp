<%@page import="com.heno.airock.dto.MusicVO"%>
<%@page import="com.heno.airock.cmn.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/Mypage.css">
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>Insert title here</title>
</head>

<body>
<!-- 제목 및 닉네임 사진 변경  -->
<div id="musicList" class="mw">
  <div class="meta_info">
    <img class="meta_info_img" alt="" src="${outVO3.profileImg}">
  <div class="meta_info_text absolute p-16">

  <!-- 노래 모음 -->
  <article class="horizen_zzz">
  <button class="fs">
  <div id="meta_info" class="ell">
    <p class="meta_info_title ell">${outVO3.nickname}</p>
    <p class="meta_info_title ell">${outVO3.name}</p>
  </div>
   </button>
  </article>
 </div>
</div>

<div class="tab_menu">
    <ul class="tab_list">
      <li class="is_on"><a href="#tab1" class="tab_btn">좋아요</a></li>
      <li><a href="#tab2" class="tab_btn">앨범아트</a></li>
    <div class="button_container">
<!--         <button class="button_class" id="listAddButton">리스트 추가</button>
        <button class="button_class" id="listDelButton">리스트 삭제</button> -->
        <a href="/mypage/list_reg" class="btn button_class" onclick="handleListAddClick()">리스트등록</a>
        <a href="javascript:void(0);" class="btn button_class" onclick="handleListDeleteClick()">리스트삭제</a>
    </div>
    </ul>
  </div>

 <div id="tab1" class="cont_area cont_active">
  <div class="music_list p-16">
  <c:choose>
    <%-- 조회 데이터가 있는 경우--%>
    <c:when test="${not empty list }">
       <c:forEach var="vo" items="${list}">
       <article class="horizen_station cursor">
          <button class="fs music" id="music" name="music">
              <img class="horizen_img station" src="${vo.albumPath }" alt="이미지" style="width: 80px;">
            <div id="meta_info" class="ell">
              <p class="meta_info_title ell">${vo.title}</p>
              <span class="meta_info_desc ell">${vo.artist }</span>
            </div>
           </button>
           <input type="hidden" value="${vo.musicId }" id="musicId" name="musicId">
       </article>
       </c:forEach>
    </c:when>
    <%-- 조회 데이터가 없는 경우--%>
    <c:otherwise>
      <tr>
         <td  class="text-center col-sm-12  col-md-12  col-lg-12" colspan="99">검색결과가 없습니다.</td>
      </tr>
    </c:otherwise>
  </c:choose>
  </div>
 </div>

 <div id="tab2" class="cont_area">
  <div class="music_list p-16">
  <c:choose>
    <%-- 조회 데이터가 있는 경우--%>
    <c:when test="${not empty list2 }">
       <c:forEach var="vo" items="${list2}">
       <article class="horizen_station cursor">
          <button class="fs myListSeq" id="myListSeq" name="myListSeq">
              <img class="horizen_img station" src="${vo.albumImg }" alt="이미지" style="width: 80px;">
            <div id="meta_info" class="ell">
              <p class="meta_info_title ell">${vo.title}</p>
            </div>
           </button>
           <input type="hidden" value="${vo.myListSeq}" id="myListSeq" name="myListSeq">
       </article>
       </c:forEach>
    </c:when>
    <%-- 조회 데이터가 없는 경우--%>
    <c:otherwise>
      <tr>
         <td  class="text-center col-sm-12  col-md-12  col-lg-12" colspan="99">검색결과가 없습니다.</td>
      </tr>
    </c:otherwise>
  </c:choose>
  </div>
 </div>
  
<script>


const tabList = document.querySelectorAll('.tab_menu .tab_list li');
const contents = document.querySelectorAll('.cont_area');
// 초기에 첫 번째 탭 내용을 활성화
contents[0].classList.add('cont_active');
for (var i = 0; i < tabList.length; i++) {
    tabList[i].querySelector('.tab_btn').addEventListener('click', function (e) {
        e.preventDefault();
        for (var j = 0; j < tabList.length; j++) {
            tabList[j].classList.remove('is_on');
            contents[j].classList.remove('cont_active');
        }
        this.parentNode.classList.add('is_on');
        const activeContId = this.getAttribute('href');
        document.querySelector(activeContId).classList.add('cont_active');
    });
}

$(".music").on("click", function (e) {
   let musicId = $(this).siblings("input[type='hidden']").val();
    console.log('musicId:' + musicId);
    // 팝업 창 열기
    let popupUrl = "music/music_detail/?musicId=" + musicId;
    let popupName = "MusicDetailPopup";
    let popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
    window.open(popupUrl, popupName, popupOptions);
});
let isButtonEnabled = true;

$(".myListSeq").on("click", function (e) {
    if (isButtonEnabled) {

    let myListSeq = $(this).siblings("input[type='hidden']").val();
    console.log('myListSeq:' + myListSeq);
    // 팝업 창 열기
    let popupUrl = "http://localhost:8080/mypage/list_detail/?myListSeq=" + myListSeq;
    let popupName = "ListDetailPopup";
    let popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
    window.open(popupUrl, popupName, popupOptions);
    
    }
  });


// 페이지 로드 시 기본적으로 button_class를 숨김
document.addEventListener("DOMContentLoaded", function() {
  hideButtons();
});

// tab1을 클릭하면 button_class를 숨김
document.querySelector('a[href="#tab1"]').addEventListener("click", function() {
  hideButtons();
});

// tab2를 클릭하면 button_class를 보이게 함
document.querySelector('a[href="#tab2"]').addEventListener("click", function() {
  showButtons();
});

// button_class를 숨기는 함수
function hideButtons() {
  var buttons = document.querySelectorAll(".button_class");
  buttons.forEach(function(button) {
    button.style.display = "none";
  });
}

// button_class를 보이게 하는 함수
function showButtons() {
  var buttons = document.querySelectorAll(".button_class");
  buttons.forEach(function(button) {
    button.style.display = "block";
  });
}

function handleListAddClick() {
    console.log("리스트등록을 클릭했습니다.");
    

    
}

function handleListDeleteClick() {
    console.log("리스트삭제를 클릭했습니다.");

    // 삭제할 리스트를 선택하세요 라는 문구 표시
    let confirmDeleteGo = confirm("삭제할 리스트를 선택하세요.");
    
    if (confirmDeleteGo) {
        isButtonEnabled = false;

        // 예를 클릭했을 때, myListSeq 요소 클릭 이벤트 핸들링
        $(document).on("click", ".horizen_station", function () {
            console.log('list click.');
            let myListSeq = $(this).find("input[type='hidden']").val();
            $(".myListSeq").prop("disabled", true);

            // 진짜로 리스트를 삭제하시겠습니까? 문구 표시
            let confirmDelete = confirm("진짜로 리스트를 삭제 하시겠습니까?");
            if (confirmDelete) {
                console.log("리스트를 삭제합니다.");
                $.ajax({
                    type: "POST",
                    url:"/mypage/delCustomList",
                    asyn:"true",
                    dataType:"html",
                    data:{
                      myListSeq: $("#myListSeq").val()
                    },
                    success:function(data){//통신 성공
                        let parsedJson = JSON.parse(data);
                                   
                        if("1" == parsedJson.msgId) {
                            alert(parsedJson.msgContents);
                            
                            location.reload();

                          } else {
                            alert(parsedJson.msgContents);
                          }
                      },
                      error:function(data){//실패시 처리
                        console.log("error:"+data);
                      }
                  });
                // 여기에 실제 삭제 코드를 추가하세요.
            } else {
                alert("취소 되었습니다.");
                location.reload();

            }
        });
    } else {
      alert("취소 되었습니다.")
      location.reload();

    }
    
}


</script>
</body>
</html>