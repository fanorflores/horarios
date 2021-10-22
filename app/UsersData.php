<?php
require_once('Conection.php');
class UsersData
{
    private $iduserdata;
    private $user;   
    private $password;     
    private $usertype;
    private $con;

    public function __construct()
    {
        $this->iduserdata="";
        $this->user="";   
        $this->password="";     
        $this->usertype="";
        $this->con= new Conection();   
    }

    public function dataUserStudent($filter)
    {
        $users=$this->con->getCon()->query("SELECT * FROM studendata where Nombres like '%$filter%';");
        return $users;
    }
}

?>