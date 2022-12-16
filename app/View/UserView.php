<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class UserView
{

    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showProfileView($profilepicture)
    {
        $this->smarty->assign('profilepicture', $profilepicture);
        $this->smarty->display('templates/userProfile.tpl');
    }

    function userEditForm($type)
    {
        $this->smarty->assign('type', $type);
        $this->smarty->display('templates/userEditForm.tpl');
    }

    function getData()
    {
        if (!empty($_POST['edit'])) {
            $data = $_POST['edit'];
        }
        return $data;
    }

    function getPassword()
    {
        if (!empty($_POST['edit'])) {
            $data = password_hash($_POST['edit'], PASSWORD_BCRYPT);
        }
        return $data;
    }
}
