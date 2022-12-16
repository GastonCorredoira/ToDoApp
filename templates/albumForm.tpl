{include file="header.tpl"}

<div id="wrapper">
    <div id="contenedor">
        <div class="card mb-3 shadow p-3 mb-5 bg-body rounded" id="divContent" style="max-width: 1200px;">
            <div class="row g-0">
                <div class="col-md" style="margin-left: 10px;">
                    <div class="card-body">
                        <form method="POST" action="album/{$type}" name="albumForm" id="albumForm"
                            enctype="multipart/form-data">
                            {if $type == "edit"}
                                <h3>Modify album</h3>
                            {/if}
                            {if $type == "create"}
                                <h3>Add new album</h3>
                            {/if}
                            {if $type == "edit"}
                                <div class="mb-3">
                                    <label class="form-label">Album ID</label>
                                    <input type="text" class="form-control" name="id" id="id" readonly>
                                </div>
                            {/if}
                            <div class="mb-3">
                                <label class="form-label">Album name</label>
                                <input type="text" class="form-control" name="albumname" id="albumname" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Artist</label>
                                <input type="text" class="form-control" name="artist" id="artist" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Genre</label>
                                <input type="text" class="form-control" name="genre" id="genre" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Year</label>
                                <input type="number" class="form-control" name="year" id="year" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Logo</label>
                                <input type="file" class="form-control" name="input_name" id="imageToUpload"
                                    style="margin-bottom: 15px">
                            </div>
                            <input type="submit" class="btn btn-warning" value="Send"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{if $type == "edit"}
    <script>
        document.albumForm.id.value = "{$album->id}";
        document.albumForm.albumname.value = "{$album->albumname}";
        document.albumForm.artist.value = "{$album->artist}";
        document.albumForm.genre.value = "{$album->genre}";
        document.albumForm.year.value = "{$album->year}";
    </script>
{/if}

{include file="footer.tpl"}