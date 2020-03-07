<h2>Films</h2>

<ul>
    {foreach from=$films item=film name=count}

        {if (($smarty.foreach.count.iteration > ($page-1)*6)&&($smarty.foreach.count.iteration <= $page*6))}

            <li>
                <a href="src/scenes/filmDetail/filmDetail.php?filmId={$film.id}" class="film" filmId="{$film.id}">
                    {$film.titulo}
                </a>
            </li>
        {/if}

    {/foreach}
</ul>

<div id="paginacion">

    <nav aria-label="Page navigation example">
        <ul class="pagination">
                {if ($page<=1)}
                     <li class="page-item disabled"><a class="page-link" id="back" href="#">Previous</a></li>
                {else}
                     <li class="page-item"><a class="page-link " id="back" href="#">Previous</a></li>
                {/if}               

                    <li class="page-item"><a class="page-link" href="#">{$page}</a></li>
                    <li class="page-item"><a class="page-link" href="#">De</a></li>
                    <li class="page-item"><a class="page-link" href="#">{$pages}</a></li>
                {if ($page>=$pages)}
                       <li class="page-item disabled"><a class="page-link" id="next" href="#">Next</a></li>
                {else}
                    <li class="page-item"><a class="page-link" id="next" href="#">Next</a></li>
                {/if}
        </ul>
    </nav>



</div>