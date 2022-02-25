<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.Todo" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<%@ include file="header.jsp"%>
<body id="expansion">
<div id="expansion-wrap">
    <header class="expansion-header">
        <div class="header_inner">
            <h2 class="expansion-title">Todo</h2>
            <div class="expansion-menu">
                <ul class="expansion-nav">
                    <li class="expansion-item">
                        <button type="button" class="expansion-btns todo-additional-plan">추가계획</button>
                    </li>
                    <li class="expansion-item">
                        <button type="button" class="expansion-btns todo-tracking-progress">진행현황</button>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <main class="expansion-main">
        <div class="main_inner">
            <div class="content-con">

            </div>
            <div class="expansion-todo-content">
                ${CheckTodo.todo}
            </div>
        </div>
    </main>
    <footer>

    </footer>
</div>
<%--additional-plan modal--%>
<div class="modal fade" id="additional-plan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close additional-plan-close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">추가계획</h4>
            </div>
            <div class="modal-body">
                <form action="addTodo" method="post">
                    <div class="additional-area">

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="todo-registration">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
