<?php

namespace common\models;

use Yii;

use yii\base\NotSupportedException;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;
/**
 * This is the model class for table "usuario".
 *
 * @property int $id
 * @property int $idPerfil
 * @property string $nome
 * @property string $email
 * @property string $idFirebase
 * @property string $authKey
 * @property string $passwordHash
 * @property string $passwordResetToken
 * @property int $createdAt
 * @property int $updatedAt
 * @property int $status
 * @property int $idCliente
 * @property string $username
 * @property string $imagem
 *
 * @property Associacao $associacao
 * @property Cliente $cliente
 */
class Usuario extends \yii\db\ActiveRecord
{


    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'usuario';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idPerfil', 'nome', 'email', 'authKey', 'passwordHash', 'passwordResetToken', 'createdAt', 'updatedAt', 'username'], 'required'],
            [['idPerfil', 'createdAt', 'updatedAt', 'status', 'idCliente'], 'integer'],
            [['nome', 'email', 'imagem'], 'string', 'max' => 120],
            [['idFirebase', 'passwordHash', 'passwordResetToken'], 'string', 'max' => 255],
            [['authKey'], 'string', 'max' => 32],
            [['username'], 'string', 'max' => 60],
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
            'idPerfil' => 'Perfil',
            'nome' => 'Nome',
            'email' => 'Email',
            'idFirebase' => 'Id Firebase',
            'authKey' => 'Auth Key',
            'passwordHash' => 'Password Hash',
            'passwordResetToken' => 'Password Reset Token',
            'createdAt' => 'Created At',
            'updatedAt' => 'Updated At',
            'status' => 'Status',
            'idCliente' => 'Cliente',
            'username' => 'Username',
            'imagem' => 'Imagem',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAssociacao()
    {
        return $this->hasOne(Associacao::className(), ['id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(Cliente::className(), ['id' => 'idCliente']);
    }

    public function getClientes()
    {
      return Usuario::findBySql('SELECT id, nome FROM cliente ORDER BY nome ASC')->all();
    }

    public function getPerfil()
    {
      return Usuario::findBySql('SELECT id, nome FROM tipoconta ORDER BY nome ASC')->all();
    }

    public function getIdUsuarios()
    {
      return Usuario::findBySql('SELECT * FROM usuario')->all();
    }

    public function getIdUsuario($id)
    {
      return Usuario::find($id)->one();
    }

    public function getUser($username)
    {
      return Usuario::findBySql('SELECT id FROM usuario WHERE username = "'.$username.'" ')->all();
    }

    public static function getUsername($username)
    {
      //return Usuario::findBySql('SELECT username FROM usuario WHERE username = "'.$username.'" ');
      return Usuario::find($username)->one();
    }

    public function getPassword($username)
    {
      return Usuario::findBySql('SELECT passwordHash FROM usuario WHERE username = "'.$username.'" ')->all();
    }

}
