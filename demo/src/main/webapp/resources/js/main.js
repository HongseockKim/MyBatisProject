$(function(){
    handleModalTodoOpen();
    todoListOpenDetail();
    HandleDeleteTodo();
    rightOpenPopup();
});

function handleModalTodoOpen() {
    $('#todoModal').on('click', function(){
        console.log("클릭");
        $('#myModal').modal('show');
    });
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
    });
}

function todoListOpenDetail() {
    $('.detail_button').on('click', function(){
        let getId = $(this).data('get-id');
        console.log(getId);
    })
}

function HandleDeleteTodo() {
    $('.delete_todo').on('click', function(){
        let getId = $(this).data('get-id');
        CommonAjax(Number(getId));
    });
}

function rightOpenPopup() {
    let popUpBtn = $('#openPopup');
    let rightPopupTag = $('#right-menu');
    rightPopupTag.hasClass('open') ? popUpBtn.text("닫기") : popUpBtn.text("열기");
    popUpBtn.on('click', function(){
        rightPopupTag.hasClass('open') ? rightPopupTag.removeClass('open') : rightPopupTag.addClass('open');
        rightPopupTag.hasClass('open') ? popUpBtn.text("닫기") : popUpBtn.text("열기");
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