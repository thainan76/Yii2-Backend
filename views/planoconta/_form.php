<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Planoconta */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="planoconta-form">
    <?php
      $idClientes = $model->getIdCliente();
      $idPais = $model->getIdPai();

      foreach($idClientes as $idCliente){
        $newClientes[$idCliente['id']] = $idCliente['nome'];
      }

      foreach($idPais as $idPai){
       $newPais[$idPai['id']] = $idPai['nome'];

      }
    ?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'idPai')->dropDownList($newPais, ['selected'=>'','prompt'=>'Escolha um plano..']) ?>

    <?= $form->field($model, 'idCliente')->dropDownList($newClientes, ['selected'=>'','prompt'=>'Escolha um cliente..']) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
