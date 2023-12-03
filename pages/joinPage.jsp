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
                <div id="possibleIDMessage" class="possible hidden">사용 가능한 아이디입니다.</div>
                <div id="impossibleIDMessage" class="impossible hidden">사용 불가능한 아이디입니다.</div>
            </div>
            <input id="idInputBox" class="inputBox" name="id_value" placeholder="최대 15자 내로 입력하세요" type="text" maxlength="15">
            <button id="duplicateIDCheckBtn" onclick="checkIdDuplicateEvent()">중복확인</button>

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
    <script src="../js/regexTest.js"></script>
    <script>
        // 아이디 중복체크 버튼 클릭 시 input 더이상 입력 불가해지는 이벤트
        function checkIdDuplicateEvent () {
            var idInput = document.getElementById("idInputBox");

            // 정규식에 부합한다면 
            // 백엔드 아이디 중복 확인 로직을 실행하고
            idInput.disabled = true;
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