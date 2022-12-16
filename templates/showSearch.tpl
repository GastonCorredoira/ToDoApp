{include file="header.tpl"}

<div class="container text-center">
    <div class="row row-cols-3">

        {foreach from=$results item=result}
            <div class="col">
                <div class="card shadow mb-5 bg-body rounded" style="width: 18rem; margin-top: 30px;">
                    <img src="{$result->logo}" class="card-img-top" alt="album{$result->id}logo">
                    <div class="card-body">
                        <h5 class="card-title">{$result->name}</h5>
                        <p class="card-text">{$result->artist}</p>
                        <a href="album/view/{$result->id}" class="btn btn-warning">View Album</a>
                        <div>
                            {if !empty($smarty.session)}
                                {if $smarty.session.rol == "Admin"}
                                    <a href="album/modify/{$result->id}" style="margin-top: 10px;"
                                        class="btn btn-sm btn-outline-warning">Modify</a>
                                    <a href="album/delete/{$result->id}" style="margin-top: 10px;"
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