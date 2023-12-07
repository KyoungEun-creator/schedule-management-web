<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/joinStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="stylesheet" href="../styles/templateStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>회원가입</title>
</head>
<body>
    <img id="mainLogo" src="../imgs/stageus_logo_white.png">
    <form id="valueContainer" action="../actions/joinAction.jsp">
        <div class="inputContainer">
            <div id="inputAlarmLabel">
                <div class="inputLabel">아이디</div>
                <div id="possibleIDMessage" class="possible hidden">사용 가능한 아이디입니다.</div>
                <div id="impossibleIDMessage" class="impossible hidden">사용 불가능한 아이디입니다.</div>
            </div>
            <input id="idInputBox" class="inputBox" name="id_value" placeholder="최대 15자 내로 입력하세요" type="text" maxlength="15">
            <input id="duplicateIDCheckBtn" value="중복확인" type="button" onclick="checkDuplicateIDEvent()">

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" name="pw_value" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20">
            <img id="visiblePW" class="visibility" src="../imgs/visibility.svg" onclick="toggleVisiblityPW()">
            <img id="nonVisiblePW" class="visibility hidden" src="../imgs/visibility_off.svg" onclick="toggleVisiblityPW()">

            <div id="inputAlarmLabel">
                <div class="inputLabel">비밀번호 재입력</div>
                <div id="impossiblePWMessage" class="impossible hidden">비밀번호가 일치하지 않습니다.</div>
            </div>
            <input id="pwSecondInputBox" class="inputBox" type="password" placeholder="최대 20자 내로 입력하세요" maxlength="20" oninput="makePWSame()">
            <img id="visibleSecondPW" class="visibility"  src="../imgs/visibility.svg" onclick="toggleSecondVisiblityPW()">
            <img id="nonVisibleSecondPW" class="visibility hidden" src="../imgs/visibility_off.svg" onclick="toggleSecondVisiblityPW()">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input id="nameInputBox" class="inputBox" name="name_value" type="text" maxlength="10">
                </div>
                <div class="rowInput">
                    <div id="selectDepartment" class="inputLabel">부서</div>
                    <select class="selectBox" name="department_value">
                        <option value="1">서비스 팀</option>
                        <option value="2">디자인 팀</option>
                    </select>
                </div>
                <div class="rowInput"> 
                    <div id="selectRole" class="inputLabel">직책</div>
                    <select class="selectBox" name="role_value">
                        <option value="1">팀장</option>
                        <option value="2">팀원</option>
                    </select>
                </div>
            </div>

            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" name="tel_value" placeholder="' - '는 생략해주세요" type="tel" maxlength="11">

            <!-- 회원가입 버튼 -->
            <input id="enterBtn" value="회원가입" type="button" onclick="joinEvent()">

            <div id="extraFunctions">
                <a href="../index.jsp">로그인하러 가기</a>
            </div>
        </div>
    </form>

    <script src="../js/pwEvent.js"></script>
    <script>
        function toggleVisiblityPW() {
            var visiblePW = document.getElementById("visiblePW");
            var nonVisiblePW = document.getElementById("nonVisiblePW");
            var pwInputBox = document.getElementById("pwInputBox");
            
            togglePWEvent(visiblePW, nonVisiblePW, pwInputBox);
        }
        function toggleSecondVisiblityPW() {
            var visibleSecondPW = document.getElementById("visibleSecondPW");
            var nonVisibleSecondPW = document.getElementById("nonVisibleSecondPW");
            var pwSecondInputBox = document.getElementById("pwSecondInputBox");
            
            toggleSecondPWEvent(visibleSecondPW, nonVisibleSecondPW, pwSecondInputBox);
        }
        function makePWSame() {
            var password = pwInputBox.value;
            var secondPassword = pwSecondInputBox.value;
            var impossiblePWMessage = document.getElementById("impossiblePWMessage");

            checkPWMatchEvent(password, secondPassword, impossiblePWMessage);
        }
    </script>
    <script src="../js/regexTest.js"></script>
    <script>
        function joinEvent () {
            var idInputBox = document.getElementById("idInputBox");
            var idInputValue = document.getElementById("idInputBox").value;
            var pwInputBox = document.getElementById("pwInputBox");
            var pwInputValue = document.getElementById("pwInputBox").value;
            var pwSecondInputBox = document.getElementById("pwSecondInputBox");
            var pwSecondInputValue = document.getElementById("pwSecondInputBox").value;
            var nameInputBox = document.getElementById("nameInputBox");
            var nameInputValue = document.getElementById("nameInputBox").value;
            var telInputBox = document.getElementById("telInputBox");
            var telInputValue = document.getElementById("telInputBox").value;

            if (idInputValue === "" || pwInputValue === "" || pwSecondInputValue === "" || nameInputValue === "" || telInputValue === "") {
                alert("값을 모두 입력해주세요");
            }
            else if (!isIdCorrect(idInputValue)) {
                alert("영어, 숫자로 이루어진 3 이상 15 이하 길이의 아이디를 입력해주세요.");
                idInputBox.value = "";
                possibleIDMessage.classList.add("hidden");
                impossibleIDMessage.classList.remove("hidden");
            }
            else if (!isPwCorrect(pwInputValue)) {
                alert("영어, 숫자, 특수기호로 이루어진 3 이상 20 이하 길이의 비밀번호를 입력해주세요.");
                pwInputBox.value = "";
            }
            else if (!isSecondPwCorrect(pwInputValue, pwSecondInputValue)) {
                alert("비밀번호가 일치하지 않습니다.");
                pwInputBox.value = "";
                pwSecondInputBox.value = "";
            }
            else if (!isSecondPwCorrect(nameInputValue)) {
                alert("한국어 본명을 입력해주세요.");
                nameInputBox.value = "";
            }
            else if (!isNameCorrect(telInputValue)) {
                alert("' - '를 제외한 숫자만 입력해주세요.");
                telInputBox.value = "";
            }
            else {
                console.log(idInputValue, pwInputValue, nameInputValue, telInputValue)
                document.getElementById("valueContainer").submit();
            }
        }
    </script>
    <script>
        // 아이디 중복 체크

        // 부모창에서 자식창의 '아이디 정규식 부합 여부' 결과를 받을 변수 (true: 사용불가 / false: 사용가능)
        var idRegexCheck;

        // 부모 창에서 자식창의 '아이디 중복 여부' 결과를 받을 변수 (true: 사용가능 / false: 사용가능)
        var idDuplicateCheck; 

        // 자식 창을 열고 값(정규식, 중복 확인 결과) 받아오기
        function checkDuplicateIDEvent () {
            var idInputValue = document.getElementById("idInputBox").value;
            var childWindow = window.open("../actions/checkDuplicateIDAction.jsp?id_value=" + idInputValue, "_blank", "width=900,height=600, scrollbars=yes");

            // 자식 창에서 값을 받아올 때 실행되는 함수
            childWindow.onunload = function () {
                var idInputBox = document.getElementById("idInputBox");
                var possibleIDMessage = document.getElementById("possibleIDMessage");
                var impossibleIDMessage = document.getElementById("impossibleIDMessage");

                idRegexCheck = childWindow.isFailedRegexID;
                idDuplicateCheck = childWindow.isDuplicateID;
                
                console.log(idRegexCheck);
                console.log(idDuplicateCheck);
                
                if (idRegexCheck || idDuplicateCheck) {
                    // 정규식 실패, 중복된 아이디인 경우 (사용불가)
                    possibleIDMessage.classList.add("hidden");
                    impossibleIDMessage.classList.remove("hidden");
                    idInputBox.readOnly = false;  
                } else {
                    // 정규식 통과, 중복되지 않은 아이디 (사용가능)
                    possibleIDMessage.classList.remove("hidden");
                    impossibleIDMessage.classList.add("hidden");
                    idInputBox.readOnly = true;
                }
            };
        }
    </script>
</body>



