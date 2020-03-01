<h2>Films</h2>
<ul>
    {foreach from=$films item=film}
        <li>
            <a href="src/scenes/filmDetail/filmDetail.php?filmId={$film.id}" class="film" filmId="{$film.id}">
                {$film.titulo}
            </a>
        </li>
    {/foreach}
</ul>

{*<div id="paginacion">
    <button id="anterior" {if ($pagina<=1)}disabled{/if}>Anterior</button>
    Pagina {$pagina} de {$paginas}
    <button id="siguiente" {if ($pagina>=$paginas)}disabled{/if}>Siguiente</button>
</div>*}