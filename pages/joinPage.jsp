<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/joinStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>회원가입</title>
</head>
<body>
    <img id="mainLogo" src="../imgs/stageus_logo_white.png">
    <form id="valueContainer">
        <div class="inputContainer">
            <div id="inputAlarmLabel">
                <div class="inputLabel">아이디</div>
                <div class="possible">사용 가능한 아이디입니다.</div>
                <div class="impossible hidden">사용 불가능한 아이디입니다.</div>
            </div>
            <input class="inputBox" type="text" placeholder="최대 10자 내로 입력하세요" maxlength="10" required>
            <button id="duplicateIDCheckBtn">중복확인</button>

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" type="password" maxlength="20" required>
            <img id="visiblePW" class="visibility" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="inputAlarmLabel">
                <div class="inputLabel">비밀번호 재입력</div>
                <div class="impossible">비밀번호가 일치하지 않습니다.</div>
            </div>
            <input id="pwInputBox" class="inputBox" type="password" maxlength="20" required>
            <img id="visibleSecondPW" class="visibility"  src="../imgs/visibility.svg">
            <img id="nonVisibleSecondPW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input class="inputBox" type="text" maxlength="10" required>
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
            <input class="inputBox" type="tel" maxlength="11" required>

            <!-- 회원가입 버튼 -->
            <input id="enterBtn" value="회원가입" type="submit">

            <div id="extraFunctions">
                <a href="../index.jsp">로그인하러 가기</a>
            </div>
        </div>
    </form>
</body>
</html>