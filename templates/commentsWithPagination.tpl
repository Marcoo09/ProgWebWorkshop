<h2>Commentarios</h2>

<ul>
    {foreach from=$comentarios item=com name=count}
        
        {if (($smarty.foreach.count.iteration > ($page-1)*5)&&($smarty.foreach.count.iteration <= $page*5))}
            {if ($com.estado == 'APROBADO')}
            <li>
                        <label>
                        Usuario: {$com.id_usuario}:{$com.mensaje}
                        </label>               
            </li>
            {/if}
        {/if}
         
    {/foreach}
</ul>

<div id="paginacion">
    <button id="back" {if ($page<=1)}disabled{/if}>Anterior</button>
    Pagina {$page} de {$pages}
    <button id="next" {if ($page>=$pages)}disabled{/if}>Siguiente</button>
</div>