<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class FormSongView
{

    private $smarty;


    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showForm($type, $song, $albums)
    {
        $this->smarty->assign('type', $type);
        $this->smarty->assign('song', $song);
        $this->smarty->assign('albums', $albums);
        $this->smarty->display('templates/songForm.tpl');
    }

    function getData()
    {
        $song = [
            "id" => $_POST['id'],
            "name" => $_POST['name'],
            "duration" => $_POST['duration'],
            "albumID" => $_POST['albumID'],
        ];
        return $song;
    }
}
