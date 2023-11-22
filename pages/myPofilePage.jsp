<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/joinStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>내 정보 확인하기</title>
</head>
<body>
    <img id="mainLogo" src="../imgs/stageus_logo_white.png">
    <form id="valueContainer">
        <div class="inputContainer">
            <div id="inputAlarmLabel">
                <div class="inputLabel">아이디</div>
                <!-- <div class="possible">사용 가능한 아이디입니다.</div>
                <div class="impossible active">사용 불가능한 아이디입니다.</div> -->
            </div>
            <input class="inputBox" type="text" value="hongkildong" placeholder="최대 10자 내로 입력하세요" maxlength="10" disabled>
            <!-- <button id="duplicateIDCheckBtn">중복확인</button> -->

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" type="password" value="123456" maxlength="20" disabled>
            <img id="visiblePW" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="active" src="../week9/imgs/visibility_off.svg">

            <!-- <div id="inputAlarmLabel">
                <div class="inputLabel">비밀번호 재입력</div>
                <div class="impossible">비밀번호가 일치하지 않습니다.</div>
            </div>
            <input id="pwInputBox" class="inputBox" type="password" maxlength="20" required>
            <img id="visiblePW" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="active" src="../imgs/visibility_off.svg"> -->

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input class="inputBox" type="text" value="홍길동" maxlength="10" disabled>
                </div>
                <div class="rowInput">
                    <div class="inputLabel">부서</div>
                    <input class="inputBox" type="text" value="서비스 팀" disabled>
                    <!-- <select class="selectBox"> 
                        <option>서비스 팀</option>
                        <option>디자인 팀</option>
                    </select> -->
                </div>
                <div class="rowInput"> 
                    <div class="inputLabel">직책</div>
                    <input class="inputBox" type="text" value="팀장" disabled>
                    <!-- <select class="selectBox">
                        <option>팀장</option>
                        <option>팀원</option>
                    </select> -->
                </div>
            </div>

            <div class="inputLabel">전화번호</div>
            <input class="inputBox" type="tel" value="01012341234" maxlength="11" disabled>

            <div id="extraFunctions">
                <button>탈퇴하기</button>
                <button>수정하기</button>
            </div>
        </div>
    </form>
</body>
</html>