<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="resources/css/reset.css"/>" rel='stylesheet' />
    <link href="<c:url value="resources/css/main.css" />" rel='stylesheet' />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<div class="wrapper">
    <header class="header">
        <div class="row">
            <div class="col-xs-1">
                logo
            </div>
            <div class="col-xs-11">
                <nav>
                    <ul class="row">
                        <li>
                            <button type="button" class="btn btn-primary">Todo 등록</button>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <main>
        <div class="container-fluid main-inner">
            메인
            <p></p>
            <form action="addTodo" method="post">
                <label>
                    todo :
                    <input type="text" name="todo">
                </label>
                <button type="submit">인서트</button>
            </form>
            <div class="todo_list">
                <ul>
                <c:forEach items="${todoList}" var="todo">
                    <li class="user_name">
                        <span class="todo">
                                ${todo.todo}
                        </span>
                        <span class="create_date">
                            ${todo.createdDate}
                        </span>
                    </li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </main>
    <footer>
        <div class="inner"></div>
    </footer>
</div>
</body>
</html>
