import { $ } from "./utils/dom.js";

const content = {
  travel: [
    "세계 여행 하기",
    "디즈니 월드에서 퍼레이드 보기",
    "타임스퀘어 가기",
    "홋카이도 온천에 발 담구기",
    "에펠탑 앞에서 사진찍기",
    "융프라우에서 라면 먹기",
    "경주 첨성대 구경하기",
    "다른 나라의 공휴일 즐기기",
    "배낭 여행 가기",
  ],
  challenge: [
    "1년동안 다이어리 꾸준히 쓰기",
    "바디 프로필 찍기",
    "기술 블로그 시작하기",
    "매일 물 2L 마시기",
    "매일 영양제 챙겨먹기",
    "1억 모으기",
    "내 집 마련하기",
    "스쿠버 다이빙 자격증 따기",
    "패러글라이딩 하기",

    "길거리 공연하기",
  ],
  exprience: [
    "은하수 보기",
    "별똥별에 소원 빌기",
    "프로젝트 수상하기",
    "기립박수 받기",
    "싸이 흠뻑쇼 참여",
    "노을지는 곳에서 프러포즈 받기",
    "애견 보호소 봉사",
    "내 손글씨로 글꼴 만들기",
    "YouTube 채널 시작하기",
    "웹사이트 디자인하기",
    "어린 시절 사진 재현하기",
    "나무 위에 집짓기",
    "미래의 나에게 편지 쓰기",
  ],
  skill: [
    "피겨 스케이팅 배우기",
    "커피 내리는 법 배우기",
    "스키, 보드 타는 법 배우기",
    "서핑 배우기",
    "도자기 만드는 법 배우기",
    "새로운 언어 배우기",
    "동영상 편집 방법 배우기",
    "포토샵 배우기",
    "자동차 운전 방법 배우기",
    "악기로 노래 연주하는 법 배우기",
    "텐트 치는 법 배우기",
  ],
  education: [
    "국비지원 교육 받기",
    "대학 학위 따기",
    "자격증 따기",
    "스터디 참여하기",
    "북클럽 가입하기",
  ],
};

let currentCategory = "travel";

const render = () => {
  const template = content[currentCategory]
    .map((item, index) => {
      return `<div id="${index}" class="keyword">${item}</div>`;
    })
    .join("");
  $("#category-content").innerHTML = template;
};

const changeCategory = (e) => {
  const isCategoryButton = e.target.classList.contains("category-name");
  if (isCategoryButton) {
    const categoryName = e.target.dataset.categoryName;
    currentCategory = categoryName;
  }
  render();
};

const copyToClipBoard = (e) => {
  const isKeyword = e.target.classList.contains("keyword");
  if (isKeyword) {
    const keyword = e.target.innerText;
    navigator.clipboard.writeText(keyword);
    alert("클립보드에 복사되었습니다.");
  }
};

render();
$("#category-content").addEventListener("click", copyToClipBoard);
$("#search-category").addEventListener("click", changeCategory);
