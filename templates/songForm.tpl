{include file="header.tpl"}
<div id="wrapper">
    <div id="contenedor">
        <div class="card mb-3 shadow p-3 mb-5 bg-body rounded" id="divContent" style="max-width: 1200px;">
            <div class="row g-0">
                <div class="col-md" style="margin-left: 10px;">
                    <div class="card-body">
                        <form method="POST" action="song/{$type}" name="songForm" id="songForm">
                            {if $type == "edit"}
                                <h3>Modify song</h3>
                            {/if}
                            {if $type == "create"}
                                <h3>Add new song</h3>
                            {/if}
                            {if $type == "edit"}
                                <div class="mb-3">
                                    <label class="form-label">ID</label>
                                    <input type="text" class="form-control" name="id" id="id" readonly required>
                                </div>
                            {/if}
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" name="name" id="name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Duration</label>
                                <input type="text" class="form-control" name="duration" id="duration" required>
                            </div>
                            <select class="form-select selectForm" name="albumID" id="albumID">
                                <option selected>Select album</option>
                                {foreach from=$albums item=album}
                                    <option value="{$album->id}" required {if $type == "edit"}
                                            {if $album->id == $song->id_album_fk} selected {/if} {/if}>{$album->albumname}
                                        </option>
                                    {/foreach}
                                </select>
                                <input type="submit" style="margin-top: 10px;" class="btn btn-warning"
                                    value="Send"></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {if $type == "edit"}
        <script>
            document.songForm.id.value = "{$song->id}";
            document.songForm.name.value = "{$song->name}";
            document.songForm.duration.value = "{$song->duration}";
            document.songForm.albumID.select = "{$album->albumname}";
        </script>
    {/if}
    
    {include file="footer.tpl"}