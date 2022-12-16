{include file="header.tpl"}

{if $albumID != null}
    <div id="divPadre" style="text-align:center;">
        <div class="card shadow mb-5 bg-body rounded" id="divHijo" style="margin:30px auto 0 auto; width: 18rem;">
            <img src="{$albumList->logo}" class="card-img-top" alt="album{$albumList->id}logo">
            <h5 class="card-title">{$albumList->albumname}</h5>
            <div class="card-body">
                <p class="card-text">{$albumList->artist}</p>
                <div>
                    {if !empty($smarty.session)}
                        {if $smarty.session.rol == "Admin"}
                            <a href="album/modify/{$albumList->id}" style="margin-top: 10px;"
                                class="btn btn-sm btn-outline-warning">Modify</a>
                            <a href="album/delete/{$albumList->id}" style="margin-top: 10px;"
                                class="btn btn-sm btn-outline-warning">Delete</a>
                            <div>
                                <a href="album/deleteSongs/{$albumList->id}" style="margin-top: 10px;"
                                    class="btn btn-sm btn-outline-danger">Delete all songs</a>
                            </div>
                        {/if}
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/if}



<ul class="list-group">
    {foreach from=$songList item=song}
        <li class="list-group-item">
            {foreach from=$albumList item=album}
                {if isset($album->id)}
                    {if ($album->id) == ($song->id_album_fk)}
                        <img src="{$album->logo}" width=30 alt="albumLogo">
                    {/if}
                {/if}
            {/foreach}
            <a href="song/info/{$song->id}" id="listedSong">{$song->name}</a>
            {if $albumID == null}
                {foreach from=$albumList item=album}
                    {if ($album->id) == ($song->id_album_fk)}
                        (<a id="listedSong" href="album/view/{$song->id_album_fk}">{$album->albumname}</a>)
                    {/if}
                {/foreach}
            {/if}
            {if !empty($smarty.session)}
                {if $smarty.session.rol == "Admin"}
                    <a href="song/modify/{$song->id}" class="btn btn-sm btn-outline-warning">Modify</a>
                    <a href="song/delete/{$song->id}" class="btn btn-sm btn-outline-warning">Delete</a>
                {/if}
            {/if}
        </li>
    {/foreach}
</ul>

{include file="footer.tpl"}