<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CategoriaresultadoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Categoriaresultados';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categoriaresultado-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Categoriaresultado', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nome',
            'prazoRecebimento',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
