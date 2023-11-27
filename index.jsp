<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../week9/styles/indexStyle.css">
    <link rel="stylesheet" href="../week9/styles/commonStyle.css">
    <link rel="stylesheet" href="../week9/styles/templateStyle.css">
    <link rel="icon" href="../week9/imgs/stageus.png">
    <title>로그인</title>
</head>
<body>
    <img id="mainLogo" src="../week9/imgs/stageus_logo_white.png">
    <form id="valueContainer" onsubmit="return regexCheck(event)">
        <div class="inputContainer">
            <div class="inputLabel">아이디</div>
            <input id="idInputBox" class="inputBox" name="userID" onkeyup="idRegexCheck()" placeholder="최대 15자 내로 입력하세요" type="text" maxlength="15"> 

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox"  name="userPW" onkeyup="pwRegexCheck()" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20">
            <img id="visiblePW" class="visibility" src="../week9/imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibility hidden" src="../week9/imgs/visibility_off.svg">

            
            <!-- 로그인 버튼 -->
            <input id="enterBtn" value="로그인" type="submit">

            <div id="extraFunctions">
                <a href="../week9/pages/joinPage.jsp">계정이 없으세요? 회원가입</a>
                <a href="../week9/pages/findIDPage.jsp">아이디 찾기</a>
                <a href="../week9/pages/findPWPage.jsp">비밀번호 찾기</a>
            </div>
        </div>
    </form>

    <script src="../week9/js/pwEvent.js"></script>
    <script>
        //alert("아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.")
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