{include file="header.tpl"}
<div id="wrapper">
    <div id="contenedor">
        <div class="card mb-3 shadow p-3 mb-5 bg-body rounded" id="divContent" style="max-width: 1200px; height: 60%; text-align: center;">
            <div class="row g-0">
                <div class="col-md-8">
                    <div class="card-body">
                        <h3 style="margin-bottom: 10px;">Welcome back,</h3>
                        <form method="POST" action="verifyLogin" name="login" id="login">
                            <div class="mb-3" style="text-align: center;">
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
                            <input type="submit" id="signUpBtn" value="Log in"></input>
                        </form>
                    </div>
                </div>
                <div class="col-md-4" id='newUser'>
                <div class="card-body">
                    <h3 style="margin: 15px 0 10px 0;">New here?</h3>
                    <p>Sign up and discover great amount of new opportunities! Click the button below</p>
                    <button type="submit" id="signUpBtn" value="Log in"><a href="register" class="hidden">SIGN UP</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{include file="footer.tpl"}