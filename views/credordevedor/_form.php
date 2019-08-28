<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Credordevedor */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="credordevedor-form">

    <?php

        $idClientes = $model->getIdCliente();

        $idCidades = $model->getIdCidade();

        foreach($idClientes as $idCliente){
          $newClientes[$idCliente['id']] = $idCliente['nome'];
        }

        foreach($idCidades as $idCidade){
          $newCidades[$idCidade['id']] = $idCidade['nome'];
        }

    ?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cnpj')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'idCidade')->dropDownList($newCidades, ['selected'=>'','prompt'=>'Escolha um cidade..'])?>

    <?= $form->field($model, 'endereco')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'complemento')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'bairro')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'telefone')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'idCliente')->dropDownList($newClientes, ['selected'=>'','prompt'=>'Escolha um cliente..']) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
