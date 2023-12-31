<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/indexStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="stylesheet" href="../styles/templateStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>아이디 찾기</title>
</head>
<body>
    <img id="mainLogo" src="../imgs/stageus_logo_white.png">
    <form id="valueContainer" action="../actions/findIDAction.jsp">
        <div class="inputContainer">
            <div class="inputLabel">이름</div>
            <input id="nameInputBox" class="inputBox" name="name_value" type="text" maxlength="10">

            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" name="tel_value" type="tel" placeholder="' - '는 생략해주세요" maxlength="11">
            
            <!-- 아이디 찾기 버튼 -->
            <input id="enterBtn" value="아이디 찾기" type="button" onclick="findIdEvent()"> 
        </div>
    </form>

    <script src="../js/regexTest.js"></script>
    <script>
        function findIdEvent () {
            var nameInputBox = document.getElementById("nameInputBox");
            var nameInputValue = document.getElementById("nameInputBox").value;
            var telInputBox = document.getElementById("telInputBox");
            var telInputValue = document.getElementById("telInputBox").value;

            if (nameInputValue === "" || telInputValue === "") {
                alert("값을 모두 입력해주세요")
            }
            else if (!isNameCorrect(nameInputValue)) {
                alert("한국어 본명을 입력해주세요.");
                nameInputBox.value = "";
            }
            else if (!isTelCorrect(telInputValue)) {
                alert("' - '를 제외한 숫자만 입력해주세요.");
                telInputBox.value = "";
            }
            else {
                document.getElementById("valueContainer").submit();
            }
        }    
    </script>
</body>