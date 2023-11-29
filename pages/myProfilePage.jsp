<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/indexStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="stylesheet" href="../styles/templateStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>내 정보 보기</title>
</head>
<body>
    <img id="mainLogo" src="../imgs/stageus_logo_white.png">
    <form id="valueContainer">
        <div class="inputContainer">
            <div class="inputLabel">아이디</div>
            <input id="idInputBox" class="inputBox" name="id_value" type="text" placeholder="최대 15자 내로 입력하세요" maxlength="15" disabled>

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" name="pw_value" type="password" maxlength="20" disabled autoComplete="off">
            <img id="visiblePW" class="visibilityProfilePW" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibilityProfilePW hidden" src="../imgs/visibility_off.svg">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input id="nameInputBox" class="inputBox" name="name_value" value="" type="text" maxlength="10" disabled>
                </div>
                <div class="rowInput">
                    <div class="inputLabel">부서</div>
                    <input id="departmentInputBox" class="inputBox" name="department_value" type="text" disabled>
                </div>
                <div class="rowInput"> 
                    <div class="inputLabel">직책</div>
                    <input id="roleInputBox" class="inputBox" name="role_value" type="text" disabled>
                </div>
            </div>
            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" type="tel" name="tel_value" length="11" disabled>

            <div id="extraFunctions">
                <button id="deleteAccountBtn" class="extraFunctionBtn" onclick="deleteAccountEvent()">탈퇴하기</button>
                <a href="../pages/editProfilePage.jsp" class="extraFunctionBtn">수정하기</a>
            </div>
        </div>
    </form>

    <!-- 탈퇴(계정삭제) 확인 modal -->
    <div id="deleteAccountModal" style="display:none">
        <div id="deleteAccountLabel">탈퇴 하시겠습니까?</div>
        <form id="decideBtnContainer">
            <button id="yesDeleteAccountBtn" class="decideBtn" type="submit">탈퇴</button>
            <button id="noDeleteAccountBtn" class="decideBtn" onclick="reloadMyProfilePageEvent()">취소</button></a>
        </form>
    </div>

    <!-- 유저 정보 입력 -->
    <script>
        var userAccount = {
            id: "jke",
            password: "1234",
            name: "조경은",
            department: "서비스팀",
            role: "팀장",
            tel: "01012341234"
        }
        function myProfile() {
            document.getElementById("idInputBox").value = userAccount.id;
            document.getElementById("pwInputBox").value = userAccount.password;
            document.getElementById("nameInputBox").value = userAccount.name;
            document.getElementById("departmentInputBox").value = userAccount.department;
            document.getElementById("roleInputBox").value = userAccount.role;
            document.getElementById("telInputBox").value = userAccount.tel;
        }
        myProfile();
    </script>

    <!-- 탈퇴 확인 모달창 -->
    <script>
        var deleteAccountModal = document.getElementById("deleteAccountModal");
        function deleteAccountEvent() {
            deleteAccountModal.style.display = "block";
        }
        function reloadMyProfilePageEvent() {
            location.reload();
            deleteAccountModal.style.display = "none";
        }
    </script>
    
    <script src="../js/pwEvent.js"></script>
</body>