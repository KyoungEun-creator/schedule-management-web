<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
%>

<%
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그아웃하기</title>
</head>
<body>
    <script>
        var sessionIdx = "<%=idx%>"

        if (sessionIdx !== "") {
            alert("로그아웃 되었습니다.");
            location.href = "../index.jsp";
        } else {
            alert("로그아웃이 정상적으로 처리되지 않았습니다.");
            location.href = "../pages/mainPage.jsp";
        }
    </script>

</body>