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

        // PAGE MODEL
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

        // TASK MODEL
    case 'addTask':
        $taskController->addTask();
        break;
    case 'delete':
        $taskController->deleteTask($params[1]);
        break;
    case 'edit':
        $taskController->editTask($params[1]);


        // USER MODEL
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
