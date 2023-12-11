<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    // 로그인 정보 세션에 넣어놓음
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String department = (String)session.getAttribute("department");
    String role = (String)session.getAttribute("role");

    String yearValue = request.getParameter("year");
    String monthValue = request.getParameter("month");
    String dateValue = request.getParameter("date");
%>

<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->
<%@ page import="java.util.ArrayList" %>         <!-- 리스트 라이브러리 -->

<!-- jsp 코드 -->
<%