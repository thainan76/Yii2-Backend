<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "lancamento".
 *
 * @property int $id
 * @property int $tipo
 * @property int $idCredorDevedor
 * @property string $numDocumento
 * @property string $dtVencimento
 * @property string $dtEmissao
 * @property string $dtRealizacao
 * @property double $valorPrevisto
 * @property double $valorRealizado
 * @property int $idBanco
 * @property int $idTipoDocumento
 * @property int $idFormaPagamento
 * @property int $idTipoConta
 * @property int $idPlanoConta
 * @property string $descricao
 * @property int $idCliente
 *
 * @property Banco $banco
 * @property Cliente $cliente
 * @property Credordevedor $credorDevedor
 * @property Formapagamento $formaPagamento
 * @property Planoconta $planoConta
 * @property Tipoconta $tipoConta
 * @property Tipodocumento $tipoDocumento
 */
class Lancamento extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lancamento';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tipo', 'idCredorDevedor', 'idBanco', 'idTipoDocumento', 'idFormaPagamento', 'idTipoConta', 'idPlanoConta', 'idCliente'], 'required'],
            [['tipo', 'idCredorDevedor', 'idBanco', 'idTipoDocumento', 'idFormaPagamento', 'idTipoConta', 'idPlanoConta', 'idCliente'], 'integer'],
            [['dtVencimento', 'dtEmissao', 'dtRealizacao'], 'safe'],
            [['valorPrevisto', 'valorRealizado'], 'number'],
            [['numDocumento'], 'string', 'max' => 40],
            [['descricao'], 'string', 'max' => 120],
            [['idCliente'], 'exist', 'skipOnError' => true, 'targetClass' => Cliente::className(), 'targetAttribute' => ['idCliente' => 'id']],
            [['idCredorDevedor'], 'exist', 'skipOnError' => true, 'targetClass' => Credordevedor::className(), 'targetAttribute' => ['idCredorDevedor' => 'id']],
            [['idFormaPagamento'], 'exist', 'skipOnError' => true, 'targetClass' => Formapagamento::className(), 'targetAttribute' => ['idFormaPagamento' => 'id']],
            [['idPlanoConta'], 'exist', 'skipOnError' => true, 'targetClass' => Planoconta::className(), 'targetAttribute' => ['idPlanoConta' => 'id']],
            [['idTipoConta'], 'exist', 'skipOnError' => true, 'targetClass' => Tipoconta::className(), 'targetAttribute' => ['idTipoConta' => 'id']],
            [['idTipoDocumento'], 'exist', 'skipOnError' => true, 'targetClass' => Tipodocumento::className(), 'targetAttribute' => ['idTipoDocumento' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tipo' => 'Tipo',
            'idCredorDevedor' => 'Credor Devedor',
            'numDocumento' => 'Num Documento',
            'dtVencimento' => 'Dt Vencimento',
            'dtEmissao' => 'Dt Emissao',
            'dtRealizacao' => 'Dt Realizacao',
            'valorPrevisto' => 'Valor Previsto',
            'valorRealizado' => 'Valor Realizado',
            'idBanco' => 'Banco',
            'idTipoDocumento' => 'Tipo Documento',
            'idFormaPagamento' => 'Forma Pagamento',
            'idTipoConta' => 'Tipo Conta',
            'idPlanoConta' => 'Plano Conta',
            'descricao' => 'Descricao',
            'idCliente' => 'Cliente',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBanco()
    {
        return $this->hasOne(Banco::className(), ['id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(Cliente::className(), ['id' => 'idCliente']);
    }

    public function getIdCliente(){
      return Cliente::findBySql('SELECT id, nome FROM cliente ORDER BY nome ASC')->all();
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCredorDevedor()
    {
        return $this->hasOne(Credordevedor::className(), ['id' => 'idCredorDevedor']);
    }

    public function getIdCredorDevedor(){
      return Credordevedor::findBySql('SELECT id, nome FROM credordevedor ORDER BY nome ASC')->all();
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFormaPagamento()
    {
        return $this->hasOne(Formapagamento::className(), ['id' => 'idFormaPagamento']);
    }

    public function getIdFormaPagamento()
    {
      return Formapagamento::findBySql('SELECT id, nome FROM formapagamento ORDER BY nome ASC')->all();
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanoConta()
    {
        return $this->hasOne(Planoconta::className(), ['id' => 'idPlanoConta']);
    }

    public function getIdPlanoConta()
    {
      return Planoconta::findBySql('SELECT id, nome FROM formapagamento ORDER BY nome ASC')->all();
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTipoConta()
    {
        return $this->hasOne(Tipoconta::className(), ['id' => 'idTipoConta']);
    }

    public function getIdTipoConta()
    {
      return Tipoconta::findBySql('SELECT id, nome FROM tipoconta ORDER BY nome ASC')->all();
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTipoDocumento()
    {
        return $this->hasOne(Tipodocumento::className(), ['id' => 'idTipoDocumento']);
    }

    public function getIdTipoDocumento()
    {
      return Tipodocumento::findBySql('SELECT id, nome FROM tipodocumento ORDER BY nome ASC')->all();
    }
}
