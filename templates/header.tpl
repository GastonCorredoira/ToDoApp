<!DOCTYPE html>
<html lang="en">

<head>
  <base href="{BASE_URL}">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="./css/style.css">
  <title>GFY</title>
</head>

<body id="bootstrap-overrides">

  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="home">GFY</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="home">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="albums">View all Albums</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="songs">View all Songs</a>
          </li>
          {if !empty($smarty.session)}
            {if $smarty.session.rol == "Admin"}
              <li class="nav-item">
                <a class="nav-link" href="album/add">Add a new Album</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="song/add">Add a new Song</a>
              </li>
            {/if}
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                {$smarty.session.username}
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="userProfile">Profile</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="logout">Logout</a></li>
              </ul>
            </li>
          {/if}

          {if empty($smarty.session)}
            <li class="nav-item">
              <a class="nav-link" href="login">Log In into an account</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="register">Register a new account</a>
            </li>
          {/if}

        </ul>
        {if isset($smarty.session)}
          <form class="d-flex" role="search" method="POST" action="search" name="searchForm" id="searchForm">
            <input class="form-control me-2" type="search" placeholder="Search Album/Song" aria-label="Search"
              name="search" id="name=" search">
          <button class="btn btn-outline-warning" type="submit">Search</button>
          </form>
        {/if}
      </div>
    </div>
  </nav>
</nav>