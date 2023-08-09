<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>${musicDetail.title}</title>
</head>
 <style>
        /* 여기에 추가적인 스타일링을 적용할 수 있습니다 */
        .lyrics-box {
            display: none;
        }
    </style>
    <script>
        function toggleLyrics() {
            var lyricsBox = document.getElementById("lyricsBox");
            if (lyricsBox.style.display === "none") {
                lyricsBox.style.display = "block";
            } else {
                lyricsBox.style.display = "none";
            }
        }
    </script>
</head>
    <style>
        /* 여기에 추가적인 스타일링을 적용할 수 있습니다 */
        .lyrics-box {
            display: none;
        }
    </style>
    <script>
        function toggleLyrics() {
            var lyricsBox = document.getElementById("lyricsBox");
            if (lyricsBox.style.display === "none") {
                lyricsBox.style.display = "block";
            } else {
                lyricsBox.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div class="container my-3">
        <h2 class="border-bottom py-2">${musicDetail.title}</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <img class="album-cover" src="${musicDetail.albumPath}" alt="앨범 커버">
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <p>곡명: ${musicDetail.title}</p>
                    <p>아티스트: ${musicDetail.artist}</p>
                    <p>장르: ${musicDetail.genre}</p>
                    <!-- 추가 정보를 여기에 추가하세요 -->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-primary my-1" onclick="toggleLyrics()">가사 펼치기</button>
                <div class="lyrics-box" id="lyricsBox">
                    <h3>가사</h3>
                    <div>
                       <p>${musicDetail.lyrics.replace("\n", "</p><p>")}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

</html>