$(function(){
    handleModalTodoOpen();
    todoListOpenDetail();
    HandleDeleteTodo();
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

function CommonAjax(data) {
    $.ajax({
        url : `/delete/?id=${data}`,
        type : 'GET',
        dataType : 'text/html; charset=utf-8',
        data : data,
        success : function(result){
            console.log(result);
            if(result){
                location.reload();
            }
        },
        error : function(a,b,c){
            console.log(`${a} : ${b} : ${c}`);
        }
    });

}