<?php

require_once './app/View/LoginView.php';

class AuthHelper
{

    private $view;

    function __construct()
    {
        $this->view = new LoginView();
    }

    function checkLoggedIn()
    {
        session_start();
        if (!isset($_SESSION["email"])) {
            header("Location: " . BASE_URL . "login");
        }
    }

    function verifyAdmin()
    {
        if ($_SESSION["rol"] != "Admin") {
            header("Location: " . BASE_URL);
        }
    }

    function startSession()
    {
        session_start();
    }

    function logout()
    {
        session_start();
        session_destroy();
        header("Location: " . BASE_URL . "login");
    }

    function getEmail()
    {
        return $_SESSION["email"];
    }
}
