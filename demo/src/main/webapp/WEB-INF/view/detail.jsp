<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file ="header.jsp"%>
<body>
<div class="todo_detail">
    <div class="todo_detail_header">
        <div class="page-header">
            <h1>Todo <small>!!!!</small></h1>
            <a href="/" class="close_detail">X</a>
        </div>
    </div>
    <div class="todo_detail_body">
        ${todoDetail.todo}
    </div>
    <div class="todo_detail_footer">

    </div>
</div>
</body>
</html>
