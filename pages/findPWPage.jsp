<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/indexStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="stylesheet" href="../styles/templateStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>비밀번호 찾기</title>
</head>
<body>
    <img id="mainLogo" src="../imgs/stageus_logo_white.png">
    <form id="valueContainer" onsubmit="return regexCheck(event)">
        <div class="inputContainer">
            <div class="inputLabel">아이디</div>
            <input id="idInputBox" class="inputBox" name="id_value" type="text" placeholder="최대 15자 내로 입력하세요" maxlength="15">

            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" name="tel_value" type="tel" placeholder="' - '는 생략해주세요" maxlength="11">
            
            <!-- 비밀번호 찾기 버튼 -->
            <input id="enterBtn" value="비밀번호 찾기" type="submit">
        </div>
    </form>

    <script>
        // 정규식 
        var idRegex = /^[a-zA-Z0-9]+$/;
        var pwRegex = /^[a-zA-Z0-9*!~^]+$/;
        var nameRegex = /^[ㄱ-ㅎ가-힣]+$/;
        var telRegex = /^\d+$/;

        function regexCheck(e) {
            e.preventDefault();

            var idInput = document.getElementById("idInputBox");
            var idInputValue = document.getElementById("idInputBox").value;
            var telInput = document.getElementById("telInputBox");
            var telInputValue = document.getElementById("telInputBox").value;

            if (!idRegex.test(idInputValue)) {
                alert("영어, 숫자로 이루어진 아이디를 입력해주세요.");
                idInput.value = "";
                return false;
            if (!telRegex.test(telInputValue)) {
                alert("' - '를 제외한 숫자만 입력해주세요.");
                telInput.value = "";
                return false;
            }
            // 모든 유효성 검사 통과 시 폼 제출
            document.getElementById("valueContainer").submit();
        }
    }
    </script>
</body>