let genre = 1;
let page = 1;
let searchText = "";
let filterType = "title";

function load() {
    $.ajax({
        url: "src/components/films/filmsWithPagination.php",
        data: {
            genreId: genre,
            pag: page,
            searchText: searchText,
            filterType: filterType
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

    $("#searchButton").click(() => {
        genre = $(this).attr("genreId");
        searchText = $("#searchField").val();
        filterType = $("input[name='filterType']:checked").val();
        page = 1;
        load();
    });
    
    $(".genre").click(function () {
        genre = $(this).attr("genreId");
        page = 1;
        load();
    });
    load();
});

