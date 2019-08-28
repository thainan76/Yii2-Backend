<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Associacao */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="associacao-form">

    <?php

      $idUsuarios = $model->getUsuarios();

      $idCidades = $model->getIdCidade();

      foreach($idUsuarios as $idUsuario){
        $newUsuarios[$idUsuario['id']] = $idUsuario['nome'];
      }

      foreach($idCidades as $idCidade){
        $newCidades[$idCidade['id']] = $idCidade['nome'];
      }

    ?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id')->dropDownList($newUsuarios,['selected'=>'']) ?>

    <?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'descricao')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'idCidade')->dropDownList($newCidades,['selected'=>'','prompt'=>"Escolha uma cidade.."]) ?>

    <?= $form->field($model, 'endereco')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'complemento')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'bairro')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'telefone')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cnpj')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
