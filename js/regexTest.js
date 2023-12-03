// 정규식 
var idRegex = /^[a-zA-Z0-9]{3,15}$/;
var pwRegex = /^[a-zA-Z0-9*!~^]{3,20}$/;
var nameRegex = /^[ㄱ-ㅎ가-힣]{2,5}$/;
var telRegex = /^\d{9,11}$/;

function regexCheck(e) {
    // e.preventDefault();
    
    var idInput = document.getElementById("idInputBox");
    var idInputValue = document.getElementById("idInputBox").value;
    var pwInput = document.getElementById("pwInputBox");
    var pwInputValue = document.getElementById("pwInputBox").value;
    var pwSecondInput = document.getElementById("pwSecondInputBox");
    var pwSecondInputValue = pwSecondInput.value;
    var nameInput = document.getElementById("nameInputBox");
    var nameInputValue = nameInput.value;
    var telInput = document.getElementById("telInputBox");
    var telInputValue = telInput.value;

    if (!idRegex.test(idInputValue)) {
        alert("영어, 숫자로 이루어진 5 이상 15 이하 길이의 아이디를 입력해주세요.");
        idInput.value = "";
        return false;
    }
    if (!pwRegex.test(pwInputValue)) {
        alert("영어, 숫자, 특수기호로 이루어진 10 이상 20 이하 길이의 비밀번호를 입력해주세요.");
        pwInput.value = "";
        return false;
    }
    if (!nameRegex.test(nameInputValue)) {
        alert("한국어 본명을 입력해주세요.");
        nameInput.value = "";
        return false;
    }
    if (!telRegex.test(telInputValue)) {
        alert("' - '를 제외한 숫자만 입력해주세요.");
        telInput.value = "";
        return false;
    }
    // 비밀번호 두 개가 일치하지 않는다면
    if (pwInputValue !== pwSecondInputValue) {
        alert("비밀번호가 일치하지 않습니다.");
        pwInput.value = "";
        pwSecondInput.value = "";
        return false;
    }
    // 모든 유효성 검사 통과 시 폼 제출
    document.getElementById("valueContainer").submit();
}