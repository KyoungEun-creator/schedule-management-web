function testIDRegex(idInput, idInputValue) {
    var idRegex = /^[a-zA-Z0-9]{3,15}$/;
    if (!idRegex.test(idInputValue)) {
        alert("영어, 숫자로 이루어진 3 이상 15 이하 길이의 아이디를 입력해주세요.");
        idInput.value = "";
        return false;
    }
}
function testPWRegex(pwInput, pwInputValue) {
    var pwRegex = /^[a-zA-Z0-9*!~^]{3,20}$/;
    if (!pwRegex.test(pwInputValue)) {
        alert("영어, 숫자, 특수기호로 이루어진 3 이상 20 이하 길이의 비밀번호를 입력해주세요.");
        pwInput.value = "";
        return false;
    }
}
function testSecondPWRegex(pwInput, pwInputValue, pwSecondInput, pwSecondInputValue) {
    if (pwInputValue !== pwSecondInputValue) {
        alert("비밀번호가 일치하지 않습니다.");
        pwInput.value = "";
        pwSecondInput.value = "";
        return false;
    }
}
function testNameRegex(nameInput, nameInputValue) {
    var nameRegex = /^[ㄱ-ㅎ가-힣]{2,5}$/;
    if (!nameRegex.test(nameInputValue)) {
        alert("한국어 본명을 입력해주세요.");
        nameInput.value = "";
        return false;
    }
}
function testTelRegex(telInput, telInputValue) {
    var telRegex = /^\d{9,11}$/;
    if (!telRegex.test(telInputValue)) {
        alert("' - '를 제외한 숫자만 입력해주세요.");
        telInput.value = "";
        return false;
    }
}