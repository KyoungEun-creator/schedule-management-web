<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

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
            <input id="pwInputBox" class="inputBox" type="password" placeholder="최대 20자 내로 입력하세요" maxlength="20" required>
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
    <!-- html이 자체적으로 제공하는 type 쓰는 게 아니라 이벤트 함수 하나 거쳐서 예외처리 하고 onchange 이벤트로 예외처리 만족하고 잇는지 계속 체크해. 
    required 없애고 js로 이벤트 함수로 점처리 하고 form 보내는 거 해보기 
    createElement로 
    계정부분 백엔드 연결
    -->
    <script>
        alert("아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.")
    </script>
</body>