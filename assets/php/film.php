<?php
      session_start();
      $user = $_SESSION['username'];
      $action = $_GET['action'];
      try{
            $bdd = new PDO('mysql:host=localhost;dbname=cinema','root','');
      }
      catch(Exception $e){
            die('Erreur de connexion : '.$e->getMessage());
      }
      
      switch($action){
            case 'init':
                  $req = $bdd -> prepare('SELECT titre,annee,resume,Image,nom,prenom,dateNaiss,libelle FROM cinema.film INNER JOIN artiste ON artiste.idArtiste= film.Artiste_idRealisateur INNER JOIN genre ON genre.idGenre=film.Genre_idGenre');
                  $req->execute() /*or die(print_r($req->errorInfo()));*/;
                  break;
            case 'fiction':
                  $req = $bdd -> prepare('SELECT titre,annee,resume,Image,nom,prenom,dateNaiss,libelle FROM film INNER JOIN artiste ON artiste.idArtiste= film.Artiste_idRealisateur INNER JOIN genre on film.Genre_idGenre = genre.idGenre and genre.libelle = :genre ');
                  $req->execute(array('genre' => $action)) or die(print_r($req->errorInfo()));
                  break;
            case 'comedie':
                  $req = $bdd -> prepare('SELECT titre,annee,resume,Image,nom,prenom,dateNaiss,libelle FROM film INNER JOIN artiste ON artiste.idArtiste= film.Artiste_idRealisateur INNER JOIN genre on film.Genre_idGenre = genre.idGenre and genre.libelle = :genre ');
                  $req->execute(array('genre' => $action)) or die(print_r($req->errorInfo()));
                  break;
            case 'drame':
                  $req = $bdd -> prepare('SELECT titre,annee,resume,Image,nom,prenom,dateNaiss,libelle FROM film INNER JOIN artiste ON artiste.idArtiste= film.Artiste_idRealisateur INNER JOIN genre on film.Genre_idGenre = genre.idGenre and genre.libelle = :genre ');
                  $req->execute(array('genre' => $action)) /*or die($req->errorInfo())*/;
                  break;
            case 'action':
                  $req = $bdd -> prepare('SELECT titre,annee,resume,Image,nom,prenom,dateNaiss,libelle FROM film INNER JOIN artiste ON artiste.idArtiste= film.Artiste_idRealisateur INNER JOIN genre on film.Genre_idGenre = genre.idGenre and genre.libelle = :genre ');
                  $req->execute(array('genre' => $action)) /*or die($req->errorInfo());*/;
                  break;
            case 'fav':
                  $req = $bdd -> prepare('INSERT INTO noter ( id,userid, timestamp) SELECT o.userid , o.timestamp FROM users u INNER JOIN orders o ON  o.userid = u.id');
                  $req->execute(array('genre' => $action)) /*or die($req->errorInfo());*/;
                  break;
            default:
                  $req = $bdd -> prepare('SELECT titre,annee,resume,Image,nom,prenom,dateNaiss,libelle FROM cinema.film INNER JOIN artiste ON artiste.idArtiste= film.Artiste_idRealisateur INNER JOIN genre ON genre.idGenre=film.Genre_idGenre WHERE titre = :titre');
                  $req->execute(array('titre' => $_GET['action'])) /*or die(print_r($req->errorInfo()));*/;
                  break;
      }
      
      $donnee = $req->fetchAll(PDO::FETCH_ASSOC);
      if(!$req->errorInfo()[1])
      {
            $req->closeCursor();
            $donnee = json_encode($donnee);
            echo($donnee);
      }elseif($req->errorInfo()[1]==1054){
            $error = $req->errorInfo();
            $req->closeCursor();
            $error = json_encode($error);
            echo($error);
      }else{
            print_r($req->errorInfo());
      }
      
      
?>