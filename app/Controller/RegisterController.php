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
        $test = $this->model->checkExistence($user);
        $array = get_object_vars($test);
        $boolean = 1;
        foreach ($array as $key => $value) {
            $boolean = $value;
        }
        echo $boolean;

        if ($boolean == 0) {
            $this->model->register($user);
            header("Location: " . BASE_URL . "login");
        }
        else {
            $this->view->showRegister("Email or username already used");
        }
    }
}
