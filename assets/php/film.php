<?php
      session_start();
      $action = $_GET['action'];
      try{
            $bdd = new PDO('mysql:host=localhost;dbname=cinema','root','');
      }
      catch(Exception $e){
            die('Erreur de connexion : '.$e->getMessage());
      }
      
      switch($action){
            case 'init':
                  $req = $bdd -> prepare('SELECT * FROM film');
                  $req->execute() or die(print_r($req->errorInfo()));
                  break;
            case 'fiction':
                  $req = $bdd -> prepare('SELECT titre,annee,`resume`,Image FROM film INNER JOIN genre on film.Genre_idGenre = genre.idGenre and genre.libelle = :genre ');
                  $req->execute(array('genre' => $action)) or die(print_r($req->errorInfo()));
                  break;
            case 'comedie':
                  $req = $bdd -> prepare('SELECT titre,annee,`resume`,Image FROM film INNER JOIN genre on film.Genre_idGenre = genre.idGenre and genre.libelle = :genre ');
                  $req->execute(array('genre' => $action)) or die(print_r($req->errorInfo()));
                  break;
            case 'drame':
                  $req = $bdd -> prepare('SELECT titre,annee,`resume`,Image FROM film INNER JOIN genre on film.Genre_idGenre = genre.idGenre and genre.libelle = :genre ');
                  $req->execute(array('genre' => $action)) or die(print_r($req->errorInfo()));
                  break;
            case 'action':
                  $req = $bdd -> prepare('SELECT titre,annee,`resume`,Image FROM film INNER JOIN genre on film.Genre_idGenre = genre.idGenre and genre.libelle = :genre ');
                  $req->execute(array('genre' => $action)) or die(print_r($req->errorInfo()));
                  break;
            default:
                  $req = $bdd -> prepare('SELECT titre,annee,`resume`,Image FROM film WHERE titre = :titre');
                  $req->execute(array('titre' => $_GET['action'])) or die(print_r($req->errorInfo()));
                  break;
      }
      $donnee = $req->fetchAll(PDO::FETCH_ASSOC);
      $req->closeCursor();
      $donnee = json_encode($donnee);
      echo($donnee);
?>