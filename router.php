<?php

require_once 'app/Controller/PageController.php';
require_once 'app/Controller/TaskController.php';
require_once 'app/Controller/LoginController.php';
require_once 'app/Controller/RegisterController.php';
require_once 'app/Controller/UserController.php';
require_once 'Helpers/AuthHelper.php';

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$action = 'home';
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}

$params = explode('/', $action);

$pageController = new PageController();
$taskController = new TaskController();
$loginController = new LoginController();
$registerController = new RegisterController();
$userController = new UserController();
$authHelper = new AuthHelper();

switch ($params[0]) {

        // LOGIN, LOGOUT, AUTH
    case 'login':
        $loginController->login();
        break;
    case 'logout':
        $authHelper->logout();
        break;
    case 'register':
        $registerController->register();
        break;
    case 'verifyRegister':
        $registerController->verifyRegister();
        break;
    case 'verifyLogin':
        $loginController->verifyLogin();
        break;
    case 'home':
        $pageController->showHome();
        break;
    case 'addTask':
        $taskController->createAlbum();
        break;

        // SONG
    case 'task':
        switch ($params[1]) {
            case 'info':
                $songController->showSongByID($params[2]);
                break;
            case 'add':
                $songController->songForm($params[1], null);
                break;
            case 'modify':
                $songController->songForm("edit", $params[2]);
                break;
            case 'delete':
                $songController->deleteSong($params[2]);
                break;

                // MODELS
            case 'create':
                $songController->createSong();
                break;
            case 'edit':
                $songController->modifySong();
                break;
        }
        break;

        // ALBUM
    case 'album':
        switch ($params[1]) {
            case 'add':
                $taskController->albumForm($params[1], null);
                break;
            case 'modify':
                $taskController->albumForm("edit", $params[2]);
                break;
            case 'delete':
                $taskController->deleteAlbum($params[2]);
                break;
            case 'deleteSongs':
                $taskController->deleteSongsFromAlbum($params[2]);
                break;

                // MODELS
            case 'addTask':
                $taskController->createAlbum();
                break;
            case 'edit':
                $taskController->modifyAlbum();
                break;
        }
        break;
    case 'albums':
        $taskController->showAllAlbums();
        break;

        // OTHER MODELS
    case 'userProfile':
        $userController->showProfile();
        break;
    case 'userEditForm':
        $userController->showUserEditForm($params[1]);
        break;
    case 'editusername':
        $userController->editUserData('username');
        break;
    case 'editemail':
        $userController->editUserData('email');
        break;
    case 'editpassword':
        $userController->editUserData('password');
        break;
    case 'editprofilepicture':
        $userController->editUserData('profilepicture');
        break;
    default:
        echo ('404 Page not found');
        break;
}
