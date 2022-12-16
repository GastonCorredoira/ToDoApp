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
        $profilepicture = $this->model->getProfilePicture($email);
        $this->view->showProfileView($profilepicture);
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
        } else if ($type == "profilepicture") {
            if ($_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg" || $_FILES['input_name']['type'] == "image/png") {

                $email = $this->authHelper->getEmail();
                $this->model->save($_FILES['input_name']['tmp_name'], $email);
            }
        } else {
            $data = $this->view->getData();
            $email = $this->authHelper->getEmail();

            if ($type == "username") {
                $this->model->modifyUsername($data, $email);
            }
            if ($type == "email") {
                $this->model->modifyEmail($data, $email);
            }
        }



        $this->authHelper->logout();
    }
}
