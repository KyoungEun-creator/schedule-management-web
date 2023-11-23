var visiblePW = document.getElementById("visiblePW");
var nonVisiblePW = document.getElementById("nonVisiblePW");
var pwInputBox = document.getElementById("pwInputBox");
var HIDDEN_CLASSNAME = "hidden";

// 비밀번호 보임/숨김 기능
// visiblePW 누르면 visiblePW 사라지고 nonVisiblePW 보임, pwInputBox의 type="password"이 "text"로 바뀜
function openPWEvent() {
    if (pwInputBox.type === "password") {
        visiblePW.classList.add(HIDDEN_CLASSNAME);
        nonVisiblePW.classList.remove(HIDDEN_CLASSNAME);
        pwInputBox.type = "text"
    }
}
// nonVisiblePW 누르면 nonVisiblePW 사라지고 visiblePW 보임, pwInputBox의 type="text"이 "password"로 바뀜
function closePWEvent() {
    if (pwInputBox.type === "text") {
        nonVisiblePW.classList.add(HIDDEN_CLASSNAME);
        visiblePW.classList.remove(HIDDEN_CLASSNAME);
        pwInputBox.type = "password"
    }
}

visiblePW.addEventListener('click', openPWEvent);
nonVisiblePW.addEventListener('click', closePWEvent);


