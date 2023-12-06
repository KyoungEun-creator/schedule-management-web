// 비밀번호 입력칸
function togglePWEvent(visiblePW, nonVisiblePW, pwInputBox) {
    if (pwInputBox.type === "password") {
        visiblePW.classList.add("hidden");
        nonVisiblePW.classList.remove("hidden");
        pwInputBox.type = "text"
    }
    else if (pwInputBox.type === "text") {
        nonVisiblePW.classList.add("hidden");
        visiblePW.classList.remove("hidden");
        pwInputBox.type = "password"
    }
}

// 비밀번호 재입력칸
function toggleSecondPWEvent(visibleSecondPW, nonVisibleSecondPW, pwSecondInputBox) {
    if (pwSecondInputBox.type === "password") {
        visibleSecondPW.classList.add("hidden");
        nonVisibleSecondPW.classList.remove("hidden");
        pwSecondInputBox.type = "text"
    }
    else if (pwSecondInputBox.type === "text") {
        nonVisibleSecondPW.classList.add("hidden");
        visibleSecondPW.classList.remove("hidden");
        pwSecondInputBox.type = "password"
    }
}

// pwInputBox과 pwSecondInputBox에 입력받은 값 동일 여부 확인
function checkPWMatchEvent(password, secondPassword, impossiblePWMessage) {
    if (password != secondPassword) {
        impossiblePWMessage.classList.remove("hidden");
    } else {
        impossiblePWMessage.classList.add("hidden");
    }
}
