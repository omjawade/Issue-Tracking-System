<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.min.css">
    <title>Issue Tracker</title>
</head>
<body>
    <header>
        <jsp:include page="navbar.jsp"></jsp:include>
    </header>

    <main>
        <div
        <%--        id="intro-example"--%>
                class="text-center"
        <%--        style="background-position: center;--%>
        <%--  background-repeat: no-repeat;--%>
        <%--  background-size: cover;"--%>
        >
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.7);">
                <div class="d-flex justify-content-center align-items-center h-100">
                    <div class="text-white">
                        <h1 class="mb-3">Issue Tracker</h1>
                        <h5 class="mb-4">Keep track of your project issues</h5>
                        <a
                                class="btn btn-outline-light btn-lg m-2"
                                href="app.jsp"
                                role="button"
                                rel="nofollow"
                        >Go to the application</a
                        >
                        <%--                    <a--%>
                        <%--                            class="btn btn-outline-light btn-lg m-2"--%>
                        <%--                            href="https://mdbootstrap.com/docs/standard/"--%>
                        <%--                            target="_blank"--%>
                        <%--                            role="button"--%>
                        <%--                    >Download MDB UI KIT</a--%>
                        <%--                    >--%>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
