<%@ page import="java.sql.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.Todo" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <div class="container-fluid main-inner">
            <div class="progress">
                <div class="progress-bar progress-bar-success"
                        id="progress-bar-todo"
                        role="progressbar"
                        aria-valuenow="100"
                        aria-valuemin="0"
                        aria-valuemax="100">
                    <span class="sr-only">40% Complete (success)</span>
                </div>
            </div>
            <div class="todo_list">
                <div class="todo-info-tag">
                    <p class="badge_todo">총 :
                        <span id="todo-badge" class="badge">
                            <c:set var="todoTotal" value="${todoList[0].total}"/>
                            <c:choose>
                                <c:when test="${empty todoTotal}">
                                    0
                                </c:when>
                                <c:otherwise>
                                    ${todoTotal}
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </p>
                    <p class="badge_total_todo">등록된 Todo :
                        <span id="todo_total_badge" class="badge">
                             <c:set var="todoRegTotal" value="${todoList[0].todoTotal}"/>
                                <c:choose>
                                    <c:when test="${empty todoRegTotal}">
                                        0
                                    </c:when>
                                    <c:otherwise>
                                        ${todoRegTotal}
                                    </c:otherwise>
                                </c:choose>
                        </span>
                    </p>
                </div>
                <table class="table table-bordered">
                    <colgroup>
                        <col width="5%">
                        <col width="80%">
                        <col width="15%">
                    </colgroup>
                    <tr>
                        <th>번호</th>
                        <th>Todo</th>
                        <th>등록날짜</th>
                    </tr>
                    <c:forEach items="${todoList}" var="todo" varStatus="status">
                        <tr>
                            <td id="todo_num">${status.index + 1}</td>
                            <td>
                                <div class="todo_item">
                                    <button type="button" class="btn btn-danger delete_todo" data-get-id=${todo.id}>삭제</button>
                                    <button type="button" class="detail_button" data-get-id=${todo.id}>
                                        ${todo.todo}
                                        <c:if test="${todo.todo_set}">
                                            <span class="badge">Todo!</span>
                                        </c:if>

                                        <c:set var="img" value="${todo.imageSrc}"/>
                                        <c:choose>
                                            <c:when test="${empty img}">
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge">img</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </button>
                                </div>
                            </td>
                            <td class="create_date">
                                    ${todo.createdDate}
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="todo_check">
                <h3 class="todo-title">Todo 해야할일<span class="todo-check-label">총 : <span id="todo-check-badge" class="badge">${todoCheck.size()}</span></span></h3>
                <c:forEach items="${todoCheck}" var="todocheck" varStatus="status">
                    <div class="panel panel-default todo-check-item">
                        <div class="panel-heading"><h3>ToDo Check!!</h3></div>
                        <div class="panel-body">
                                ${todocheck.todo}
                                <c:set var="imageSrc" value="${todocheck.imageSrc}"/>
                                <c:choose>
                                    <c:when test="${empty imageSrc}">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="image_tag">
                                            <img src="<c:url value="resources/img/"/>${imageSrc}" alt="">
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            <div class="todo-check-info">
                                <button type="button" class="btn btn-success todo-success" value=${todocheck.id}>Todo 완료</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
                        <div class="image_src_input">
                            <label for="image_src">이미지 있을시 이미지이름만<input id="image_src" type="text" name="imageSrc"></label>
                        </div>
                        <div class="todo_check">
                            <label for="is_todo">투두 등록 : <input id="is_todo" type="checkbox" name="todo_set"></label>
                        </div>
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
