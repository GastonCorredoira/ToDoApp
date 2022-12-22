{include file="header.tpl"}

<div id="wrapper">
    <div id="contenedor">
        <div class="card mb-3 shadow p-3 mb-5 bg-body rounded" id="divContent" style="max-width: 1200px;">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="https://i.scdn.co/image/ab67706f0000000395c94a38840f54b062b8739d"
                        class="img-fluid rounded-start" alt="loginPhoto">
                </div>
                <div class="col-md-7" style="margin-left: 10px;">
                    <div class="card-body">
                        <h3 style="margin-bottom: 10px;">Error trying to delete the album</h3>

                        <h5 style="margin-top: 20px;">There are items referenced to this album, so you should remove
                            them first</h5>

                        <p>You can:</p>
                        <p style="margin-top: 20px;">View album <a href="album/view/{$id}" class="yellow">here</a></p>
                        <p style="margin-top: 40px;">Delete all items referenced to this album <a
                                href="album/deleteSongs/{$id}" class="yellow">clicking here</a></p>
                        <div id="emailHelp" class="form-text">Watch out! You have to be sure of what you are doing when
                            using this function</div>



                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}