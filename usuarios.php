
<?php 
	include_once("assets/template/head.php"); 
	$modalstatus="d-none";

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
					 Usuarios del sistema
				</div>
			 </div>
			 
			<div class="row pt-0 ">
				 <!-- Aside Menu -->
				 <?php include_once("assets/template/aside-menu.php"); ?>
			 	<!-- END Aside Menu -->
				<div class="col-9 ">
					<div class="form ">
					<form action="usuarios.php" method="get">
						<div class="form-group row">		
							<div class="input-group col-md-8 ">
								<div class="input-group-prepend  m-1" style="margin-right: 0 !important;" >
									<span class="input-group-text ">
										<i class="ion-ios-search"></i>
									</span>
									
								</div>
								<input type="text" name="userfilter" class="form-control m-1" style="margin-left: 0 !important;" placeholder="usuario o carnet">
							</div>
							<div class="col-md-2 p-md-1">
								<button type="submit" class="btn btn-primary btn-block"> Buscar</button>
							</div>
							<div class="col-md-2 p-md-1">
								<a href="user-add.php" class="btn btn-success btn-block border-0 text-light"><i class="ion-ios-person-add"></i>  Nuevo</a>
							</div>
						</div>
					</form>
				</div>
				<div class="table-responsive">
				<table class="table table-hover ">
						<thead>
						  <tr>
							<th scope="col">Carnet</th>
							<th scope="col">Nombres</th>
							<th scope="col">Apellidos</th>
							<th scope="col">Usuario</th>
							<th scope="col">Carrera</th>
							<th scope="col">Acciones</th>

						  </tr>
						</thead>
						<tbody>
						  <tr>
							<th scope="row">30843677</th>
							<td>Fanor Antonio</td>
							<td>Rivera Flores</td>
							<td>frivera</td>
							<td>Informática Educativa</td>
							<td>
								<i class="icon-pencil p-1"> 	</i>
								<i class="icon-trash p-1"> 	</i>
							</td>
						</tbody>
					  </table>

				</div></div>
			</div>
			</div>
		  </section>

	  </div>
<?php require_once("assets/template/foot.php"); ?>