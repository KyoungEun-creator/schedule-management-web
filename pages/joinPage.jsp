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
    <form id="valueContainer" onsubmit="return regexCheck(event)" action="../actions/joinAction.jsp">
        <div class="inputContainer">
            <div id="inputAlarmLabel">
                <div class="inputLabel">아이디</div>
                <div id="possibleIDMessage" class="possible">사용 가능한 아이디입니다.</div>
                <div id="impossibleIDMessage" class="impossible hidden">사용 불가능한 아이디입니다.</div>
            </div>
            <input id="idInputBox" class="inputBox" name="id_value" placeholder="최대 15자 내로 입력하세요" type="text" maxlength="15">
            <button id="duplicateIDCheckBtn">중복확인</button>

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" name="pw_value" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20">
            <img id="visiblePW" class="visibility" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="inputAlarmLabel">
                <div class="inputLabel">비밀번호 재입력</div>
                <div id="impossiblePWMessage" class="impossible hidden">비밀번호가 일치하지 않습니다.</div>
            </div>
            <input id="pwSecondInputBox" class="inputBox" name="pw_second_value" type="password" placeholder="최대 20자 내로 입력하세요" maxlength="20">
            <img id="visibleSecondPW" class="visibility"  src="../imgs/visibility.svg">
            <img id="nonVisibleSecondPW" class="visibility hidden" src="../imgs/visibility_off.svg">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input id="nameInputBox" class="inputBox" name="name_value" type="text" maxlength="10">
                </div>
                <div class="rowInput">
                    <div id="selectDepartment" class="inputLabel">부서</div>
                    <select class="selectBox"> 
                        <option name="department_value" value="service">서비스 팀</option>
                        <option name="department_value" value="design">디자인 팀</option>
                    </select>
                </div>
                <div class="rowInput"> 
                    <div id="selectRole" class="inputLabel">직책</div>
                    <select class="selectBox">
                        <option name="role_value" value="leader">팀장</option>
                        <option name="role_value" value="member">팀원</option>
                    </select>
                </div>
            </div>

            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" name="tel_value" placeholder="' - '는 생략해주세요" type="tel" maxlength="11">

            <!-- 회원가입 버튼 -->
            <input id="enterBtn" value="회원가입" type="submit">

            <div id="extraFunctions">
                <a href="../index.jsp">로그인하러 가기</a>
            </div>
        </div>
    </form>

    <script src="../js/pwEvent.js"></script>
    <!-- 회원가입 예외처리 하고 form.submit 전송하는 거 고치기 -->
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
            var pwInput = document.getElementById("pwInputBox");
            var pwInputValue = document.getElementById("pwInputBox").value;
            var pwSecondInput = document.getElementById("pwSecondInputBox");
            var pwSecondInputValue = document.getElementById("pwSecondInputBox").value;
            var nameInput = document.getElementById("nameInputBox");
            var nameInputValue = document.getElementById("nameInputBox").value;
            var telInput = document.getElementById("telInputBox");
            var telInputValue = document.getElementById("telInputBox").value;

            if (!idRegex.test(idInputValue)) {
                alert("영어, 숫자로 이루어진 아이디를 입력해주세요.");
                idInput.value = "";
                return false;
            }
            if (!pwRegex.test(pwInputValue)) {
                alert("영어, 숫자, 특수기호로 이루어진 비밀번호를 입력해주세요.");
                pwInput.value = "";
                return false;
            }
            if (!nameRegex.test(nameInputValue)) {
                alert("한국어 본명을 입력해주세요.");
                nameInput.value = "";
                return false;
            }
            if (!telRegex.test(telInputValue)) {
                alert("' - '를 제외한 숫자만 입력해주세요.");
                telInput.value = "";
                return false;
            }
            // 비밀번호 두 개가 일치하지 않는다면
            if (pwInputValue !== pwSecondInputValue) {
                alert("비밀번호가 일치하지 않습니다.");
                pwInput.value = "";
                pwSecondInput.value = "";
                return false;
            }
            // 모든 유효성 검사 통과 시 폼 제출
            document.getElementById("valueContainer").submit();
        }
    </script>
    <script>
        // select에서 유저가 선택한 option 값 가져오기
        let selectedDepartment = document.getElementById("selectDepartment");
        selectedDepartment = selectedDepartment.options[select.selectedIndex].value;

        let selectedPosition = document.getElementById("selectPosition");
        selectedPosition = selectedPosition.options[select.selectedIndex].value;
    </script>
</body>