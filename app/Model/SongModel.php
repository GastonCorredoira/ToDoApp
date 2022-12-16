<?php

class SongModel
{

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_web_tpe;charset=utf8', 'root', '');
    }

    function getFromAlbum($album)
    {
        $query = $this->db->prepare('SELECT * FROM song WHERE id_album_fk = ?');
        $query->execute([$album]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function upload($song)
    {
        $query = $this->db->prepare("INSERT INTO song (name, duration, id_album_fk) VALUES (?, ?, ?)");
        $query->execute([$song["name"], $song["duration"], $song["albumID"]]);
    }

    function getAll()
    {
        $query = $this->db->prepare('SELECT * FROM `song`');
        $query->execute([]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function deleteByID($songID)
    {
        $query = $this->db->prepare("DELETE FROM `song` WHERE `id`= ?");
        $query->execute([$songID]);
    }

    function getInfo($songID)
    {
        $query = $this->db->prepare('SELECT * FROM song WHERE id = ?');
        $query->execute([$songID]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function modify($song)
    {
        $query = $this->db->prepare("UPDATE `song` SET `name`=?,`duration`=?,`id_album_fk`=? WHERE `id`= ?");
        $query->execute([$song["name"], $song["duration"], $song["albumID"], $song["id"]]);
    }

    function getAllResults()
    {
        $query = $this->db->prepare("SELECT song.*, album.* FROM song INNER JOIN album ON song.id_album_fk = album.id");
        $query->execute([]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getResults($search)
    {
        $query = $this->db->prepare("SELECT song.*, album.* FROM song INNER JOIN album ON song.id_album_fk = album.id WHERE `name` LIKE ? OR `albumname` LIKE ? OR `artist` LIKE ? OR `genre` LIKE ? OR `year` LIKE ?");
        $query->execute(['%' . $search . '%', '%' . $search . '%', '%' . $search . '%', '%' . $search . '%', '%' . $search . '%']);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getRandom()
    {
        $query = $this->db->prepare("SELECT * FROM song ORDER BY RAND() LIMIT 8;");
        $query->execute([]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function deleteFromAlbum($id)
    {
        $query = $this->db->prepare("DELETE FROM `song` WHERE `id_album_fk` = ?");
        $query->execute([$id]);
    }
}
