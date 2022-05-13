import { A$, $ } from "./utils/dom.js";

// 상위 체크박스 선택 시, 하위 체크박스를 모두 선택한다.
const checkAll = () => {
  const superCheckBox = $("#member-agree-all");
  const checkBoxes = A$('input[type="checkbox"]');
  checkBoxes.forEach((checkbox) => {
    checkbox.checked = superCheckBox.checked;
  });
};

// 하위 체크 박스 선택 여부에 따라 상위 체크 박스를 선택한다.
const checkSelect = () => {
  const superCheckBox = $("#member-agree-all");
  const checkBoxes = A$('input[name="agree"]');
  const checkedBox = A$('input[name="agree"]:checked');

  superCheckBox.checked = checkBoxes.length === checkedBox.length;
};

$("#member-agree-all").addEventListener("click", checkAll);
A$("#member-agree-select > input:nth-child(n+2)").forEach((element) =>
  element.addEventListener("click", checkSelect)
);
