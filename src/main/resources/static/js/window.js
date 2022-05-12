import { A$, $ } from "./utils/dom.js";

// 윈도우 사이즈에 따라 nav element margin을 조절한다.
const resizeEvent = () => {
  const responsive = A$(".nav-responsive");
  if (window.innerWidth > 1280) {
    responsive.forEach((element) => element.classList.add("mx-48"));
  } else {
    responsive.forEach((element) => element.classList.remove("mx-48"));
  }
};

window.addEventListener("resize", resizeEvent);
