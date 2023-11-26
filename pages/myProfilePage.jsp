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
            <input class="inputBox" type="text" value="hongkildong" placeholder="최대 15자 내로 입력하세요" maxlength="15" disabled>

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" type="password" value="123456" maxlength="20" disabled>
            <img id="visiblePW" class="visibilityProfilePW" src="../imgs/visibility.svg">
            <img id="nonVisiblePW" class="visibilityProfilePW hidden" src="../imgs/visibility_off.svg">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input class="inputBox" type="text" value="홍길동" maxlength="10" disabled>
                </div>
                <div class="rowInput">
                    <div class="inputLabel">부서</div>
                    <input class="inputBox" type="text" value="서비스 팀" disabled>
                </div>
                <div class="rowInput"> 
                    <div class="inputLabel">직책</div>
                    <input class="inputBox" type="text" value="팀장" disabled>
                </div>
            </div>
            <div class="inputLabel">전화번호</div>
            <input class="inputBox" type="tel" value="01012341234" length="11" disabled>

            <div id="extraFunctions">
                <button id="deleteAccountBtn" class="extraFunctionBtn" onclick="openDeleteAccountModalEvent(e)">탈퇴하기</button>
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

    <script>
        var deleteAccountModal = document.getElementById("deleteAccountModal");
       
        // deleteAccountBtn 클릭 이벤트
        function openDeleteAccountModalEvent() {
            deleteAccountModal.style.display = "block";
        }

        function reloadMyProfilePageEvent() {
            location.reload();
            deleteAccountModal.style.display = "none";
        }

    </script>
    <script src="../js/pwEvent.js"></script>
</body>