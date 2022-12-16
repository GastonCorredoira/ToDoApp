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
                        <h2>Edit your {$type}</h2>
                        <form method="POST" action="edit{$type}" name="edit{$type}" id="edit{$type}"
                            enctype="multipart/form-data">
                            <div class="mb-3">
                            </div>
                            {if $type != "profilepicture"}
                                <div class="mb-3">
                                    <label class="form-label">
                                        <h3>New {$type}:</h3>
                                    </label>
                                    <input {if $type != "password"} type="text" {/if} {if $type == "password"}
                                    type="password" {/if} class="form-control" name="edit" id="edit" required>
                            </div>
                            {/if}
                            {if $type == "profilepicture"}

                                <label class="form-label">
                                    <h3>New {$type}:</h3>
                                </label>
                                <input type="file" class="form-control" name="input_name" id="imageToUpload"
                                    style="margin-bottom: 15px">

                            {/if}
                            <input type="submit" class="btn btn-outline-warning" value="Send"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.edit{$type}.edit.value = "{$smarty.session.{$type}}";
</script>


{include file="footer.tpl"}