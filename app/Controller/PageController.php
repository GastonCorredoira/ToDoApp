<?php

require_once './app/Model/AlbumModel.php';
require_once './app/Model/SongModel.php';

require_once './app/View/SongView.php';
require_once './app/View/PageView.php';

require_once './Helpers/AuthHelper.php';

class PageController
{

    private $albumModel;
    private $songModel;

    private $pageView;
    private $songView;

    private $authHelper;

    function __construct()
    {
        $this->albumModel = new AlbumModel();
        $this->songModel = new SongModel();

        $this->pageView = new PageView();
        $this->songView = new SongView();

        $this->authHelper = new AuthHelper();
    }

    function showHome()
    {
        $this->authHelper->startSession();

        $results = $this->songModel->getAllResults();
        $albums = $this->albumModel->getAll();
        $songs = $this->songModel->getAll();
        $randomAlbums = $this->albumModel->getRandom();
        $randomSongs = $this->songModel->getRandom();
        $this->pageView->showHome($results, $albums, $songs, $randomSongs, $randomAlbums);
    }

    function showAlbum($albumID)
    {
        $this->authHelper->startSession();

        $songList = $this->songModel->getFromAlbum($albumID);
        $album = $this->albumModel->get($albumID);
        $this->songView->showSongs($album, $songList, $albumID);
    }

    function showAllSongs()
    {
        $this->authHelper->startSession();

        $albumID = null;
        $albumList = $this->albumModel->getAll();
        $songList = $this->songModel->getAll();
        $this->songView->showSongs($albumList, $songList, $albumID);
    }

    function showSearchResult()
    {
        $this->authHelper->startSession();

        $search = $this->pageView->getSearchData();

        $results = $this->songModel->getResults($search);

        $this->pageView->showSearch($search, $results);
    }
}
