<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.dbsproject.dao.IssueDao"%>
<jsp:useBean id="u" class="com.dbsproject.bean.Issue"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    IssueDao.delete(u);
    response.sendRedirect("app.jsp");
%>