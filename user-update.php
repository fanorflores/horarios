
<?php
include_once("assets/template/head.php"); 
include_once("app/ZonePrivate.php"); 
$clasemensaje="d-none";
$action="Actualizar";
if(isset($_POST['editar']) or isset($_POST['eliminar']))
{
    require_once('app/Persons.php');
    $action=isset($_POST['editar']) ? "Editar":"Eliminar";
    $user=isset($_POST['editar']) ? $_POST['editar']:$_POST['eliminar'];
    
    $p=new Persons();
    $datuser=$p->getPerson($user);

}
else if (isset($_POST['eliminar-y']))
{
    require_once('app/Persons.php');
    $p=new Persons();
    $p->setIdpersons($_POST['eliminar-y']);
    if($p->delPerson())
    {
        $clasemensaje="alert alert-success text-light ";
        $mensaje= "<strong>Usuario Eliminado Correctamente</strong><br> Serás redirigido en 3 Segundos o haz clic en usuarios";

    }
    else
    {
        $clasemensaje="alert alert-warning text-light ";
        $mensaje= "<strongNo se pudo Eliminar Usuario</strong><br> Serás redirigido en 3 Segundos o haz clic en usuarios";
    }

    echo "<meta http-equiv='refresh' content='3; url=usuarios.php'>  ";
   
}
else if (isset($_POST['update-y']))
{
    require_once('app/Persons.php');
    $idpersons=$_POST['update-y'];
    $globalid=$_POST["globalid"];
    $names=$_POST["names"];
    $firstname=$_POST["firstname"];
    $lastname=$_POST["lastname"];
    $user=$_POST["user"];

    $pwd= strlen($_POST["pwd"])==0 ? $pwd_default=$_POST["pwd-default"]: password_hash($_POST["pwd"],PASSWORD_DEFAULT);

    $p= new Persons();
    $p->setIdpersons($idpersons);
      if(  $p->updatePerson($globalid,$names,$firstname,$lastname,$user,$pwd))
      {
        $clasemensaje="alert alert-success text-light ";
        $mensaje= "<strong>Usuario Actualizado Correctamente</strong><br> Serás redirigido en 3 Segundos o haz clic en usuarios";

      }
      else
      {
        $clasemensaje="alert alert-warning text-light ";
        $mensaje= "<strongNo se pudo Actualizar Usuario</strong><br> Serás redirigido en 3 Segundos o haz clic en usuarios";

      }
      echo "<meta http-equiv='refresh' content='3; url=usuarios.php'>  ";

}
else
{
    header("Location: usuarios.php");
}

?>

<div class="main-section">
		<!-- nav -->
		<?php include_once("assets/template/logged-menu.php"); ?>
		<!-- - - - - -end- - - - -  -->

			<section class="ftco-section goto-here pb-0 ">
			  <div class="container">
              
				<div class="row">
				<div class="col-md-12 text-center">
				  <h2 class="font-weight-bold">
                  <?php echo $action; ?> Usuario 
				  </h2>
				</div>
			 </div> 
             <div class="row">
                    <div class="col-8 offset-2">
                    <div class="<?php echo $clasemensaje; ?> " role="alert">
                            <?php echo $mensaje; ?>
                        </div>
                    </div>
                    </div>
             <?php 
                if($action=="Eliminar")
                {
             ?>
              <div class="row pb-4">
              
                  <div class="col-8 offset-2">
                  <div class="card">
                  <div class="card-header">
                        Eliminar un usuario
                    </div>
                   <form action="user-update.php" method="post">
                    <div class="card-body">
                        <h5 class="card-title">¿Seguro que desea eliminar?</h5>
                        <p class="card-text">
                            Usuario: 
                            <?php echo "[".$datuser['globalid']."] ".$datuser['names']." ".$datuser['firstname']." ".$datuser['lastname'];
                        
                        
                        ?></p>
                        <div class="float-right p-4">
                            <a href="usuarios.php" class="btn btn-primary">Cancelar</a>
                            <button type="submit"class="btn btn-danger" name="eliminar-y" value="<?php echo $datuser['idpersons']?>" >SI, Eliminar</button>
                        </div>
                    </div>
                    </div>
                    </form>

                  </div>
             </div>
             <?php 
                }
                else  if($action=="Editar")
                {
             ?>


			<div class="row ">
               
				 <!-- Aside Menu -->
				 <?php include_once("assets/template/aside-menu.php"); ?>
			 	<!-- END Aside Menu -->
				<div class="col-9">
                                        
                    <form action="user-update.php" method="post">
                    <div class="form-group row">
                        <label for="globalid" class="col-4 col-form-label">Carnet :</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="icon-fingerprint"></i>
                            </div>
                            </div> 
                            <input id="globalid" name="globalid" placeholder="Carnet o INSS" value="<?php echo $datuser['globalid'];?>" type="number" required="required" class="form-control">
                        </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-4 col-form-label" for="names">Nombres:</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="icon-account_circle"></i>
                            </div>
                            </div> 
                            <input id="names" name="names" type="text" required="required" class="form-control"  value="<?php echo $datuser['names'];?>">
                        </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="firstname" class="col-4 col-form-label">Primer Apellidos:</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                              <i class="icon-account_circle"></i>
                            </div>
                            </div> 
                            <input id="firstname" name="firstname" type="text" required="required"   value="<?php echo $datuser['firstname'];?>"class="form-control">
                        </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="lastname" class="col-4 col-form-label">Segundo Apellido:</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                                    <i class="icon-account_circle"></i>
                            </div>
                            </div> 
                            <input id="lastname" name="lastname"  value="<?php echo $datuser['lastname'];?>" type="text" class="form-control">
                        </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="user" class="col-4 col-form-label">Usuario:</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="icon-user"></i>
                            </div>
                            </div> 
                            <input id="user" name="user" type="text"   value="<?php echo $datuser['user'];?>" required="required" class="form-control">
                        </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="pwd" class="col-4 col-form-label">Password:</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="icon-key"></i>
                            </div>
                            </div> 
                            <input id="pwd" name="pwd" placeholder="***********" type="password" class="form-control"> 
                            <input type="hidden" name="pwd-default" value="<?php echo $datuser['password'];?>">
                            <div class="input-group-append">
                            <div class="input-group-text">
                                <i id="eye" class="ion-ios-eye"></i>
                            </div>
                            </div>
                        </div>
                        </div>
                    </div> 
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                        <a href="usuarios.php"  class="btn btn-secondary">Volver</a>
                        <button name="update-y" type="submit" value="<?php echo $datuser['idpersons'];?>" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>
                    </form>


                
                </div>
             
			</div>
            <?php }?>
		  </section>
	 
	  </div>

<?php require_once("assets/template/foot.php"); ?>
