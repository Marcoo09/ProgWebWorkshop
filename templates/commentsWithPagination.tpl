<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <script src="../../../js/jquery-3.4.1.min.js"></script>
</head>

{if $quantityOfComments > 0}
    <div class="page-header">
        <h1>Comentarios</h1>
    </div> 
{/if}
<div>
    <ul class="media-list">
        {foreach from=$comentarios item=com name=count}
            {if ((($smarty.foreach.count.iteration > ($page-1)*5)&&($smarty.foreach.count.iteration <= $page*5)) || $quantityOfComments <= $page*5)
            }
            {if (isset($userLogued)) && $userLogued.is_admin}
                <hr>
                <li class="media">
                    <a href="#" class="pull-left">
                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">{$com.estado}</h4>
                        <span class="text-muted pull-right">
                            <small class="text-muted"> a while ago</small>
                        </span>
                        <strong class="text-success">@{$com.id_usuario}</strong>
                        <p>
                            {$com.mensaje}
                            </a>.
                        </p>
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
                </li>
            {elseif ($com.estado == "APROBADO")}
                <hr>
                <li class="media">
                    <a href="#" class="pull-left">
                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
                    </a>
                    <div class="media-body">
                        <span class="text-muted pull-right">
                            <small class="text-muted"> a while ago</small>
                        </span>
                        <strong class="text-success">@{$com.id_usuario}</strong>
                        <p>
                            {$com.mensaje}
                            </a>.
                        </p>
                    </div>
                </li>
            {/if}

            {/if}

                {/foreach}
                </ul>

                {if $quantityOfComments > 0}

                    <div class="pagination">
                        {if ($page<=1)}
                            <li class="page-item disabled"><a class="" id="back" href="#">&laquo;</a></li>
                            {else}
                            <li class="page-item"><a class="" id="back" href="#">&laquo;</a></li>
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
                {/if}

            </div>