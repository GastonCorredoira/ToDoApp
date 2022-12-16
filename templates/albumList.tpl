{include file="header.tpl"}

<div class="container text-center">
    <div class="row row-cols-3">

        {foreach from=$albums item=album}
            <div class="col">
                <div class="card shadow mb-5 bg-body rounded" style="width: 18rem; margin-top: 30px;">
                    <img src="{$album->logo}" class="card-img-top" alt="album{$album->id}logo">
                    <div class="card-body">
                        <h5 class="card-title">{$album->albumname}</h5>
                        <p class="card-text">{$album->artist}</p>
                        <a href="album/view/{$album->id}" class="btn btn-warning">View Album</a>
                        <div>
                            {if !empty($smarty.session)}
                                {if $smarty.session.rol == "Admin"}
                                    <a href="album/modify/{$album->id}" style="margin-top: 10px;"
                                        class="btn btn-sm btn-outline-warning">Modify</a>
                                    <a href="album/delete/{$album->id}" style="margin-top: 10px;"
                                        class="btn btn-sm btn-outline-warning">Delete</a>
                                {/if}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}

    </div>
</div>

{include file="footer.tpl"}