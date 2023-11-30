<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/indexStyle.css">
    <link rel="stylesheet" href="./styles/commonStyle.css">
    <link rel="stylesheet" href="./styles/templateStyle.css">
    <link rel="icon" href="./imgs/stageus.png">
    <title>로그인</title>
</head>
<body>
    <img id="mainLogo" src="./imgs/stageus_logo_white.png">
    <form id="valueContainer" onsubmit="return regexCheck(event)" action="./actions/loginAction.jsp">
        <div class="inputContainer">
            <div class="inputLabel">아이디</div>
            <input id="idInputBox" class="inputBox" name="id_value" placeholder="최대 15자 내로 입력하세요" type="text" maxlength="15"> 

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" name="pw_value" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20">
            <img id="visiblePW" class="visibility" src="./imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibility hidden" src="./imgs/visibility_off.svg">

            
            <!-- 로그인 버튼 -->
            <input id="enterBtn" value="로그인" type="submit">

            <div id="extraFunctions">
                <a href="./pages/joinPage.jsp">계정이 없으세요? 회원가입</a>
                <a href="./pages/findIDPage.jsp">아이디 찾기</a>
                <a href="./pages/findPWPage.jsp">비밀번호 찾기</a>
            </div>
        </div>
    </form>

    <script src="./js/pwEvent.js"></script>
    <script>
        // 정규식 
        var idRegex = /^[a-zA-Z0-9]+$/;
        var pwRegex = /^[a-zA-Z0-9*!~^]+$/;

        function regexCheck(e) {
            e.preventDefault();
            
            var idInput = document.getElementById("idInputBox");
            var idInputValue = document.getElementById("idInputBox").value;
            var pwInput = document.getElementById("pwInputBox");
            var pwInputValue = document.getElementById("pwInputBox").value;

            if (!idRegex.test(idInputValue)) {
                alert("영어, 숫자로 이루어진 아이디를 입력해주세요.");
                idInput.value = "";
                return false;
            }
            if (!pwRegex.test(pwInputValue)) {
                alert("영어, 숫자, 특수기호로 이루어진 비밀번호를 입력해주세요.");
                pwInput.value = "";
                return false;
            }
            // 모든 유효성 검사 통과 시 폼 제출
            document.getElementById("valueContainer").submit();
        }
    </script>
</body>