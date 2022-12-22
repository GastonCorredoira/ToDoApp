<?php

class TaskModel
{

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_todoapp;charset=utf8', 'root', '');
    }

    function get($id, $username)
    {
        $query = $this->db->prepare("SELECT * FROM " . $username . " WHERE id = ?");
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function getAll($username)
    {
        $query = $this->db->prepare('SELECT * FROM ' . $username . ' ORDER BY priority');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function upload($username, $task)
    {
        $query = $this->db->prepare("INSERT INTO " . $username . " (`title`, `description`, `priority`, `done`) VALUES (?, ?, ?, ?)");
        $query->execute([$task["title"], $task["description"], $task["priority"], $task["done"]]);
    }

    function modify($album)
    {
        $query = $this->db->prepare("UPDATE `album` SET `albumname`=?,`artist`=?,`genre`=?,`year`=? WHERE `id`= ?");
        $query->execute([$album["albumname"], $album["artist"], $album["genre"], $album["year"], $album["id"]]);
        
    }

    function delete($id, $username)
    {
        $query = $this->db->prepare("DELETE FROM " . strtolower($username) .  " WHERE `id` = ?");
        $query->execute([$id]);
    }
}
