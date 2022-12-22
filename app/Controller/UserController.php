<?php

require_once './app/Model/UserModel.php';
require_once './app/View/UserView.php';

require_once './Helpers/AuthHelper.php';

class UserController
{

    private $model;
    private $view;


    function __construct()
    {
        $this->model = new UserModel();
        $this->view = new UserView();

        $this->authHelper = new AuthHelper();
    }

    function showProfile()
    {
        $this->authHelper->checkLoggedIn();

        $email = $this->authHelper->getEmail();
        $this->view->showProfileView();
    }

    function showUserEditForm($type)
    {
        $this->authHelper->checkLoggedIn();

        $this->view->userEditForm($type);
    }

    function editUserData($type)
    {
        $this->authHelper->checkLoggedIn();

        if ($type == "password") {
            $data = $this->view->getPassword();
            $email = $this->authHelper->getEmail();
            $this->model->modifyPassword($data, $email);
        } else {
            $data = $this->view->getData();
            $email = $this->authHelper->getEmail();

            if ($type == "username") {
                $username = $this->authHelper->getUsername();
                $this->model->modifyUsername($data, $email, $username);
            }
            if ($type == "email") {
                $this->model->modifyEmail($data, $email);
            }
        }
        $this->authHelper->logout();
    }
}
