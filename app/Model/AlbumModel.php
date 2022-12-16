<?php

class AlbumModel
{

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_web_tpe;charset=utf8', 'root', '');
    }

    function get($id)
    {
        $query = $this->db->prepare('SELECT * FROM album WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function getAll()
    {
        $query = $this->db->prepare('SELECT * FROM album');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function upload($album)
    {
        $pathImg = $this->saveAlbumPicture($album["logo"]);
        $query = $this->db->prepare("INSERT INTO album (albumname, artist, genre, year, logo) VALUES (?, ?, ?, ?, ?)");
        $query->execute([$album["albumname"], $album["artist"], $album["genre"], $album["year"], $pathImg]);
    }

    function modify($album)
    {
        if ($album["logo"] != null) {
            $pathImg = $this->saveAlbumPicture($album["logo"]);
            $query = $this->db->prepare("UPDATE `album` SET `albumname`=?,`artist`=?,`genre`=?,`year`=?, `logo`=? WHERE `id`= ?");
            $query->execute([$album["albumname"], $album["artist"], $album["genre"], $album["year"], $pathImg, $album["id"]]);
        }
        else {
            $query = $this->db->prepare("UPDATE `album` SET `albumname`=?,`artist`=?,`genre`=?,`year`=? WHERE `id`= ?");
            $query->execute([$album["albumname"], $album["artist"], $album["genre"], $album["year"], $album["id"]]);
        }
        
    }

    function saveAlbumPicture($image)
    {
        $pathImg = null;
        if ($image) {
            $pathImg = $this->uploadImage($image);
        }
        return $pathImg;
    }

    private function uploadImage($image)
    {
        $target = 'img/' . uniqid() . '.jpg';
        move_uploaded_file($image, $target);
        return $target;
    }

    function delete($id)
    {
        $query = $this->db->prepare("DELETE FROM `album` WHERE `id` = ?");
        $query->execute([$id]);
    }

    function getRandom()
    {
        $query = $this->db->prepare("SELECT * FROM album ORDER BY RAND() LIMIT 4;");
        $query->execute([]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
