<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Avengers Movie Card UI</title>
        <link rel = "stylesheet" href = "css/index.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>

    <body>
        <div class='filmsContainer'>
            {foreach from=$films item=film name=count}

                {if (($smarty.foreach.count.iteration > ($page-1)*6)&&($smarty.foreach.count.iteration <= $page*6))}

                    <a href="src/scenes/filmDetail/filmDetail.php?filmId={$film.id}" class="film" filmId="{$film.id}">
                        <div class="card">
                            <div class="poster"><img src = "img_films/{$film.id}"></div>
                            <div class="details">
                                <h2>{$film.titulo}
                                    <br>
                                    <span>{$film.director}</span></h2>

                                <div class="rating">
                                    {if $film.puntuacion >= 1}
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    {else}
                                        <i class="fa fa-star ratingUnSelected" aria-hidden="true"></i>
                                    {/if}
                                    {if $film.puntuacion >= 2}
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    {else}
                                        <i class="fa fa-star ratingUnSelected" aria-hidden="true"></i>
                                    {/if}
                                    {if $film.puntuacion >= 3}
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    {else}
                                        <i class="fa fa-star ratingUnSelected" aria-hidden="true"></i>
                                    {/if}
                                    {if $film.puntuacion >= 4}
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    {else}
                                        <i class="fa fa-star ratingUnSelected" aria-hidden="true"></i>
                                    {/if}
                                    {if $film.puntuacion >= 5}
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    {else}
                                        <i class="fa fa-star ratingUnSelected" aria-hidden="true"></i>
                                    {/if}
                                    <span>{$film.puntuacion}/5</span>
                                </div>

                                <div class="tags">
                                    {if $film.id_genero == 1}
                                        <span class="action">{$arrayGenres[$film.id_genero]}</span>

                                    {elseif $film.id_genero== 2}
                                        <span class="adventure">{$arrayGenres[$film.id_genero]}</span>

                                    {elseif $film.id_genero == 3}
                                        <span class="comedy">{$arrayGenres[$film.id_genero]}</span>

                                    {elseif $film.id_genero == 4}
                                        <span class="drama">{$arrayGenres[$film.id_genero]}</span>

                                    {elseif $film.id_genero == 5}
                                        <span class="music">{$arrayGenres[$film.id_genero]}</span>

                                    {elseif $film.id_genero == 6}
                                        <span class="terror">{$arrayGenres[$film.id_genero]}</span>

                                    {elseif $film.id_genero == 7}
                                        <span class="fantasy">{$arrayGenres[$film.id_genero]}</span>

                                    {elseif $film.id_genero == 8}
                                        <span class="suspense">{$arrayGenres[$film.id_genero]}</span>

                                    {elseif $film.id_genero == 9}
                                        <span class="childs">{$arrayGenres[$film.id_genero]}</span>
                                    {else}
                                        <span class="default">{$arrayGenres[$film.id_genero]}</span>
                                    {/if}
                                </div>

                                <div class="info">
                                    <p class="wrapText">{$film.resumen}</p>
                                </div>

                                <div class="star">
                                    <h4>Cast</h4>
                                    <ul>
                                        <li><img src = "https://www.famousbirthdays.com/headshots/robert-downey-jr-2.jpg"></li>
                                        <li><img src = "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTU1MTM0NzA2NzQ3MTg4NDQw/chris-evans-arrives-at-the-los-angeles-premiere-of-captain-america-the-winter-soldier-held-at-the-el-capitan-theatre-on-march-13-2014-in-hollywood-california-photo-by-michael-tran_filmmagicjpg-square.jpg"></li>
                                        <li><img src = "https://www.india-forums.com/images/celebrity/l_12804.jpg"></li>
                                        <li><img src = "https://imageresizer.static9.net.au/LYRtJfSVUFCURsyAlx6qdMXJzwI=/400x0/http%3A%2F%2Fprod.static9.net.au%2F_%2Fmedia%2FNetwork%2FImages%2Favengers300616Scarjo.jpg"></li>
                                        <li><img src="https://www.famousbirthdays.com/faces/boseman-chadwick-image.jpg"></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </a>
                {/if}

            {/foreach} 
        </div>

    </body>
</html>


<div class="pagination">
    {if ($page<=1)}
        <li class="page-item disabled"><a class="" id="back" href="#">&laquo;</a></li>
    {else}
        <li class="page-item disabled"><a class="" id="back" href="#">&laquo;</a></li>
    {/if} 
    <li class="page-item disabled"><a class="" href="#">{$page}</a></li>
    <li class="page-item disabled"><a class="" href="#">De</a></li>
    <li class="page-item disabled"><a class="" href="#">{$pages}</a></li>
    {if ($page>=$pages)}
        <li class="page-item disabled"><a class="" id="next" href="#">&raquo;</a></li>
    {else}
        <li class="page-item"><a class="" id="next" href="#">&raquo;</a></li>
    {/if}
</div>