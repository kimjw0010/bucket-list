import { $ } from "./utils/dom.js";

const autoScorll = () => {
  window.scrollTo({ left: 0, top: 100, behavior: "smooth" });
};

window.scroll({ top: 50, left: 0, behavior: "smooth" });

if ($("textarea")) {
  $("textarea").addEventListener("focus", autoScorll);
}

if ($("#arrow_icon") && $("#tour_btn")) {
  $("#arrow_icon").addEventListener("click", () =>
    window.scroll({ top: 800, left: 0, behavior: "smooth" })
  );
  $("#tour_btn").addEventListener("click", () =>
    window.scroll({ top: 50, left: 0, behavior: "smooth" })
  );
}
