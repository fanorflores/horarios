<?php
require_once('Conection.php');


    class Persons 
    {
        private $idpersons;
        private $globalid;
        private $names;
        private $firstname;
        private $lastname;
        private $dataperson;
        private $con;


       public function __construct()
       {
            $this->idpersons=-0;
            $this->globalid=0;
            $this->names="";
            $this->firstname="";
            $this->lastname="";
            $this->dataperson=null;
            $this->con=new Conection();
       }
        public function getDataperson()
        {
            return $this->dataperson;
        }
        public function setDataperson($dataperson)
        {
            $this->dataperson = $dataperson;
        }
        public function getLastname()
        {
            return $this->lastname;
        }
        public function setLastname($lastname)
        {
            $this->lastname = $lastname;
        }
        public function getFirstname()
        {
            return $this->firstname;
        }
        public function setFirstname($firstname)
        {
            $this->firstname = $firstname;
        }
        public function getNames()
        {
            return $this->names;
        }
        public function setNames($names)
        {
            $this->names = $names;
        }
        public function getGlobalid()
        {
            return $this->globalid;
        }
        public function setGlobalid($globalid)
        {
                $this->globalid = $globalid;

                return $this;
        }
        public function getIdpersons()
        {
            return $this->idpersons;
        }
        public function setIdpersons($idpersons)
        {
            $this->idpersons = $idpersons;

        }

        public function addPerson($globalid,$name,$firstname,$lastname,$username,$password)
        {
            $password=password_hash($password,PASSWORD_DEFAULT);
            mysqli_report(MYSQLI_REPORT_STRICT);
            

            try {
                    $this->con->getCon()->query("call addPerson('$globalid','$name','$firstname','$lastname','$username','$password');");
                    return $this->con->getCon()->affected_rows;


            } catch (Exception $e) {
                return
                "Error al guardar el usuario (". mysqli_errno($this->con->getCon()) .")".
                $e->getMessage();
            }

        }
    }

?>