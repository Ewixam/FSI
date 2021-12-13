<?php
      session_start();

      try{
            $bdd = new PDO('mysql:host=localhost;dbname=cinema','root','');
      }
      catch(Exception $e){
            die('Erreur de connexion : '.$e->getMessage());
      }
      $req = $bdd -> prepare('SELECT * FROM film');
      $req->execute() or die(print_r($req->errorInfo()));

      $donnee = $req->fetchAll(PDO::FETCH_ASSOC);
      $req->closeCursor();
      $donnee = json_encode($donnee);
      echo($donnee);
?>