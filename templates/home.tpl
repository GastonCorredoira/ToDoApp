{include file="header.tpl"}

{if empty($smarty.session)}
    <div class="alert alert-warning" role="alert" style="text-align: center;">
        <p>You are not logged in, if you want to access all our features, please <a href="login" class="alert-link">log
                in</a></p>
    </div>
{/if}

<h3>Best albums for you</h3>

<div class="container text-center">
    <div class="row row-cols">
        {foreach from=$randomAlbums item=randomAlbum}
            <div class="col">
                <div class="card shadow mb-5 bg-body rounded" style="width: 18rem; margin-top: 30px;">
                    <img src="{$randomAlbum->logo}" class="card-img-top" alt="album{$randomAlbum->id}logo">
                    <div class="card-body">
                        <h5 class="card-title">{$randomAlbum->albumname}</h5>
                        <p class="card-text">{$randomAlbum->artist}</p>
                        <a href="album/view/{$randomAlbum->id}" class="btn btn-warning">View Album</a>
                        <div>
                            {if !empty($smarty.session)}
                                {if $smarty.session.rol == "Admin"}
                                    <a href="album/modify/{$randomAlbum->id}" style="margin-top: 10px;"
                                        class="btn btn-sm btn-outline-warning">Modify</a>
                                    <a href="album/delete/{$randomAlbum->id}" style="margin-top: 10px;"
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

<h3>Best song's pick for you</h3>

<ul class="list-group">
    {foreach from=$randomSongs item=randomSong}
        <li class="list-group-item">
            {foreach from=$albums item=album}
                {if ($album->id) == ($randomSong->id_album_fk)}
                    <a href="song/info/{$randomSong->id}"><img src="{$album->logo}" class="rounded" width=30 alt="albumLogo"></a>
                {/if}
            {/foreach}
            <a href="song/info/{$randomSong->id}" id="listedSong">{$randomSong->name}</a>
            {foreach from=$albums item=album}
                {if ($album->id) == ($randomSong->id_album_fk)}
                    (<a id="listedSong" href="album/view/{$randomSong->id_album_fk}">{$album->albumname}</a>)
                {/if}
            {/foreach}
            {if !empty($smarty.session)}
                {if $smarty.session.rol == "Admin"}
                    <a href="song/modify/{$randomSong->id}" class="btn btn-sm btn-outline-warning">Modify</a>
                    <a href="song/delete/{$randomSong->id}" class="btn btn-sm btn-outline-warning">Delete</a>
                {/if}
            {/if}
        </li>
    {/foreach}
</ul>

{include file="footer.tpl"}