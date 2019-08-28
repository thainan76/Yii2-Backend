<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Cliente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cliente-form">
    <?php

      $idAssociacaos = $model->getIdAssociacao();
      $idCidades = $model->getIdCidade();

      foreach($idAssociacaos as $idAssociacao){
        $newAssociacaos[$idAssociacao['id']] = $idAssociacao['nome'];
      }

      foreach($idCidades as $idCidade){
        $newCidades[$idCidade['id']] = $idCidade['nome'];
      }

    ?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cnpj')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'idCidade')->dropDownList($newCidades,['selected'=>'','prompt'=>"Escolha uma cidade.."]) ?>

    <?= $form->field($model, 'endereco')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'complemento')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'bairro')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'telefone')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'idAssociacao')->dropDownList($newAssociacaos,['selected'=>'','prompt'=>"Escolha uma associação.."]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
