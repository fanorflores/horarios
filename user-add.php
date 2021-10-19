
<?php include_once("assets/template/head.php"); ?>

<div class="main-section">
		<!-- nav -->
		<?php include_once("assets/template/logged-menu.php"); ?>
		<!-- - - - - -end- - - - -  -->

			<section class="ftco-section goto-here pb-0 ">
			  <div class="container">
				<div class="row">
				<div class="col-md-12 text-center">
				  <h2 class="font-weight-bold">
					  Agregar Usuario
				  </h2>
				</div>
			 </div>
			 
			<div class="row ">
				 <!-- Aside Menu -->
				 <?php include_once("assets/template/aside-menu.php"); ?>
			 	<!-- END Aside Menu -->
				<div class="col-9">
                                        
                    <form>
                    <div class="form-group row">
                        <label for="globalid" class="col-4 col-form-label">Carnet :</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="icon-fingerprint"></i>
                            </div>
                            </div> 
                            <input id="globalid" name="globalid" placeholder="Carnet o INSS" type="number" required="required" class="form-control">
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
                            <input id="names" name="names" type="text" required="required" class="form-control">
                        </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="lastname" class="col-4 col-form-label">Primer Apellidos:</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                              <i class="icon-account_circle"></i>
                            </div>
                            </div> 
                            <input id="lastname" name="lastname" type="text" required="required" class="form-control">
                        </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="text" class="col-4 col-form-label">Segundo Apellido:</label> 
                        <div class="col-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <div class="input-group-text">
                                    <i class="icon-account_circle"></i>
                            </div>
                            </div> 
                            <input id="text" name="text" type="text" class="form-control">
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
                            <input id="user" name="user" type="text" required="required" class="form-control">
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
                            <input id="pwd" name="pwd" placeholder="***********" type="password" required="required" class="form-control"> 
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
                        <button name="submit" type="submit" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>
                    </form>


                
                </div>

			</div>
		  </section>
	 
	  </div>

<?php require_once("assets/template/foot.php"); ?>
