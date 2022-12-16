<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class SongView
{

    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showSongs($albumList, $songList, $albumID)
    {
        $this->smarty->assign('albumID', $albumID);
        $this->smarty->assign('albumList', $albumList);
        $this->smarty->assign('songList', $songList);
        $this->smarty->display('templates/songList.tpl');
    }

    function showSongInfo($song, $album)
    {
        $this->smarty->assign('song', $song);
        $this->smarty->assign('album', $album);
        $this->smarty->display('templates/songInfo.tpl');
    }
}
