<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class LoginView
{

    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showLogin($param = "")
    {
        $this->smarty->assign('param', $param);
        $this->smarty->display('templates/userLogin.tpl');
    }
}
