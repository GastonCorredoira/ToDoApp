<?php

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class PageView
{

    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showHome($tasks)
    {
        $this->smarty->assign('tasks', $tasks);
        $this->smarty->display('templates/home.tpl');
    }

    function getSearchData()
    {
        $search = $_POST['search'];
        return $search;
    }

    function showSearch($search, $results)
    {
        $this->smarty->assign('search', $search);
        $this->smarty->assign('results', $results);
        $this->smarty->display('templates/showSearch.tpl');
    }
}
