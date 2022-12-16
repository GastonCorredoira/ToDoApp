<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class FormAlbumView
{

    private $smarty;


    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showForm($type, $album)
    {
        $this->smarty->assign('type', $type);
        $this->smarty->assign('album', $album);
        $this->smarty->display('templates/albumForm.tpl');
    }

    function getData()
    {
        if (
            $_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg"
            || $_FILES['input_name']['type'] == "image/png"
        ) {
            $album = [
                "id" => $_POST['id'],
                "albumname" => $_POST['albumname'],
                "artist" => $_POST['artist'],
                "genre" => $_POST['genre'],
                "year" => $_POST['year'],
                "logo" => $_FILES['input_name']['tmp_name'],
            ];
        } else {
            $album = [
                "id" => $_POST['id'],
                "albumname" => $_POST['albumname'],
                "artist" => $_POST['artist'],
                "genre" => $_POST['genre'],
                "year" => $_POST['year'],
                "logo" => null,
            ];
        }
        return $album;
    }
}
