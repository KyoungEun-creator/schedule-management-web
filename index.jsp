<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../week9/styles/indexStyle.css">
    <link rel="icon" href="../week9/imgs/stageus.png">
    <title>로그인</title>
</head>
<body>
    <img id="mainLogo" src="../week9/imgs/stageus_logo_white.png">
    <form id="valueContainer">
        <div class="inputContainer">
            <div class="inputLabel">아이디</div>
            <input class="inputBox" type="text" placeholder="최대 10자 내로 입력하세요" maxlength="10" required> 

            <div class="inputLabel">비밀번호</div>
            <input class="inputBox" type="password" maxlength="20" required>
            <img id="visiblePW" class="visibility" src="../week9/imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibility active" src="../imgs/visibility_off.svg">

            
            <!-- 로그인 버튼 -->
            <input id="enterBtn" value="로그인" type="submit">

            <div id="extraFunctions">
                <a href="../week9/pages/joinPage.jsp">계정이 없으세요? 회원가입</a>
                <a href="../week9/pages/findIDPage.jsp">아이디 찾기</a>
                <a href="../week9/pages/findPWPage.jsp">비밀번호 찾기</a>
            </div>
        </div>
    </form>
</body>
</html>