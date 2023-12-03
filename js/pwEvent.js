var visiblePW = document.getElementById("visiblePW");
var nonVisiblePW = document.getElementById("nonVisiblePW");
var visibleSecondPW = document.getElementById("visibleSecondPW");
var nonVisibleSecondPW = document.getElementById("nonVisibleSecondPW");
var pwInputBox = document.getElementById("pwInputBox");
var pwSecondInputBox = document.getElementById("pwSecondInputBox");

// ---------- 비밀번호 보임/숨김 기능 ----------

// 비밀번호 입력칸
function openPWEvent() {
    if (pwInputBox.type === "password") {
        visiblePW.classList.add("hidden");
        nonVisiblePW.classList.remove("hidden");
        pwInputBox.type = "text"
    }
}
function closePWEvent() {
    if (pwInputBox.type === "text") {
        nonVisiblePW.classList.add("hidden");
        visiblePW.classList.remove("hidden");
        pwInputBox.type = "password"
    }
}
// 비밀번호 재입력칸
function openSecondPWEvent() {
    if (pwSecondInputBox.type === "password") {
        visibleSecondPW.classList.add("hidden");
        nonVisibleSecondPW.classList.remove("hidden");
        pwSecondInputBox.type = "text"
    }
}
function closeSecondPWEvent() {
    if (pwSecondInputBox.type === "text") {
        nonVisibleSecondPW.classList.add("hidden");
        visibleSecondPW.classList.remove("hidden");
        pwSecondInputBox.type = "password"
    }
}

visiblePW.addEventListener("click", openPWEvent);
nonVisiblePW.addEventListener("click", closePWEvent);

visibleSecondPW.addEventListener("click", openSecondPWEvent);
nonVisibleSecondPW.addEventListener("click", closeSecondPWEvent);


// ---------- 비밀번호 재확인 기능 ----------

// pwInputBox과 pwSecondInputBox에 입력받은 값이 서로 다르면 impossiblePWMessage 보임, 같으면 안 보이고 더이상 입력 불가능
function checkPasswordMatchEvent() {
    var password = pwInputBox.value;
    var secondPassword = pwSecondInputBox.value;
    var impossiblePWMessage = document.getElementById("impossiblePWMessage");

    if (password != secondPassword) {
        impossiblePWMessage.classList.remove("hidden");
    } else {
        impossiblePWMessage.classList.add("hidden");
        pwInputBox.setAttribute("disabled", "disabled");
        pwSecondInputBox.setAttribute("disabled", "disabled");
    }
}

pwSecondInputBox.addEventListener("input", checkPasswordMatchEvent);
