<?php

class UserModel
{

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_web_tpe;charset=utf8', 'root', '');
    }

    function getUser($email)
    {
        $query = $this->db->prepare('SELECT * FROM users WHERE email = ?');
        $query->execute([$email]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function register($user)
    {
        $rol = "User";
        $query = $this->db->prepare("INSERT INTO `users`(`email`, `username`, `password`, `rol`) VALUES (?, ?, ?, ?)");
        $query->execute([$user['email'], $user['username'], $user['password'], $rol]);
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

    function getProfilePicture($email)
    {
        $query = $this->db->prepare("SELECT `profilepicture` FROM `users` WHERE `email` = ?");
        $query->execute([$email]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function save($image, $email)
    {
        $pathImg = null;
        if ($image) {
            $pathImg = $this->uploadImage($image);
        }
        $query = $this->db->prepare('UPDATE `users` SET `profilepicture`= ? WHERE `email` = ?');
        $query->execute([$pathImg, $email]);
    }

    private function uploadImage($image)
    {
        $target = 'img/' . uniqid() . '.jpg';
        move_uploaded_file($image, $target);
        return $target;
    }
}
