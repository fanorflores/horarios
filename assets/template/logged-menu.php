
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark-alt" >
			<div class="container">
			  <a class="navbar-brand" href="/">
				  <img src="img/SVG/logofei-h.svg" alt="Horarios" class="logo-nav">
			  </a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menú
			  </button>
			  <div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="https://www.facebook.com/fei.unanmanagua/" target="_blank" class="nav-link icon d-flex align-items-center"><i class="ion-logo-facebook"></i><span class="d-lg-none ml-2">Facebook FEI</span></a></li>
				  <li class="nav-item"><a href="mailto:fei@unan.edu.ni?Subject=Soporte%para%Horarios%FEI" target="_blank" class="nav-link icon d-flex align-items-center"><i class="ion-ios-mail"></i><span class="d-lg-none ml-2">Soporte</span></a></li>
					<li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link icon d-flex align-items-center" data-toggle="dropdown">
                            <i class="ion-md-business mr-2"></i>
                            Departamentos
                            <b class="caret"></b>
                        </a>
                        <div class="dropdown-menu dropdown-menu-left">
                            <a href="#" class="dropdown-item">Tecnología Educativa</a>
                            <a href="#" class="dropdown-item">Inglés</a>
                            <a href="#" class="dropdown-item">Español</a>
                            <a href="#" class="dropdown-item">Francés</a>
                            <a href="#" class="dropdown-item">Multidisciplinario</a>
                            <a href="#" class="dropdown-item">Ciencias</a>

                        </div>
                    </li>
					<?php
					if (!$logged)
					{
				?>
					<li class="nav-item cta">
						
						<button type="button" class="btn nav-link icon d-flex align-items-center" data-toggle="modal" data-target="#loginModal">
						<i class="ion-ios-person mr-2"></i> Acceder</a>
						</button>
					</li>
					<?php
					}
					else
					{
				?>
                <li class="nav-item cta">
                <a href="login.php?logout" type="button" class="btn nav-link icon d-flex align-items-center" >
				 	 <i class="ion-ios-exit mr-2"></i> <?php echo $_SESSION['usertag']; ?> (Salir)</a>
					</a>
                </li>
				<?php }require_once("assets/modals/auth-modal.php"); ?>

				  <!-- Modal -->
				  </div>
			  </div>
				</ul>
			  </div>
			  </div>
		  </nav>