<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "credordevedor".
 *
 * @property int $id
 * @property string $nome
 * @property string $cnpj
 * @property int $idCidade
 * @property string $endereco
 * @property string $complemento
 * @property string $bairro
 * @property string $telefone
 * @property string $email
 * @property int $idCliente
 *
 * @property Cidade $cidade
 * @property Cliente $cliente
 * @property Lancamento[] $lancamentos
 */
class Credordevedor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'credordevedor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nome', 'idCliente'], 'required'],
            [['idCidade', 'idCliente'], 'integer'],
            [['nome', 'bairro', 'email'], 'string', 'max' => 120],
            [['cnpj'], 'string', 'max' => 14],
            [['endereco'], 'string', 'max' => 255],
            [['complemento'], 'string', 'max' => 30],
            [['telefone'], 'string', 'max' => 20],
            [['idCidade'], 'exist', 'skipOnError' => true, 'targetClass' => Cidade::className(), 'targetAttribute' => ['idCidade' => 'id']],
            [['idCliente'], 'exist', 'skipOnError' => true, 'targetClass' => Cliente::className(), 'targetAttribute' => ['idCliente' => 'id']],
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
            'cnpj' => 'Cnpj',
            'idCidade' => 'Cidade',
            'endereco' => 'Endereco',
            'complemento' => 'Complemento',
            'bairro' => 'Bairro',
            'telefone' => 'Telefone',
            'email' => 'Email',
            'idCliente' => 'Cliente',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCidade()
    {
        return $this->hasOne(Cidade::className(), ['id' => 'idCidade']);
    }

    public function getIdCidade()
    {
        return Cliente::findBySql('SELECT id, nome FROM cidade ORDER BY nome ASC')->all();
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
    public function getLancamentos()
    {
        return $this->hasMany(Lancamento::className(), ['idCredorDevedor' => 'id']);
    }
}
