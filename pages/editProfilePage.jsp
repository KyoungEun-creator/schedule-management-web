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
            <input id="idInputBox" class="inputBox" name="id_changed_value" placeholder="최대 15자 내로 입력하세요" type="text" maxlength="15">
            <button id="duplicateIDCheckBtn" onclick="checkIdDuplicateEvent()">중복확인</button>

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" name="pw_changed_value" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20">
            <img id="visiblePW" class="visibility" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="inputAlarmLabel">
                <div class="inputLabel">비밀번호 재입력</div>
                <div id="impossiblePWMessage" class="impossible hidden">비밀번호가 일치하지 않습니다.</div>
            </div>
            <input id="pwSecondInputBox" class="inputBox" type="password" placeholder="최대 20자 내로 입력하세요" maxlength="20">
            <img id="visibleSecondPW" class="visibility"  src="../imgs/visibility.svg">
            <img id="nonVisibleSecondPW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input id="nameInputBox" class="inputBox" name="name_changed_value" type="text" maxlength="10">
                </div>
                <div class="rowInput">
                    <div class="inputLabel">부서</div>
                    <select class="selectBox"> 
                        <option name="department" value="service_team">서비스 팀</option>
                        <option name="department" value="design_team">디자인 팀</option>
                    </select>
                </div>
                <div class="rowInput"> 
                    <div class="inputLabel">직책</div>
                    <select class="selectBox">
                        <option name="role" value="leader">팀장</option>
                        <option name="role" value="member">팀원</option>
                    </select>
                </div>
            </div>

            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" name="tel_value" placeholder="' - '는 생략해주세요" type="tel" maxlength="11">

            <!-- 수정하기 버튼 -->
            <input id="enterBtn" value="수정하기" type="button" onclick="validateForm()">
        </div>
    </form>

    <script src="../js/pwEvent.js"></script>
    <script src="../js/regexTest.js"></script>
    <script>
        function validateForm () {
            var idInput = document.getElementById("idInputBox");
            var idInputValue = document.getElementById("idInputBox").value;
            var pwInput = document.getElementById("pwInputBox");
            var pwInputValue = document.getElementById("pwInputBox").value;
            var pwSecondInput = document.getElementById("pwSecondInputBox");
            var pwSecondInputValue = document.getElementById("pwSecondInputBox").value;
            var nameInput = document.getElementById("nameInputBox");
            var nameInputValue = document.getElementById("nameInputBox").value;
            var telInput = document.getElementById("telInputBox");
            var telInputValue = document.getElementById("telInputBox").value;

            if (idInputValue === "" || pwInputValue === "" || pwSecondInputValue === "" || nameInputValue === "" || telInputValue === "") {
                alert("값을 모두 입력해주세요")
            }
            else {
                testIDRegex(idInput, idInputValue);
                testPWRegex(pwInput, pwInputValue);
                testSecondPWRegex(pwInput, pwInputValue, pwSecondInput, pwSecondInputValue);
                testNameRegex(nameInput, nameInputValue);
                testTelRegex(telInput, telInputValue);
                document.getElementById("valueContainer").submit();
            }
        }
    </script>
    <script>
        // 아이디 중복체크 버튼 클릭 시 input 더이상 입력 불가해지는 이벤트
        function checkIdDuplicateEvent () {
            var idInput = document.getElementById("idInputBox");

            // 정규식에 부합한다면 
            // 백엔드 아이디 중복 확인 로직을 실행하고
            idInput.disabled = true;
        }
    </script>
</body>