<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/joinStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="stylesheet" href="../styles/templateStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>내 정보 수정하기</title>
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
            <input class="inputBox" type="text" placeholder="최대 15자 내로 입력하세요" maxlength="15" required>
            <button id="duplicateIDCheckBtn">중복확인</button>

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20" required>
            <img id="visiblePW" class="visibility" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="inputAlarmLabel">
                <div class="inputLabel">비밀번호 재입력</div>
                <div id="impossiblePWMessage" class="impossible hidden">비밀번호가 일치하지 않습니다.</div>
            </div>
            <input id="pwSecondInputBox" class="inputBox" type="password" placeholder="최대 20자 내로 입력하세요" maxlength="20" required>
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
            <input class="inputBox" type="tel" placeholder="' - '는 생략해주세요" maxlength="11" required>

            <!-- 수정하기 버튼 -->
            <input id="enterBtn" value="수정하기" type="submit">
        </div>
    </form>

    <script src="../js/pwEvent.js"></script>
</body>