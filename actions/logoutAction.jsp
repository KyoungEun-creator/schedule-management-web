<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>