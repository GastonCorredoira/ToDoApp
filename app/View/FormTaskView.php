<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class FormTaskView
{

    private $smarty;


    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showForm($type, $album)
    {
        $this->smarty->assign('type', $type);
        $this->smarty->assign('album', $album);
        $this->smarty->display('templates/albumForm.tpl');
    }

    function getData()
    {
        $task = [
            "title" => $_POST['title'],
            "description" => $_POST['description'],
            "priority" => $_POST['priority'],
            "done" => $_POST['done'],
        ];

        return $task;
    }
}
