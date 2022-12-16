{include file="header.tpl"}

<div id="wrapper">
    <div id="contenedor">
        <div class="card mb-3 shadow p-3 mb-5 bg-body rounded" id="divContent" style="max-width: 1200px;">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="{$album->logo}" width=200 alt="albumLogo">
                </div>
                <div class="col-md-7" style="margin-left: 10px;">
                    <div class="card-body">
                        <h2>Name: {$song->name}</h2>
                        <h5>Artist: {$album->artist}</h5>
                        <h5>Album: {$album->albumname}</h5>
                        <h5>Duration: {$song->duration}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}