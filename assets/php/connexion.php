<?php 
      
      session_start();
      if (isset($_GET['action'])) 
      {
            if($_GET['action'] == "Connect")
            {
                  $username = $_GET['username'];
                  $password = $_GET['password'];
                  try{
                        $bdd = new PDO('mysql:host=localhost;dbname=cinema','root','');
                  }
                  catch(Exception $e){
                        die('Erreur de connexion : '.$e->getMessage());
                  }
                  $req = $bdd -> prepare('SELECT password,username FROM internaute WHERE password=:pass AND username=:user');
                  $req->execute(array('pass' => $password,'user' => $username)) or die(print_r($req->errorInfo()));

                  $donnee = $req->fetch();
                  $req->closeCursor();

                  if(isset($donnee['username'])==true)
                  {
                        echo("Connected");
                        $_SESSION['username']=$username;
                  }
                  else
                  {
                        echo("Username or password wrong");
                        $_SESSION['username']=$username;
                  }
            }elseif($_GET['action'] == "Register")
            {
                  $username = $_GET['username'];
                  $password = $_GET['password'];
                  try{
                        $bdd = new PDO('mysql:host=localhost;dbname=cinema','root','');
                  }
                  catch(Exception $e){
                        die('Erreur de connexion : '.$e->getMessage());
                  }
                  $req = $bdd -> prepare('SELECT username FROM internaute WHERE username=:user');
                  $req->execute(array('user' => $username)) or die(print_r($req->errorInfo()));

                  $donnee = $req->fetch();

                  if(isset($donnee['username'])==true)
                  {
                        echo("Account already exist");
                  }
                  else
                  {
                        $req = $bdd -> prepare('INSERT INTO `cinema`.`internaute` (`username`, `password`) VALUES (:user, :pass)');
                        $req->execute(array('pass' => $password,'user' => $username)) or die(print_r($req->errorInfo()));
                        $req->closeCursor();

                        echo("Account Create");
                        $_SESSION['username']=$username;
                  }
            }
      }
?>