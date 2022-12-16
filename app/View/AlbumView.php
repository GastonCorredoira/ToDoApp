<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class AlbumView
{

    private $smarty;


    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showAll($albums)
    {
        $this->smarty->assign('albums', $albums);
        $this->smarty->display('templates/albumList.tpl');
    }

    function deleteError($id, $songs)
    {
        $this->smarty->assign('id', $id);
        $this->smarty->assign('songs', $songs);
        $this->smarty->display('templates/albumDeleteError.tpl');
    }
}
