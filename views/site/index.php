<?php

/* @var $this yii\web\View */

$this->title = 'Dev Thainan';
?>
<div class="site-index">
  <?php if(Yii::$app->user->isGuest) {?>

    <div class="jumbotron">
        <h1>Seja bem-vindo!</h1>

        <p class="lead">Foco na entrega de um produto com qualidade, buscando sempre um custo acessível aos nossos clientes.</p>
        <!--<p><a class="btn btn-lg btn-success" href="http://www.yiiframework.com">Get started with Yii</a></p>-->
    </div>

    <div class="body-content">

        <div class="row">
            <div class="col-md-12 text-center">
              <img src="http://localhost/Desafio-Devell/basic/dist/img/gif.gif" />
            </div>
        </div>

    </div>
  <?php }else{?>

    <div class="jumbotron">
        <h1>Seja bem-vindo <b><i><?php echo Yii::$app->user->identity->username ?></i></b> !</h1>

        <p class="lead">Parabéns, você fez seu primeiro acesso à nossa plataforma!</p>
        <!--<p><a class="btn btn-lg btn-success" href="http://www.yiiframework.com">Get started with Yii</a></p>-->

    </div>

  <?php }?>
</div>
