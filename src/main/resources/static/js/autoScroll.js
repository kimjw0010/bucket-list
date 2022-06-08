import { A$, $ } from "./utils/dom.js";

const info = $("textarea");

const autoScorll = () => {
  window.scrollTo({ left: 0, top: 100, behavior: "smooth" });
};

info.addEventListener("focus", autoScorll);
