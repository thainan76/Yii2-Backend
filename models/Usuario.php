<?php

namespace app\models;

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
class Usuario extends \yii\db\ActiveRecord  implements IdentityInterface
{
      public $id;
      public $username;
      public $password;
      public $authKey;
      public $accessToken;

      private static $users = [
          '100' => [
              'id' => '100',
              'username' => 'admin',
              'password' => 'admin',
              'authKey' => 'test100key',
              'accessToken' => '100-token',
          ],
          '101' => [
              'id' => '101',
              'username' => 'demo',
              'password' => 'demo',
              'authKey' => 'test101key',
              'accessToken' => '101-token',
          ],
          '102' => [
              'id' => '101',
              'username' => 'senha',
              'password' => 'senha123',
              'authKey' => 'test101key',
              'accessToken' => '101-token',
          ],
      ];

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
            'idPerfil' => 'Id Perfil',
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

    public function getUser($username)
    {
      return Usuario::findBySql('SELECT id FROM usuario WHERE username = {$username}')->all();
    }

    /*public function newUser($username2){

        $usuarios = Usuario::findBySql('SELECT * FROM usuario WHERE username = "'.$username2.'" ')->all();

        foreach($usuarios as $key=>$user2){
              $users[] = [
                      $key => [
                        'id' => 10,
                        'username' => 'thainan',
                        'password' => $user2['passwordHash'],
                        'authKey' => $user2['authKey'],
                        'accessToken' => $user2['passwordResetToken'],
                ],
              ];
        }

        return $users;
    }*/



    public static function findIdentity($id)
    {
        return isset(self::$users[$id]) ? new static(self::$users[$id]) : null;
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        foreach (self::$users as $user) {
            if ($user['accessToken'] === $token) {
                return new static($user);
            }
        }

        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        foreach (self::$users as $user) {
            if (strcasecmp($user['username'], $username) === 0) {
                return new static($user);
            }
        }

        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return $this->authKey;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->password === $password;
    }
}
