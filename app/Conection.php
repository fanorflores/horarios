<?php
    class Conection
    {
        private $host;
        private $port;
        private $user;
        private $pwd;
        private $db;
        private $con;

        public function __construct()
        {
           $this->host="localhost";
           $this->port="3306";
           $this->user="fanor";
           $this->pwd="pweb2021";
           $this->db="horarios";
           mysqli_report(MYSQLI_REPORT_STRICT);

           try {
               $this->con=new mysqli($this->host,$this->user,$this->pwd,$this->db,$this->port);
           } catch (Exception $e) {
               echo
               "Error al conectar a la bases de datos (". mysqli_connect_errno() .")".
               $e->getMessage();
           }

        }

        public function getCon()
        {
            return $this->con;
        }

        public function __destruct()
        {
            mysqli_report(MYSQLI_REPORT_STRICT);
            try
            {
               $this->con->close();
            }
            catch(Exception $e)
            {
                echo "No se encontró una conexión MYSQL para cerrar";

            }
        }

    }


 
    ?>