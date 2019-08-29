<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="usuario-form">


    <?php

      $idClientes = $model->getClientes();

      $idPerfils = $model->getPerfil();

      foreach($idClientes as $idCliente){
        $newClientes[$idCliente['id']] = $idCliente['nome'];
      }


      foreach($idPerfils as $idPerfil){
        $newPerfils[$idPerfil['id']] = $idPerfil['nome'];
      }

    ?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'idPerfil')->dropDownList($newPerfils,['selected'=>'','prompt'=>"Escolha um perfil.."])?>

    <?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'idFirebase')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'authKey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'passwordHash')->passwordInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'passwordResetToken')->passwordInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'createdAt')->textInput() ?>

    <?= $form->field($model, 'updatedAt')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'idCliente')->dropDownList($newClientes,['selected'=>'','prompt'=>"Escolha um cliente.."]) ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'imagem')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
