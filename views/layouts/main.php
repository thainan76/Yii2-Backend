<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
            'id'=>'menu'
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
           Yii::$app->user->isGuest ? (['label' => 'Inicio', 'url' => ['/site/index']]) : (''),
            //['label' => 'About', 'url' => ['/site/about']],
            //['label' => 'Contact', 'url' => ['/site/contact']],
           Yii::$app->user->isGuest ? ('') : (['label' => 'Banco', 'url' => ['/banco/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Usuários', 'url' => ['/usuario/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Perfils', 'url' => ['/tipoconta/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Documentos', 'url' => ['/tipodocumento/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Planos', 'url' => ['/planoconta/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Retenções', 'url' => ['/retencao/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Resultados Mensais', 'url' => ['/resultadomensal/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Lançamentos', 'url' => ['/lancamento/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Clientes', 'url' => ['/cliente/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Cidades', 'url' => ['/cidade/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Estados', 'url' => ['/estado/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Associações', 'url' => ['/associacao/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Categoria Resultado', 'url'=>['/categoriaresultado/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Formas de pagamento', 'url'=>['/formapagamento/']]),
           Yii::$app->user->isGuest ? ('') : (['label' => 'Credor devedor', 'url'=>['/credordevedor/']]),


            Yii::$app->user->isGuest ? (
                ['label' => 'Entrar', 'url' => ['/site/login']]
            ) : (
                '<li>'
                . Html::beginForm(['/site/logout'], 'post')
                . Html::submitButton(
                    'Sair (' . Yii::$app->user->identity->username . ')',
                    ['class' => 'btn btn-link logout']
                )
                . Html::endForm()
                . '</li>'
            )
        ],
    ]);
    NavBar::end();
    ?>

    <div class="container" id="<?php if(!Yii::$app->user->isGuest) echo "containerBody"?>">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; COPYRIGHT DEV THAINAN <?= date('Y') ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
