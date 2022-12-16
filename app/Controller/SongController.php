<?php

require_once './app/Model/SongModel.php';
require_once './app/Model/AlbumModel.php';

require_once './app/View/FormSongView.php';
require_once './app/View/AlbumView.php';

require_once './Helpers/AuthHelper.php';

class SongController
{

    private $model;
    private $albumModel;

    private $view;
    private $formView;

    private $authHelper;

    function __construct()
    {
        $this->model = new SongModel();
        $this->albumModel = new AlbumModel();

        $this->view = new SongView();
        $this->formView = new FormSongView();

        $this->authHelper = new AuthHelper();
    }

    function showSongByID($songID)
    {
        $this->authHelper->startSession();

        $song = $this->model->getInfo($songID);
        $albumID = $song->id_album_fk;
        $album = $this->albumModel->get($albumID);
        $this->view->showSongInfo($song, $album);
    }

    function createSong()
    {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        $song = $this->formView->getData();
        $this->model->upload($song);
        header("Location: " . BASE_URL . "song/add");
    }

    function deleteSong($songID)
    {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        $song = $this->model->getInfo($songID);
        $this->model->deleteByID($songID);
        header("Location: " . BASE_URL . "album/view/" . $song->id_album_fk);
    }

    function modifySong()
    {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        $song = $this->formView->getData();
        $this->model->modify($song);
        header("Location: " . BASE_URL . "album/view/" . $song["albumID"]);
    }

    function songForm($type, $songID) {
        $this->authHelper->checkLoggedIn();
        $this->authHelper->verifyAdmin();

        if ($type == "edit") {
            $song = $this->model->getInfo($songID);
        }
        else {
            $type = "create";
            $song = null;
        }
        $albums = $this->albumModel->getAll();
        $this->formView->showForm($type, $song, $albums);
    }
}
