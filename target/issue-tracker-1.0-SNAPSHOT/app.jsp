<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.dbsproject.dao.IssueDao,com.dbsproject.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="issueForm.css">
    <link rel="stylesheet" href="main.css">
    <title>Issue Tracker App</title>
</head>

<body>
    <header>
        <jsp:include page="navbar.jsp"></jsp:include>
    </header>

    <main>
        <div class="container-fluid px-1 py-5 mx-auto">
            <div class="row d-flex justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                    <h3>Add Issue</h3>
                    <div class="card">
                        <form class="form-card" action="addIssue.jsp">
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label for="title" class="form-control-label px-3">Title<span class="text-danger"> *</span></label>
                                    <input type="text" id="title" name="title"> </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label for="status" class="form-control-label px-3">Status<span class="text-danger"> *</span></label>
                                    <select class="form-select" id="status" name="status">
                                        <option value="New">New</option>
                                        <option value="Assigned">Assigned</option>
                                        <option value="Fixed">Fixed</option>
                                        <option value="Closed">Closed</option>
                                    </select> </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label for="owner" class="form-control-label px-3">Owner<span class="text-danger"> *</span></label>
                                    <input type="text" id="owner" name="owner"> </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label for="assignedTo" class="form-control-label px-3">Assigend To</label>
                                    <input type="text" id="assignedTo" name="assignedTo"> </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-12 flex-column d-flex">
                                    <label for="description" class="form-control-label px-3">Description</label>
                                    <textarea id="description" name="description"></textarea></div>
                            </div>
                            <div class="row justify-content-end">
                                <div class="form-group"> <button type="submit" class="btn-block btn-primary">Submit</button> </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="issue-list-container">
            <h2 style="margin-bottom: 50px; text-align: center">Issue List</h2>
            <%
                List<Issue> list=IssueDao.getAllRecords();
                request.setAttribute("list",list);
            %>

            <table class="table">
                <thead style="color: white; background-color: rgba(0, 0, 0, 0.7)">
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Owner</th>
                        <th>Assigned To</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <c:forEach items="${list}" var="i">
                    <tr>
                        <td>${i.getId()}</td>
                        <td>${i.getTitle()}</td>
                        <td>${i.getDescription()}</td>
                        <td>${i.getStatus()}</td>
                        <td>${i.getOwner()}</td>
                        <td>${i.getAssignedTo()}</td>
                        <td><a class="link-dark" href="issueForm.jsp?id=${i.getId()}">Edit</a></td>
                        <td><a class="link-dark" href="deleteIssue.jsp?id=${i.getId()}">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </main>
</body>
</html>
