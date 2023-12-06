// NOTE: 이 함수의 역할은, 단순하 매개변수를 받아서 그게 올바른지 "체크"만 해야 함
function testIDRegex(idInputBox, idInputValue) {
    var idRegex = /^[a-zA-Z0-9]{3,15}$/;

    // if (!idRegex.test(idInputValue)) {
    //     alert("영어, 숫자로 이루어진 3 이상 15 이하 길이의 아이디를 입력해주세요.");
    //     idInputBox.value = "";
    //     return false;
    // }

    // EXAMPLE : 

    if (!idRegex.test(idInputValue)) {
        alert("영어, 숫자로 이루어진 3 이상 15 이하 길이의 아이디를 입력해주세요.");
        idInputBox.value = "";   // NOTE: 이 내용에 JSP 페이지 안으로 들어가야함 ( 예외처리의 후 결과 처리 이기 때문 )
        return false;
    }
    return true;
}
function testPWRegex(pwInputBox, pwInputValue) {
    var pwRegex = /^[a-zA-Z0-9*!~^]{3,20}$/;
    if (!pwRegex.test(pwInputValue)) {
        alert("영어, 숫자, 특수기호로 이루어진 3 이상 20 이하 길이의 비밀번호를 입력해주세요.");
        pwInputBox.value = "";
        return false;
    }
}
function testSecondPWRegex(pwInputBox, pwInputValue, pwSecondInputBox, pwSecondInputValue) {
    if (pwInputValue !== pwSecondInputValue) {
        alert("비밀번호가 일치하지 않습니다.");
        pwInputBox.value = "";
        pwSecondInputBox.value = "";
        return false;
    }
}
function testNameRegex(nameInputBox, nameInputValue) {
    var nameRegex = /^[ㄱ-ㅎ가-힣]{2,5}$/;
    if (!nameRegex.test(nameInputValue)) {
        alert("한국어 본명을 입력해주세요.");
        nameInputBox.value = "";
        return false;
    }
}
function testTelRegex(telInputBox, telInputValue) {
    var telRegex = /^\d{9,11}$/;
    if (!telRegex.test(telInputValue)) {
        alert("' - '를 제외한 숫자만 입력해주세요.");
        telInputBox.value = "";
        return false;
    }
}