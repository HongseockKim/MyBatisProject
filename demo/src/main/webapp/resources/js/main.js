$(function(){
    percentsEvent();
    handleModalTodoOpen();
    todoListOpenDetail();
    HandleDeleteTodo();
    todoRegister();
    ExpansionCheckTodo();
    todoAdditionalPlan();
    HandleHistoryBack();
    TodoSubAdd();
});
function todoAdditionalPlan(){
    $('.todo-additional-plan').on('click', function(){
        $('#additional-plan').modal('show');
    });
}

function HandleHistoryBack(){
    // data-history="data-history" 클릭 공통처리
    $('[data-history="data-history"]').on('click', function(){
       window.history.back();
    });
}

function percentsEvent(){
    let todoItem =  $('.todo_item');
    let todoCheckItem = $('.todo-check-item');

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

function ExpansionCheckTodo(){
    let getCheckTodoId = undefined;
    $('.expansion-btn').on('click', function(){
        getCheckTodoId = $(this).val();
        console.log('checkTodoGetId' + getCheckTodoId);
        location.href = `expansion/?getCheckId=${getCheckTodoId}`;
    });
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

function TodoSubAdd() {
    let addNum = 2;
    let todoSubListWrap = $('.todo_sub_info');


    $('.todo_sub_add').on('click', function(){
        let todoSubListItem = `<li class="todo_sub">
                                     <label for="todo_sub_0${addNum}">
                                        추가0${addNum}<input id="todo_sub_0${addNum}" type="text" name="todo_sub_0${addNum}">
                                     </label>
                                     <button type="button" class="todo_sub_delete" data-index=""${addNum}+"">X</button>
                                </li>`;

        todoSubListWrap.append(todoSubListItem);
        addNum++;


        $('.todo_sub_delete').on('click', function(){
            console.log($(this).parent('li').index());
            let todoSubListItem = $(this).parent('li');
            todoSubListItem.remove();
            addNum--;
        });
        console.log(addNum);
    })


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