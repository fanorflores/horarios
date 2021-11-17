<?php
    class UsersSesions
    {

        public function __construct()
        {
            session_start();
        }

        public function setCurrentUser($user)
        {
            $_SESSION['usertag']=$user;
        }


        public function closeSesions()
        {
            session_destroy();
        }


    }

?>