let genre = 1;
let page = 1;

function cargar() {
    $.ajax({
//        url: "filmsWithPagination.php",
                url: "src/components/films/filmsWithPagination.php",
        data: {
            genreId: genre,
            pag: page
        },
        dataType: "html"
    }).done(function (resp) {
        $("#films").html(resp);

//        $("#anterior").click(function () {
//            pagina--;
//            cargar();
//        });
//
//        $("#siguiente").click(function () {
//            pagina++;
//            cargar();
//        });

    }).fail(function () {
        alert("error al cargar la pagina");
    });
}

$(document).ready(function () {

    $(".genre").click(function () {
        genre = $(this).attr("genreId");
        page = 1;
        cargar();
    });
    cargar();
});

