function isIdCorrect(idInputValue) {
    var idRegex = /^[a-zA-Z0-9]{3,15}$/;
    if (!idRegex.test(idInputValue)) {
        return false;
    }
    return true;
}
function isPwCorrect(pwInputValue) {
    var pwRegex = /^[a-zA-Z0-9*!~^]{3,20}$/;
    if (!pwRegex.test(pwInputValue)) {
        return false;
    }
    return true;
}
function isSecondPwCorrect(pwInputValue, pwSecondInputValue) {
    if (pwInputValue !== pwSecondInputValue) {
        return false;
    }
    return true;
}
function isNameCorrect(nameInputValue) {
    var nameRegex = /^[ㄱ-ㅎ가-힣]{2,5}$/;
    if (!nameRegex.test(nameInputValue)) {
        return false;
    }
    return true;
}
function isTelCorrect(telInputValue) {
    var telRegex = /^\d{9,11}$/;
    if (!telRegex.test(telInputValue)) {
        return false;
    }
    return true;
}