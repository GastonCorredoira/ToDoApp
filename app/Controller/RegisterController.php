<?php

require_once './app/Model/UserModel.php';
require_once './app/View/RegisterView.php';

class RegisterController
{

    private $model;
    private $view;

    function __construct()
    {
        $this->model = new UserModel();
        $this->view = new RegisterView();
    }

    function register()
    {
        $this->view->showRegister();
    }

    function verifyRegister()
    {
        $user = $this->view->getRegisterFormData();
        $this->model->register($user);
        header("Location: " . BASE_URL . "login");
    }
}
