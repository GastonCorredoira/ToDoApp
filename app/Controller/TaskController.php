<?php

require_once './app/Model/TaskModel.php';

require_once './app/View/TaskView.php';
require_once './app/View/FormTaskView.php';

require_once './Helpers/AuthHelper.php';

class TaskController
{

    private $model;

    private $view;
    private $formView;

    private $authHelper;

    function __construct()
    {
        $this->model = new TaskModel();

        $this->view = new TaskView();
        $this->formView = new FormTaskView();

        $this->authHelper = new AuthHelper();
    }

    function addTask()
    {
        $this->authHelper->checkLoggedIn();
        
        $task = $this->formView->getData();
        var_dump($task);
        $username = $_SESSION["username"];
        $this->model->upload($username, $task);
        header("Location: " . BASE_URL);
    }

    function deleteTask($id) {
        $this->authHelper->checkLoggedIn();

        $username = $this->authHelper->getUsername();

        $this->model->delete($id, $username);

        header("Location: " . BASE_URL);
    }

    function editTask($id) {
        $this->authHelper->checkLoggedIn();

        $username = $this->authHelper->getUsername();


    }

    function modifyAlbum()
    {
        $this->authHelper->checkLoggedIn();

        $album = $this->formView->getData();

        $this->model->modify($album);
        header("Location: " . BASE_URL);
    }

    function taskForm($type, $albumID)
    {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        if ($type == "edit") {
            $album = $this->model->get($albumID);
        } else {
            $type = "create";
            $album = null;
        }
        $this->formView->showForm($type, $album);
    }
}