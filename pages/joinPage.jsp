<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/joinStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="stylesheet" href="../styles/templateStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>회원가입</title>
</head>
<body>
    <img id="mainLogo" src="../imgs/stageus_logo_white.png">
    <form id="valueContainer">
        <div class="inputContainer">
            <div id="inputAlarmLabel">
                <div class="inputLabel">아이디</div>
                <div id="possibleIDMessage" class="possible">사용 가능한 아이디입니다.</div>
                <div id="impossibleIDMessage" class="impossible hidden">사용 불가능한 아이디입니다.</div>
            </div>
            <input id="idInputBox" class="inputBox" name="userID" onkeyup="idRegexCheck()" placeholder="최대 15자 내로 입력하세요" type="text" maxlength="15">
            <button id="duplicateIDCheckBtn">중복확인</button>

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" name="userPW" onkeyup="pwRegexCheck()" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20">
            <img id="visiblePW" class="visibility" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="inputAlarmLabel">
                <div class="inputLabel">비밀번호 재입력</div>
                <div id="impossiblePWMessage" class="impossible hidden">비밀번호가 일치하지 않습니다.</div>
            </div>
            <input id="pwSecondInputBox" class="inputBox" name="userPWRecheck" onkeyup="pwSecondRegexCheck()" type="password" placeholder="최대 20자 내로 입력하세요" maxlength="20">
            <img id="visibleSecondPW" class="visibility"  src="../imgs/visibility.svg">
            <img id="nonVisibleSecondPW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input id="nameInputBox" class="inputBox" name="userName" onkeyup="nameRegexCheck()" type="text" maxlength="10">
                </div>
                <div class="rowInput">
                    <div class="inputLabel">부서</div>
                    <select class="selectBox"> 
                        <option>서비스 팀</option>
                        <option>디자인 팀</option>
                    </select>
                </div>
                <div class="rowInput"> 
                    <div class="inputLabel">직책</div>
                    <select class="selectBox">
                        <option>팀장</option>
                        <option>팀원</option>
                    </select>
                </div>
            </div>

            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" name="userTelNum" onkeyup="telRegexCheck()" placeholder="' - '는 생략해주세요" type="tel" maxlength="11">

            <!-- 회원가입 버튼 -->
            <input id="enterBtn" value="회원가입" type="submit">

            <div id="extraFunctions">
                <a href="../index.jsp">로그인하러 가기</a>
            </div>
        </div>
    </form>

    <script src="../js/pwEvent.js"></script>
    <!-- 회원가입 예외처리 하고 form.submit 전송하는 거 고치기 -->
    <script>
        // 정규식 
        var idRegex = /^[a-zA-Z0-9]+$/;
        var pwRegex = /^[a-zA-Z0-9*!~^]+$/;
        var nameRegex = /^[가-힣]+$/;
        var telRegex = /^\d+$/;

        function idRegexCheck () {
            var idInput = document.getElementById("idInputBox");
            var idInputValue = document.getElementById("idInputBox").value;
            if (!idRegex.test(idInputValue)) {
                alert("영어와 숫자로만 이루어진 아이디를 입력해주세요.");
                idInput.value = "";
            }
        }
        function pwRegexCheck () {
            var pwInput = document.getElementById("pwInputBox");
            var pwInputValue = document.getElementById("pwInputBox").value;
            if (!pwRegex.test(pwInputValue)) {
                alert("영어, 숫자, 특수기호로만 이루어진 비밀번호를 입력해주세요.");
                pwInput.value = "";
            }
        }
        function pwSecondRegexCheck () {
            var pwSecondInput = document.getElementById("pwSecondInputBox");
            var pwSecondInputValue = document.getElementById("pwSecondInputBox").value;
            if (!pwRegex.test(pwSecondInputValue)) {
                alert("영어, 숫자, 특수기호로만 이루어진 비밀번호를 입력해주세요.")
                pwSecondInput.value = "";
            }
        }
        function nameRegexCheck () {
            var nameInput = document.getElementById("nameInputBox");
            var nameInputValue = document.getElementById("nameInputBox").value;
            if (!nameRegex.test(nameInputValue)) {
                alert("한국어 본명을 입력해주세요.");
                nameInput.value = "";
            }
        } 
        function telRegexCheck () {
            var telInput = document.getElementById("telInputBox");
            var telInputValue = document.getElementById("telInputBox").value;
            if (!telRegex.test(telInputValue)) {
                alert("'-'를 제외한 숫자만 입력해주세요.");
                telInput.value = "";
            }
        }
        
 
    </script>
</body>