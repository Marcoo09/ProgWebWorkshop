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
    <button id="back" {if ($page<=1)}disabled{/if}>Anterior</button>
    Pagina {$page} de {$pages}
    <button id="next" {if ($page>=$pages)}disabled{/if}>Siguiente</button>
</div>