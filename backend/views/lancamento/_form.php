<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Lancamento */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lancamento-form">

    <?php

       $idClientes = $model->getIdCliente();
       $idCredorDevedors = $model->getIdCredorDevedor();
       $idFormaPagamentos = $model->getIdFormaPagamento();
       $idPlanoContas = $model->getIdPlanoConta();
       $idTipoContas = $model->getIdTipoConta();
       $idDocumentos = $model->getIdTipoDocumento();

       foreach($idClientes as $idCliente){
         $newClientes[$idCliente['id']] = $idCliente['nome'];
       }

       foreach($idCredorDevedors as $idCredorDevedor){
         $newCredorDevedors[$idCredorDevedor['id']] = $idCredorDevedor['nome'];
       }

       foreach($idFormaPagamentos as $idFormaPagamento){
         $newFormaPagamentos[$idFormaPagamento['id']] = $idFormaPagamento['nome'];
       }

       foreach($idPlanoContas as $idPlanoConta){
         $newPlanoContas[$idPlanoConta['id']] = $idPlanoConta['nome'];
       }

       foreach($idTipoContas as $idTipoConta){
         $newTipoContas[$idTipoConta['id']] = $idTipoConta['nome'];
       }

       foreach($idDocumentos as $idDocumento){
         $newDocumentos[$idDocumento['id']] = $idDocumento['nome'];
       }

    ?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tipo')->textInput() ?>

    <?= $form->field($model, 'idCredorDevedor')->dropDownList($newCredorDevedors,['selected'=>'','prompt'=>"Escolha um credor devedor.."]) ?>

    <?= $form->field($model, 'numDocumento')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'dtVencimento')->textInput() ?>

    <?= $form->field($model, 'dtEmissao')->textInput() ?>

    <?= $form->field($model, 'dtRealizacao')->textInput() ?>

    <?= $form->field($model, 'valorPrevisto')->textInput() ?>

    <?= $form->field($model, 'valorRealizado')->textInput() ?>

    <?= $form->field($model, 'idBanco')->textInput() ?>

    <?= $form->field($model, 'idTipoDocumento')->dropDownList($newDocumentos,['selected'=>'','prompt'=>"Escolha um credor devedor.."]) ?>

    <?= $form->field($model, 'idFormaPagamento')->dropDownList($newFormaPagamentos,['selected'=>'','prompt'=>"Escolha um credor devedor.."]) ?>

    <?= $form->field($model, 'idTipoConta')->dropDownList($newTipoContas,['selected'=>'','prompt'=>"Escolha um credor devedor.."]) ?>

    <?= $form->field($model, 'idPlanoConta')->dropDownList($newPlanoContas,['selected'=>'','prompt'=>"Escolha um credor devedor.."]) ?>

    <?= $form->field($model, 'descricao')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'idCliente')->dropDownList($newClientes,['selected'=>'','prompt'=>"Escolha um credor devedor.."]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
