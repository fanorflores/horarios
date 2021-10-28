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

    public function loginData($user,$pwd)
    {
        $users=$this->con->getCon()->query("select * from logindata where user='$user';");
        if($users->num_rows)
        {
            $usr=$users->fetch_assoc();
            if(password_verify($pwd,$usr["password"]))
                return $usr["nombres"];
            else
                return 0;

        }
        else
        {
           return 0;
        }

    }
}
?>