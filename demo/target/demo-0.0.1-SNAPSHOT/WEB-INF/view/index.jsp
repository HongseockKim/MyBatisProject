<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="<c:url value="resources/js/main.js"/>" ></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Roboto:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="<c:url value="resources/css/reset.css"/>" rel='stylesheet' />
    <link href="<c:url value="resources/scss/main.css" />" rel='stylesheet' />
</head>
<body>
<div class="wrapper">
    <header class="header">
        <div class="row">
            <div class="col-xs-2">
                <h1 class="logo">My Batis!</h1>
            </div>
            <div class="col-xs-10">
                <nav>
                    <ul class="row">
                        <li>
                            <button id="todoModal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Todo 등록</button>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <main>
        <div class="container-fluid main-inner">
            <div class="todo_list">
                <table class="table table-bordered">
                    <c:forEach items="${todoList}" var="todo" varStatus="status">
                        <tr>
                            <th>번호</th>
                            <th>Todo</th>
                            <th>날짜</th>
                        </tr>
                        <tr>
                            <td>${status.index}</td>
                            <td>${todo.todo}</td>
                            <td>${todo.createdDate}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </main>
    <footer>
        <div class="inner"></div>
    </footer>
    <%--todo modal--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Todo 등록</h4>
                </div>
                <div class="modal-body">
                    <form action="addTodo" method="post">
                        <label>todo : <input type="text" name="todo"></label>
                        <button type="submit" class="todo-registration">등록</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
