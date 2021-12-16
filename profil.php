<?php
session_start();
if(isset($_SESSION['username'])){
      $username = $_SESSION['username'];
}

try{
      $bdd = new PDO('mysql:host=localhost;dbname=cinema','root','');
}
catch(Exception $e){
      die('Erreur de connexion : '.$e->getMessage());
}
$req = $bdd -> prepare('SELECT titre,annee,resume,Image,username FROM cinema.film INNER JOIN noter ON noter.Film_idFilm= film.idFilm INNER JOIN internaute ON noter.Internaute_idInternaute=internaute.idInternaute and internaute.username = :user');
$req->execute(array('user' => $username)) or die(print_r($req->errorInfo()));

$donnee = $req->fetchAll(PDO::FETCH_ASSOC);
$req->closeCursor();
?>
<html lang="fr">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- FONTS -->
      <link href="http://fonts.cdnfonts.com/css/kernel-panic-nbp" rel="stylesheet">
      <!-- CSS -->
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" type="text/css" href="./styles/reset.css"/>
      <link rel="stylesheet" type="text/css" href="./styles/style.css">
      <link rel="stylesheet" type="text/css" href="./styles/profil.css">
      <title>FSI - <?php echo($username); ?></title>
</head>
<body>
      <div class="content">
            <h1><?php echo($username); ?></h1>
            <h2>Mes notes</h2>
            <div class="lesNote">
            <?php 
                  foreach($donnee as $note){
                        echo '
                        <div class="film">
                              <img src="';
                        echo($note['Image']);
                        echo'" width="70" height="105">
                              <div class="note-content">
                                    <div class="titreFilm"><h4>';
                        echo ($note["titre"]);
                        echo'</h4></div>
                                    <div class="note-commentaire">
                                          <div class="commentaire"></div>
                                          <div class="note">
                                                <span class="laNote">10</span>
                                                <span class="surDix">/10</span>
                                          </div>
                                    </div>
                              </div>
                        </div>
                        ';
                  }
            ?>

                  <!-- <div class="film">
                        <img src="./assets/images/arcane.jpg" width="70" height="105">
                        <div class="note-content">
                              <div class="titreFilm"><h4>Titre</h4></div>
                              <div class="note-commentaire">
                                    <div class="commentaire">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid nulla maiores quaerat neque reiciendis architecto voluptatum magnam ab numquam. Expedita labore ad suscipit consectetur porro optio, amet tempore magni veritatis!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid nulla maiores quaerat neque reiciendis architecto voluptatum magnam ab numquam. Expedita labore ad suscipit consectetur porro optio, amet tempore magni veritatis!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid nulla maiores quaerat neque reiciendis architecto voluptatum magnam ab numquam. Expedita labore ad suscipit consectetur porro optio, amet tempore magni veritatis!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid nulla maiores quaerat neque reiciendis architecto voluptatum magnam ab numquam. Expedita labore ad suscipit consectetur porro optio, amet tempore magni veritatis!</div>
                                    <div class="note">
                                          <span class="laNote">10</span>
                                          <span class="surDix">/10</span>
                                    </div>
                              </div>
                        </div>
                  </div>
                  <div class="film">
                        <img src="./assets/images/arcane.jpg" width="70" height="105">
                        <div class="note-content">
                              <div class="titreFilm"><h4>Titre</h4></div>
                              <div class="note-commentaire">
                                    <div class="commentaire">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid nulla maiores quaerat neque reiciendis architecto voluptatum magnam ab numquam. Expedita labore ad suscipit consectetur porro optio, amet tempore magni veritatis!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid nulla maiores quaerat neque reiciendis architecto voluptatum magnam ab numquam. Expedita labore ad suscipit consectetur porro optio, amet tempore magni veritatis!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid nulla maiores quaerat neque reiciendis architecto voluptatum magnam ab numquam. Expedita labore ad suscipit consectetur porro optio, amet tempore magni veritatis!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid nulla maiores quaerat neque reiciendis architecto voluptatum magnam ab numquam. Expedita labore ad suscipit consectetur porro optio, amet tempore magni veritatis!</div>
                                    <div class="note">
                                          <span class="laNote">10</span>
                                          <span class="surDix">/10</span>
                                    </div>
                              </div>
                        </div>
                  </div> -->
            </div>
      </div>
</body>
</html>