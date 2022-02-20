<%@ page import="java.sql.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.Todo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<%@ include file="header.jsp"%>
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
        <%@ include file="rightMenu.jsp"%>
        <div class="container-fluid main-inner">
            <div class="todo_list">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="2%">
                        <col width="78%">
                        <col width="20%">
                    </colgroup>
                    <tr>
                        <th>번호</th>
                        <th>Todo</th>
                        <th>날짜</th>
                    </tr>
                    <c:forEach items="${todoList}" var="todo" varStatus="status">
                        <tr>
                            <td id="todo_num">${status.index + 1}</td>
                            <td>
                                <div class="todo_item">
                                    <button type="button" class="btn btn-danger delete_todo" data-get-id=${todo.id}>삭제</button>
                                    <button type="button" class="detail_button" data-get-id=${todo.id}>${todo.todo}</button>
                                </div>
                            </td>
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
                        <label class="todo-label" for="todo_text">Todo</label>
                        <textarea id="todo_text" type="text" name="todo"></textarea>
                        <div class="modal-footer">
                            <button type="submit" class="todo-registration">등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
