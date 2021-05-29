<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="issueForm.css">
    <link rel="stylesheet" href="main.css">
    <title>Edit Issue</title>
</head>
<body>
    <%@page import="com.dbsproject.dao.IssueDao,com.dbsproject.bean.Issue"%>

    <header>
        <jsp:include page="navbar.jsp"></jsp:include>
    </header>

    <%
        String id=request.getParameter("id");
        Issue i = IssueDao.getRecordById(Integer.parseInt(id));
    //    System.out.println(id);
    %>

    <main>
        <div class="container-fluid px-1 py-5 mx-auto">
            <div class="row d-flex justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                    <h3>Edit Issue</h3>
                    <div class="card">
                        <form class="form-card" action="editIssue.jsp" method="post">
                            <input type="hidden" name="id" id="id" value="<%= i.getId() %>">
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label for="title" class="form-control-label px-3">Title<span class="text-danger"> *</span></label>
                                    <input type="text" id="title" name="title" value="<%= i.getTitle() %>"> </div>
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
                                    <input type="text" id="owner" name="owner" value="<%= i.getOwner() %>"> </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label for="assignedTo" class="form-control-label px-3">Assigend To</label>
                                    <input type="text" id="assignedTo" name="assignedTo" value="<%= i.getAssignedTo() %>"> </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-12 flex-column d-flex">
                                    <label for="description" class="form-control-label px-3">Description</label>
                                    <textarea id="description" name="description"><%=i.getDescription()%></textarea></div>
                            </div>
                            <div class="row justify-content-end">
                                <div class="form-group"> <button type="submit" class="btn-block btn-primary">Submit</button> </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
