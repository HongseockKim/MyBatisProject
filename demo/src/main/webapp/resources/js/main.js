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
    contentReference();
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

function contentReference() {
    let referenceModal = $('.reference-modal');
    $('.reference-btn').on('click', function(){
        if ($(this).siblings('.reference-modal').hasClass('on')) {
            referenceModal.removeClass('on');
            $(this).siblings('.reference-modal').removeClass("on");
        } else{
            referenceModal.removeClass('on');
            $(this).siblings('.reference-modal').addClass("on");
            $.ajax({
                url : `/reference/list`,
                method: "GET",
                dataType : 'json',
                success : function(result){
                    let todoListItem = '';
                    let referenceModal = $('.reference-modal .modal-inner');
                    if(result) {
                        for(let todoList of result.todoList){
                            todoListItem += '<button class="todo-list-item" type="button" style="display:block;width:100%;outline:none;">'
                            todoListItem += `<ul class="todoList" id="${todoList.id}">`;
                            todoListItem += `<li class="todoList-item"><span class="todo">${todoList.todo}</span><span class="createdDate">${todoList.createdDate}</span></li>`;
                            todoListItem += '</ul>';
                            todoListItem += '</button>'
                        }
                        todoListGet();
                    } else{
                        todoListItem += '<ul class="todoList">';
                        todoListItem += `<li> 조회된 TODO 가 없습니다.</li>`;
                        todoListItem += '</ul>';
                    }
                    referenceModal.children().not('.notice').remove();
                    referenceModal.append(todoListItem);

                },
                error : function(a,b,c){
                    console.log(`${a} : ${b} : ${c}`);
                }
            });

            function todoListGet(){
                $('.todo-list-item').on('click', function(){
                    console.log($(this).children('.todoList').attr('id'));

                    referenceModal.removeClass('on');
                });
            }
        }


    });
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

function contentRegeister(){
    let imgSrc =  $('.img-src').val() ? $('.img-src').val() : "default";
    let contentTitle =  $('.content-title').val() ? $('.content-title').val() : "default";
    let content =  $('.content').val() ? $('.content').val() : "default";

    $.ajax({
        "url": "/addcontent",
        "method": "POST",
        "dataType": "json",
        "data": {
            "imgSrc": imgSrc,
            "contentTitle": contentTitle,
            "content": content
        },
    }).done(function (response) {
        console.log(response);
        response ? location.href ="/" : null;
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