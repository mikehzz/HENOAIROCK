	    const categories = document.querySelectorAll(".category");
    let currentIndex = 0;

    function showCategory(index) {
      categories.forEach((category, i) => {
        if (i === index) {
          category.style.display = "block";
        } else {
          category.style.display = "none";
        }
      });
    }

    function showNextCategory() {
      currentIndex = (currentIndex + 1) % categories.length;
      showCategory(currentIndex);
    }

    function showPrevCategory() {
      currentIndex = (currentIndex - 1 + categories.length) % categories.length;
      showCategory(currentIndex);
    }

    document.addEventListener("DOMContentLoaded", function () {
      showCategory(currentIndex);

      const prevButton = document.getElementById("prev-btn");
      const nextButton = document.getElementById("next-btn");

      prevButton.addEventListener("click", showPrevCategory);
      nextButton.addEventListener("click", showNextCategory);
    });
	
    const viewboxBtn = document.querySelector('.viewbox-btn');
    const viewboxContent = document.querySelector('.viewbox-content');
    const viewboxCloseBtn = document.querySelector('.viewbox-close-btn');

    viewboxBtn.addEventListener('click', () => {
        viewboxContent.classList.add('active');
    });

    viewboxCloseBtn.addEventListener('click', () => {
        viewboxContent.classList.remove('active');
    });

    window.addEventListener('scroll', () => {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        viewboxContent.style.top = `${scrollTop + 20}px`;
    });
    
 // JavaScript 코드

 // 감정 스테이션 탭 요소들을 선택합니다.
 const emotionTabs = document.querySelectorAll('.emotion-tab');

 // 추천 음악을 표시하는 요소를 선택합니다.
 const recommendedContent = document.querySelector('.recommended-content');

 // 감정 스테이션 탭 클릭 이벤트 핸들러를 추가합니다.
 emotionTabs.forEach((tab) => {
     tab.addEventListener('click', () => {
         // 모든 감정 스테이션 탭에서 'active' 클래스를 제거합니다.
         emotionTabs.forEach((tab) => tab.classList.remove('active'));

         // 클릭한 탭에 'active' 클래스를 추가합니다.
         tab.classList.add('active');

         // 선택된 감정을 가져옵니다.
         const selectedEmotion = tab.getAttribute('data-emotion');

         // 선택된 감정에 따라 추천 음악을 업데이트합니다.
         updateRecommendedContent(selectedEmotion);
     });
 });

 // 추천 음악을 업데이트하는 함수
 function updateRecommendedContent(emotion) {
     // 선택된 감정에 맞는 음악을 가져와서 추천 음악 영역에 표시합니다.
     const songs = getRecommendedSongsByEmotion(emotion); // 선택된 감정에 맞는 음악 데이터를 가져오는 함수 (사용자 정의)

     // 추천 음악을 초기화합니다.
     recommendedContent.innerHTML = '';

     // 추천 음악을 하나씩 생성하여 표시합니다.
     songs.forEach((song) => {
         const songElement = createSongElement(song); // 음악 요소를 생성하는 함수 (사용자 정의)
         recommendedContent.appendChild(songElement);
     });
 }

 // 선택된 감정에 따라 추천 음악 데이터를 가져오는 함수 (예시)
 function getRecommendedSongsByEmotion(emotion) {
     // 여기에서 해당 감정에 맞는 음악 데이터를 가져와 반환합니다.
     // 예를 들어, API 요청 또는 미리 정의된 데이터를 사용할 수 있습니다.
     // 반환되는 데이터는 선택된 감정에 따라 다를 수 있습니다.
     // 이 예시에서는 미리 정의된 데이터를 사용하도록 가정합니다.
     switch (emotion) {
         case '신나요':
             return [
                 { title: '신나는 노래 1', artist: '아티스트 1', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '신나는 노래 2', artist: '아티스트 2', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '신나는 노래 2', artist: '아티스트 2', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 신나는 노래 데이터
             ];
         case '편안해요':
             return [
                 { title: '편안한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '편안한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         case '행복해요':
             return [
                 { title: '행복한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '행복한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         case '불안해요':
             return [
                 { title: '편안한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '편안한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         case '졸려요':
             return [
                 { title: '편안한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '편안한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         case '설레요':
             return [
                 { title: '편안한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '편안한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         case '그리워요':
             return [
                 { title: '편안한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '편안한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         case '슬퍼요':
             return [
                 { title: '편안한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '편안한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         case '싱숭생숭':
             return [
                 { title: '편안한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '편안한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         case '화나요':
             return [
                 { title: '편안한 노래 1', artist: '아티스트 3', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 { title: '편안한 노래 2', artist: '아티스트 4', image: 'https://img2.sbs.co.kr/img/sbs_cms/WE/2022/10/24/dxi1666572900771.jpg' },
                 // 추가적인 편안한 노래 데이터
             ];
         default:
             return [];
     }
 }

 // 음악 요소를 생성하는 함수 (예시)
 function createSongElement(song) {
     const songElement = document.createElement('div');
     songElement.classList.add('song');

     const imageElement = document.createElement('img');
     imageElement.src = song.image;
     imageElement.alt = `${song.title} 이미지`;
     songElement.appendChild(imageElement);

     const titleElement = document.createElement('h3');
     titleElement.textContent = song.title;
     songElement.appendChild(titleElement);

     const artistElement = document.createElement('p');
     artistElement.textContent = song.artist;
     songElement.appendChild(artistElement);

     return songElement;
 }

 // 초기 로드 시 '신나요' 감정에 따른 추천 음악을 표시합니다.
 updateRecommendedContent('신나요');
