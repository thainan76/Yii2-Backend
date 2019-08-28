<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Resultadomensal */

$this->title = 'Create Resultadomensal';
$this->params['breadcrumbs'][] = ['label' => 'Resultadomensals', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resultadomensal-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
