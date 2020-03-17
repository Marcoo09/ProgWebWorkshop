let page = 1;
let filmId;  
let comment;    

function load() {
    $.ajax({
        url: "../../../src/components/films/commentsWithPagination.php",
        data: {      
            pag: page,
            Id: filmId,
            comment: comment,
        },
        type: "GET",
        dataType: "html"
    }).done(function (resp) {
        $("#commentlist").html(resp);

        $("#back").click(function () {
            page--;
            load();
        });

        $("#next").click(function () {
            page++;
            load();
        });

    }).fail(function () {
        alert("Error 404 not found");
    });
}
$(document).ready(function () {
    filmId = $("#filmId").val();       
    comment = $("#comment").val(); 
    load();
});

