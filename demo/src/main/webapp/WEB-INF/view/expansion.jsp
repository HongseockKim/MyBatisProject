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
                    <li class="expansion-item">
                        <button type="button" class="expansion-btns todo-history-back" data-history="data-history">뒤로가기</button>
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
                <form action="additional" method="post">
                    <div class="additional-area">
                        <div class="additional">
                            <p class="additional-header"><label for="additional-textarea">추가 계획</label></p>
                            <textarea id="additional-textarea" name="additional"></textarea>
                        </div>
                        <div class="additional select-area">
                            <p>
                                <label for="difficulty">난이도</label>
                                <select name="difficulty" id="difficulty">
                                    <option value="상">상</option>
                                    <option value="중">중</option>
                                    <option value="하">하</option>
                                </select>
                            </p>
                            <div>
                                <button type="button" class="todo_sub_add">추가</button>
                            </div>
                            <ul class="todo_sub_info">
                                <li class="todo_sub"><label for="todo_sub_01">추가01<input id="todo_sub_01" type="text" name="todo_sub_01"></label><button type="button" class="todo_sub_delete">X</button></li>
                            </ul>
                        </div>
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
