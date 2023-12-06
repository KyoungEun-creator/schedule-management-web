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
<!-- jsp에서 라이브러리 import하는 방법 -->
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
%>

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
            <div class="inputLabel">아이디</div>
            <input id="idInputBox" class="inputBox" value="<%=id%>" disabled> 

            <div class="inputLabel">비밀번호</div>
            <input id="pwInputBox" class="inputBox" name="pw_changed_value" value="<%=password%>" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20">
            <img id="visiblePW" class="visibility" src="../imgs/visibility.svg" onclick="toggleVisiblityPW()">
            <img id="nonVisiblePW" class="visibility hidden" src="../imgs/visibility_off.svg" onclick="toggleVisiblityPW()">

            <div id="inputAlarmLabel">
                <div class="inputLabel">비밀번호 재입력</div>
                <div id="impossiblePWMessage" class="impossible hidden">비밀번호가 일치하지 않습니다.</div>
            </div>
            <input id="pwSecondInputBox" class="inputBox" value="<%=password%>" placeholder="최대 20자 내로 입력하세요" type="password" maxlength="20" oninput="makePWSame()">
            <img id="visibleSecondPW" class="visibility"  src="../imgs/visibility.svg" onclick="toggleSecondVisiblityPW()">
            <img id="nonVisibleSecondPW" class="visibility hidden" src="../imgs/visibility_off.svg" onclick="toggleSecondVisiblityPW()">

            <div id="rowInputContainer">
                <div class="rowInput">
                    <div class="inputLabel">이름</div>
                    <input id="nameInputBox" class="inputBox" value="<%=name%>" disabled>
                </div>
                <div class="rowInput">
                    <div class="inputLabel">부서</div>
                    <select class="selectBox" name="department">
                        <option value="1" <%= department.equals("1") ? "selected" : "" %>>서비스 팀</option>
                        <option value="2" <%= department.equals("2") ? "selected" : "" %>>디자인 팀</option>
                    </select>
                </div>
                <div class="rowInput">
                    <div class="inputLabel">직책</div>
                    <select class="selectBox" name="role">
                        <option value="1" <%= role.equals("1") ? "selected" : "" %>>팀장</option>
                        <option value="2" <%= role.equals("2") ? "selected" : "" %>>팀원</option>
                    </select>
                </div>
            </div>

            <div class="inputLabel">전화번호</div>
            <input id="telInputBox" class="inputBox" name="tel_value" value="<%=tel%>" placeholder="' - '는 생략해주세요" type="tel" maxlength="11">

            <!-- 수정하기 버튼 -->
            <input id="enterBtn" value="수정하기" type="button" onclick="validateForm()">
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
</body>