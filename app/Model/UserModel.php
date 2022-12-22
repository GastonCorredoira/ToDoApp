<?php

class UserModel
{

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_todoapp;charset=utf8', 'root', '');
    }

    function getUser($email)
    {
        $query = $this->db->prepare('SELECT * FROM users WHERE email = ?');
        $query->execute([strtolower($email)]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function register($user)
    {
        $query = $this->db->prepare("INSERT INTO `users`(`email`, `username`, `password`) VALUES (?, ?, ?)");
        $query->execute([strtolower($user['email']), strtolower($user['username']), $user['password']]);
        $query = $this->db->prepare("CREATE TABLE `db_todoapp`.`" . strtolower($user['username']) . "` (`title` INT(100) NOT NULL , `description` INT(255) NOT NULL , `priority` INT NOT NULL , `done` INT NOT NULL ) ENGINE = InnoDB;");
        $query->execute();
    }

    function checkExistence($user)
    {
        $query = $this->db->prepare("SELECT EXISTS ( SELECT * FROM users WHERE username = ? OR email = ? )");
        $query->execute([$user['username'], $user['email']]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function modifyUsername($data, $email)
    {
        $query = $this->db->prepare("UPDATE `users` SET `username`=? WHERE `email` = ?");
        $query->execute([$data, $email]);
    }

    function modifyEmail($data, $email)
    {
        $query = $this->db->prepare("UPDATE `users` SET `email`=? WHERE `email` = ?");
        $query->execute([$data, $email]);
    }

    function modifyPassword($data, $email)
    {
        $query = $this->db->prepare("UPDATE `users` SET `password`=? WHERE `email` = ?");
        $query->execute([$data, $email]);
    }
}
