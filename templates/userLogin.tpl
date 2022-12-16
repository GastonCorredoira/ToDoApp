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
                        <h3 style="margin-bottom: 10px;">Sign In</h3>
                        <form method="POST" action="verifyLogin" name="login" id="login">
                            <div class="mb-3">
                                <label class="form-label">
                                    <h5>Email</h5>
                                </label>
                                <input type="text" class="form-control" name="email" id="email" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    <h5>Password</h5>
                                </label>
                                <input type="password" class="form-control" name="password" id="password" required>
                            </div>
                            <input type="submit" class="btn btn-warning" value="Log in"></button>
                            <p style="margin-top: 20px;">Not a member? <a href="register" class="yellow">Sign up</a></p>
                            <p>Don't you want to log in? <a href="home" class="yellow">Enter anyways</a></p>
                            <p>{$param}
                            <p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}