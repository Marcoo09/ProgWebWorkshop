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

$(document).ready(function () {

    $("#searchButton").click(() => {
        genreId = 0;
        searchText = $("#searchField").val();
        filterType = $("input[name='filterType']:checked").val();
        page = 1;
        load();
    });
    
    $(".genre").click(function () {
        $("#searchField").val("");
        searchText = "";
        genreId = $(this).attr("genreId");
        page = 1;
        load();
    });
    load();
});

