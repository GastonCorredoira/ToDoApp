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
                        <h3 style="margin-bottom: 30px;">Register</h3>
                        <form method="POST" action="verifyRegister" name="register" id="register">
                            <div class="mb-3">
                                <label class="form-label">
                                    <h5>Email</h5>
                                </label>
                                <input type="email" class="form-control" name="email" id="email" required>
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    <h5>Username</h5>
                                </label>
                                <input type="text" class="form-control" name="username" id="username" required>
                                <div id="emailHelp" class="form-text">Tell us how you want to appear on our page.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    <h5>Password</h5>
                                </label>
                                <input type="password" class="form-control" name="password" id="password" required>
                                <div id="emailHelp" class="form-text">We recommend that you set a strong password.</div>
                            </div>
                            <input type="submit" class="btn btn-warning" value="Register"></button>
                            <p>Already a member? <a href="login" class="yellow">Sign in</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<p>{$error}</p>
{include file="footer.tpl"}