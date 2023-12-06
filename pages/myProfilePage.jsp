<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- 로그인할 때 세션에 넣어놨던 거 가져옴 -->
<%
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
    String password = (String)session.getAttribute("password");
    String name = (String)session.getAttribute("name");
    String department = (String)session.getAttribute("department");
    String role = (String)session.getAttribute("role");
    String tel = (String)session.getAttribute("tel");
%>

<!-- jsp에서 라이브러리 import -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    // 로그인 안 되어 있으면 열리면 안 됨
    if (idx == null) { 
        response.sendRedirect("../index.jsp");
    }

    // 부서 idx로 되어있는 거 name 가져오고자 함
    String depNameSelectSql = "SELECT name FROM department WHERE idx = ?";
    PreparedStatement depNameSelectQuery = connect.prepareStatement(depNameSelectSql);
    depNameSelectQuery.setString(1, department);

    ResultSet depNameSelectResult = depNameSelectQuery.executeQuery();

    if(depNameSelectResult.next()) {
        department = depNameSelectResult.getString(1);
    }

    // 직책 idx로 되어있는 거 name 가져오고자 함
    String roleNameSelectSql = "SELECT name FROM role WHERE idx = ?";
    PreparedStatement roleNameSelectQuery = connect.prepareStatement(roleNameSelectSql);
    roleNameSelectQuery.setString(1, role);

    ResultSet roleNameSelectResult = roleNameSelectQuery.executeQuery();

    if(roleNameSelectResult.next()) {
        role = roleNameSelectResult.getString(1);
    }
%>

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
            <input id="idInputBox" class="inputBox" value="<%=id%>" type="text" placeholder="최대 15자 내로 입력하세요" maxlength="15" disabled>

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" value="<%=password%>" type="password" maxlength="20" disabled autoComplete="off">
            <img id="visiblePW" class="visibilityProfilePW" src="../imgs/visibility.svg" onclick="toggleVisiblityPW()">
            <img id="nonVisiblePW" class="visibilityProfilePW hidden" src="../imgs/visibility_off.svg" onclick="toggleVisiblityPW()">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input id="nameInputBox" class="inputBox" value="<%=name%>" type="text" maxlength="10" disabled>
                </div>
                <div class="rowInput">
                    <div class="inputLabel">부서</div>
                    <input id="departmentInputBox" class="inputBox" value="<%=department%>" type="text" disabled>
                </div>
                <div class="rowInput"> 
                    <div class="inputLabel">직책</div>
                    <input id="roleInputBox" class="inputBox" value="<%=role%>" type="text" disabled>
                </div>
            </div>
            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" type="tel" value="<%=tel%>" disabled>

            <div id="extraFunctions">
                <input id="openDeleteAccountModalBtn" class="extraFunctionBtn" type="button" value="탈퇴하기" onclick="openDeleteAccountModalEvent()">
                <a href="../pages/editProfilePage.jsp" class="extraFunctionBtn">수정하기</a>
            </div>
        </div>
    </form>

    <!-- 탈퇴(계정삭제) 확인 modal -->
    <div class="deleteAccountModal hidden">
        <div id="deleteAccountLabel">탈퇴 하시겠습니까?</div>
        <form id="decideBtnContainer">
            <button id="yesDeleteAccountBtn" class="decideBtn" type="submit">탈퇴</button>
            <button id="noDeleteAccountBtn" class="decideBtn" onclick="exitDeleteAccountModalEvent()">취소</button></a>
        </form>
    </div>

    <!-- 탈퇴 확인 모달창 -->
    <script>
        var deleteAccountModal = document.querySelector(".deleteAccountModal");

        function openDeleteAccountModalEvent() {
            deleteAccountModal.classList.remove("hidden");
        }
        function exitDeleteAccountModalEvent() {
            deleteAccountModal.classList.add("hidden");
        }
    </script>
    <script src="../js/pwEvent.js"></script>
    <script>
        function toggleVisiblityPW() {
            var visiblePW = document.getElementById("visiblePW");
            var nonVisiblePW = document.getElementById("nonVisiblePW");
            var pwInputBox = document.getElementById("pwInputBox");
            
            togglePWEvent(visiblePW, nonVisiblePW, pwInputBox);
        }
    </script>
</body>