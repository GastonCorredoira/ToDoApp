<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class RegisterView
{

    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showRegister($error = "")
    {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/userRegister.tpl');
    }

    function showHome()
    {
        header("Location: " . BASE_URL);
    }

    function getRegisterFormData()
    {
        if (!empty($_POST['email']) && !empty($_POST['password'])) {
            $user = [
                "email" => $_POST['email'],
                "username" => $_POST['username'],
                "password" => password_hash($_POST['password'], PASSWORD_BCRYPT),
            ];
        }
        return $user;
    }
}
