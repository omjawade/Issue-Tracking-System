<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.dbsproject.dao.IssueDao,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="main.css">
    <title>Statistics</title>
</head>
<body>

    <header>
        <jsp:include page="navbar.jsp"></jsp:include>
    </header>

    <main>
        <h1>STATS</h1>

        <%
            int totalNumIssues=IssueDao.getTotalNumIssues();
            request.setAttribute("totalNumIssues",totalNumIssues);
            int fixedIssueNum = IssueDao.getNumFromStatus("Fixed");
            request.setAttribute("fixedIssueNum", fixedIssueNum);
            int assignedIssueNum = IssueDao.getNumFromStatus("Assigned");
            request.setAttribute("assignedIssueNum", assignedIssueNum);
            int closedIssueNum = IssueDao.getNumFromStatus("Closed");
            request.setAttribute("closedIssueNum", closedIssueNum);
        %>

        <p>Total number of issues</p>
        <p>${totalNumIssues}</p>

        <p>Fixed Issues</p>
        <p>${fixedIssueNum}</p>

        <p>Assigned Issue</p>
        <p>${assignedIssueNum}</p>

        <p>Closed Issue</p>
        <p>${closedIssueNum}</p>
    </main>
</body>
</html>
