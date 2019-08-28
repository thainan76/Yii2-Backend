<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Categoriaresultado */

$this->title = 'Create Categoriaresultado';
$this->params['breadcrumbs'][] = ['label' => 'Categoriaresultados', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categoriaresultado-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
