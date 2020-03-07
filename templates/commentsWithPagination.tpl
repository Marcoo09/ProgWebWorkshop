<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <script src="../../../js/jquery-3.4.1.min.js"></script>
</head>

<div class="page-header">
    <h1>Comentarios</h1>
</div> 
<div>
    {foreach from=$comentarios item=com name=count}

        {if (($smarty.foreach.count.iteration > ($page-1)*5)&&($smarty.foreach.count.iteration <= $page*5))}
            {if (isset($userLogued)) && $userLogued.is_admin}
                <div class="media">
                    <div class="media-body">
                        <h4 class="media-heading user_name">{$com.estado}</h4>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading user_name">{$com.id_usuario}</h4>
                        {$com.mensaje}
                    </div>
                    <div class="action">
                        <a href="doApprove.php?commentId={$com.id}&filmId={$com.id_pelicula}">
                            <button type="button" id="approve" title="Approved">
                                <i class="fas fa-check-square"></i>
                            </button>
                        </a>
                        <a href="doDenie.php?commentId={$com.id}&filmId={$com.id_pelicula}">
                            <button type="button" id="denie" title="denie">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </a>
                    </div>
                </div>
                {elseif ($com.estado == 'APROBADO')}
                    <div class="media">
                        <div class="media-body">
                            <h4 class="media-heading user_name">{$com.id_usuario}</h4>
                            {$com.mensaje}
                        </div>
                    </div>                    

            {/if}

        {/if}

    {/foreach}
    <div id="paginacion">
        <button id="back" {if ($page<=1)}disabled{/if}>Anterior</button>
        Pagina {$page} de {$pages}
        <button id="next" {if ($page>=$pages)}disabled{/if}>Siguiente</button>
    </div>
</div>