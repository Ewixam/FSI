<?php 
      if (isset($_POST['data'])) {
            $data = $_POST['update'];
            // $json = json_decode($update,true); // est un array
            $json = json_decode($data); // est un objet
            // extraire les données de l'objet
            $username = $json->username;
            $password = $json->password;
            echo($json);
            var_dump($username);
            var_dump($password);
            }
?>