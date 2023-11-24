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
    <form id="valueContainer">
        <div class="inputContainer">
            <div class="inputLabel">아이디</div>
            <input class="inputBox" type="text" placeholder="최대 10자 내로 입력하세요" maxlength="10" required>

            <div class="inputLabel">전화번호</div>
            <input class="inputBox" type="tel" placeholder="' - '는 생략해주세요" maxlength="11" required>
            
            <!-- 비밀번호 찾기 버튼 -->
            <input id="enterBtn" value="비밀번호 찾기" type="submit">
        </div>
    </form>
</body>
</html>