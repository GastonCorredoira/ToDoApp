{include file="header.tpl"}

<div id="wrapper">
    <div id="contenedor">
        <div class="card mb-3 shadow p-3 mb-5 bg-body rounded" id="divContent" style="max-width: 1200px;">
            <div class="row g-0">
                <div class="col-md-4">
                    <img {if isset($smarty.session.profilepicture)} src="{$smarty.session.profilepicture}" {/if}
                        {if !isset($smarty.session.profilepicture)}
                        src="https://i.scdn.co/image/ab67706f0000000395c94a38840f54b062b8739d" {/if}
                        class="img-fluid rounded-start" alt="profilePicture">
                </div>
                <div class="col-md-7" style="margin-left: 10px;">
                    <div class="card-body">
                        <h2>Profile</h2>

                        <h5>User Name:</h5>
                        <p>{$smarty.session.username}</p>
                        <a href="userEditForm/username" class="btn btn-outline-warning btn-sm"
                            style="margin-bottom: 15px">Edit User Name</a>

                        <h5>Email:</h5>
                        <p>{$smarty.session.email}</p>
                        <a href="userEditForm/email" class="btn btn-outline-warning btn-sm"
                            style="margin-bottom: 15px">Edit Email</a>

                        <h5>Password:</h5>
                        <p>*****</p>
                        <a href="userEditForm/password" class="btn btn-outline-warning btn-sm"
                            style="margin-bottom: 15px">Edit Password</a>

                        <h5>Profile Picture:</h5>
                        <p>{$smarty.session.profilepicture}</p>
                        <a href="userEditForm/profilepicture" class="btn btn-outline-warning btn-sm">Edit Profile
                            Picture</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}