<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class FormTaskView
{

    private $smarty;


    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showForm($task)
    {
        $this->smarty->assign('task', $task);
        $this->smarty->display('templates/taskForm.tpl');
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
