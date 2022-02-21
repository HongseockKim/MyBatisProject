$(function(){
    percentsEvent();
    handleModalTodoOpen();
    todoListOpenDetail();
    HandleDeleteTodo();
    todoRegister();
});

function percentsEvent(){
    let todoItem =  $('.todo_item');
    let todoCheckItem = $('.todo-check-item');

    $('#todo-badge').text(todoItem.length);
    $('#progress-bar-todo').css({'transition':'all 0.5s','width': (todoCheckItem.length / todoItem.length) * 100 + "%"});
}

function todoRegister(){
    let checkbox = $('#is_todo');
    let todoSuccess = $('.todo-success');

    $('.todo-registration').on('click', function(){
        checkbox.prop('checked') ? checkbox.val(true) : checkbox.val(false);
    });

    todoSuccess.on('click', function(){
        let getId = $(this).val();

        $.ajax({
            url : `/success/?id=${getId}`,
            type : 'GET',
            dataType : 'text',
            success : function(result){
                location.reload();
            },
            error : function(a,b,c){
                console.log(`${a} : ${b} : ${c}`);
            }
        });
    })
}

function handleModalTodoOpen() {
    $('#todoModal').on('click', function(){
        $('#myModal').modal('show');
    });
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
    });
}

function todoListOpenDetail() {
    $('.detail_button').on('click', function(){
        let getId = $(this).data('get-id');
        $.ajax({
            url : `/detail/?id=${getId}`,
            type : 'GET',
            dataType : 'text',
            data : getId,
            success : function(result){
                if(result){
                    location.href = `detail?id=${getId}`
                }
            },
            error : function(a,b,c){
                console.log(`${a} : ${b} : ${c}`);
            }
        });
    })
}

function HandleDeleteTodo() {
    $('.delete_todo').on('click', function(){
        let getId = $(this).data('get-id');
        CommonAjax(Number(getId));
    });
}


function CommonAjax(data) {
    $.ajax({
        url : `/delete/?id=${data}`,
        type : 'GET',
        dataType : 'text',
        data : data,
        success : function(result){
            if(result){
                location.reload();
            }
        },
        error : function(a,b,c){
            console.log(`${a} : ${b} : ${c}`);
        }
    });
}