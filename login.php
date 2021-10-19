<?php include_once("assets/template/head.php"); ?>

<div class="main-section">
    <!-- nav -->
    <?php include_once("assets/template/logged-menu.php"); ?>
    <!-- - - - - -end- - - - -  -->

    <section class="ftco-section goto-here pb-4 ">

        <div class="row pb-4">
            <div class="col-6 offset-3 card card-login  ">
                <form class="form-login " method="post" action="login.php">
                    <div class="card-header card-header-primary text-center">
                        <img class="login-img" src="img/SVG/logofei-v.svg" style="max-width: 50%;" alt="">
                        <h3 class="card-title pt-2">Iniciar Sesión</h3>
                    </div>
                    <div class="card-body px-4 pb-4 pt-2">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="ion-ios-person"></i>
                                </span>
                            </div>
                            <input type="text" class="form-control" placeholder="usuario o carnet">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="ion-ios-lock"></i>
                                </span>
                            </div>
                            <input type="password" class="form-control" placeholder="contraseña">
                        </div>

                        <div class="footer text-center pb-4">
                            <button type="submit" name="btnlogin" value="btn-login" class="btn btn-white">Entrar</button>
                        </div>
                </form>
                <div class="alert alert-danger text-light" role="alert">
                    Mensaje de algo
                </div>
            </div>

        </div>
    </section>

</div>

<?php require_once("assets/template/foot.php"); ?>