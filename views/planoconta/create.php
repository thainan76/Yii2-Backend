<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Planoconta */

$this->title = 'Create Planoconta';
$this->params['breadcrumbs'][] = ['label' => 'Planocontas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="planoconta-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
