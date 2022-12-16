<?php

require_once './app/Model/UserModel.php';
require_once './app/View/LoginView.php';

class LoginController
{

    private $model;
    private $view;

    function __construct()
    {
        $this->model = new UserModel();
        $this->view = new LoginView();
    }

    function login()
    {
        $this->view->showLogin();
    }

    function verifyLogin()
    {
        if (!empty($_POST['email']) && !empty($_POST['password'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];


            $user = $this->model->getUser($email);

            if ($user && password_verify($password, $user->password)) {
                session_start();
                $_SESSION["email"] = $email;
                $_SESSION["username"] = $user->username;
                $_SESSION["profilepicture"] = $user->profilepicture;
                $_SESSION["rol"] = $user->rol;
                header("Location: " . BASE_URL);
            } else {
                $this->view->showLogin("Urong email or password");
            }
        }
    }
}
