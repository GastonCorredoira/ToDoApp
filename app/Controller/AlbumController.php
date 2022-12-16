<?php

require_once './app/Model/AlbumModel.php';
require_once './app/Model/SongModel.php';

require_once './app/View/AlbumView.php';
require_once './app/View/FormAlbumView.php';

require_once './Helpers/AuthHelper.php';

class AlbumController
{

    private $model;

    private $view;
    private $formView;

    private $authHelper;

    function __construct()
    {
        $this->model = new AlbumModel();
        $this->songModel = new SongModel();

        $this->view = new AlbumView();
        $this->formView = new FormAlbumView();

        $this->authHelper = new AuthHelper();
    }

    function showAllAlbums()
    {
        $this->authHelper->startSession();

        $albums = $this->model->getAll();
        $this->view->showAll($albums);
    }

    function createAlbum()
    {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        $album = $this->formView->getData();
        $this->model->upload($album);
        header("Location: " . BASE_URL . "album/add");
    }

    function deleteAlbum($id)
    {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        $songs = $this->songModel->getFromAlbum($id);
        if (count($songs) == 0) {
            $this->model->delete($id);
            header("Location: " . BASE_URL . "albums");
        } else {
            $this->view->deleteError($id, $songs);
        }
    }

    function modifyAlbum()
    {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        $album = $this->formView->getData();

        $this->model->modify($album);
        header("Location: " . BASE_URL);
    }

    function deleteSongsFromAlbum($id)
    {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        $this->songModel->deleteFromAlbum($id);
        header("Location: " . BASE_URL . "album/view/" . $id);
    }

    function albumForm($type, $albumID)
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