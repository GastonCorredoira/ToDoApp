<?php

require_once './app/Model/TaskModel.php';

require_once './app/View/PageView.php';

require_once './Helpers/AuthHelper.php';

class PageController
{

    private $pageView;

    private $authHelper;

    function __construct()
    {
        $this->taskModel = new TaskModel();

        $this->pageView = new PageView();

        $this->authHelper = new AuthHelper();
    }

    function showHome()
    {   
        $this->authHelper->checkLoggedIn();
        
        $username = $_SESSION["username"];
        
        $tasks = $this->taskModel->getAll($username);
            
        $this->pageView->showHome($tasks);
    }
}
