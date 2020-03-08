let genreId = 0;
let page = 1;
let searchText = "";
let filterType = "title";

function load() {
    $.ajax({
        url: "src/components/films/filmsWithPagination.php",
        data: {
            genreId: genreId,
            pag: page,
            searchText: searchText,
            filterType: filterType
        },
        dataType: "html"
    }).done(function (resp) {        
        $("#films").html(resp);

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

$(window).on("load",function(){
    $(".loader-wrapper").fadeOut("slow");
});
        
$(document).ready(function () {

    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });


    $("#searchButton").on("click", function (event) {
        genreId = 0;
        searchText = $("#searchField").val();
        page = 1;
        load();
    });

    $("#Ftitle").on("click", function (event) {
        genreId = 0;
        filterType = "title";
        page = 1;
    });

    $("#Fgenre").on("click", function (event) {
        genreId = 0;
        filterType = "genre";
        page = 1;
    });

    $(".list-group-item").on("click", function (event) {
        $("#searchField").val("");
        searchText = "";
        genreId = $(this).attr("genreId");
        page = 1;
        load();
    });
    
   
    load();
});

