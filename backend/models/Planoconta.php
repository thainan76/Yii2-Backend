<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "planoconta".
 *
 * @property int $id
 * @property string $nome
 * @property int $idPai
 * @property int $idCliente
 *
 * @property Lancamento[] $lancamentos
 * @property Cliente $cliente
 * @property Planoconta $pai
 * @property Planoconta[] $planocontas
 */
class Planoconta extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'planoconta';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nome', 'idPai', 'idCliente'], 'required'],
            [['idPai', 'idCliente'], 'integer'],
            [['nome'], 'string', 'max' => 120],
            [['idCliente'], 'exist', 'skipOnError' => true, 'targetClass' => Cliente::className(), 'targetAttribute' => ['idCliente' => 'id']],
            [['idPai'], 'exist', 'skipOnError' => true, 'targetClass' => Planoconta::className(), 'targetAttribute' => ['idPai' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nome' => 'Nome',
            'idPai' => 'Id Pai',
            'idCliente' => 'Cliente',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLancamentos()
    {
        return $this->hasMany(Lancamento::className(), ['idPlanoConta' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(Cliente::className(), ['id' => 'idCliente']);
    }

    public function getIdCliente()
    {
      return Cliente::findBySql('SELECT id, nome FROM cliente ORDER BY nome ASC')->all();
    }


    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPai()
    {
        return $this->hasOne(Planoconta::className(), ['id' => 'idPai']);
    }

    public function getIdPai()
    {
      return Cliente::findBySql('SELECT id, nome FROM planoconta ORDER BY nome ASC')->all();
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanocontas()
    {
        return $this->hasMany(Planoconta::className(), ['idPai' => 'id']);
    }

}
