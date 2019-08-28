<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Retencao */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="retencao-form">

    <?php

          $idClientes = $model->getIdCliente();

          foreach($idClientes as $idCliente){
            $newClientes[$idCliente['id']] = $idCliente['nome'];
          }

    ?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ano')->textInput() ?>

    <?= $form->field($model, 'mes')->textInput() ?>

    <?= $form->field($model, 'valor')->textInput() ?>

    <?= $form->field($model, 'idCliente')->dropDownList($newClientes, ['selected'=>'','prompt'=>'Escolha um cliente..']) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
