<?php
namespace common\models;

use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;
use common\models\Usuario;

/**
 * User model
 *
 * @property integer $id
 * @property string $username
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $verification_token
 * @property string $email
 * @property string $auth_key
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $password write-only password
 */
class User extends ActiveRecord implements IdentityInterface
{
    const STATUS_DELETED = 0;
    const STATUS_INACTIVE = 9;
    const STATUS_ACTIVE = 10;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        //return '{{%user}}';
        return 'usuario';
    }

    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            //['status', 'default', 'value' => self::STATUS_INACTIVE],
            //['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_INACTIVE, self::STATUS_DELETED]],
        ];
    }

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
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        //throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
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
        //return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
        $user = Usuario::getUsername($username);
        if($user['username']){
            return new static($user);
        }

        return null;
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        /*if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'password_reset_token' => $token,
            'status' => self::STATUS_ACTIVE,
        ]);*/
        return null;
    }

    /**
     * Finds user by verification email token
     *
     * @param string $token verify email token
     * @return static|null
     */
    public static function findByVerificationToken($token) {
        /*return static::findOne([
            'verification_token' => $token,
            'status' => self::STATUS_INACTIVE
        ]);*/
        return null;
    }

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return bool
     */
    public static function isPasswordResetTokenValid($token)
    {
      /*  if (empty($token)) {
            return false;
        }

        $timestamp = (int) substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();*/
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
        //return $this->auth_key;
        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
      //  return $this->getAuthKey() === $authKey;
      return null;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password, $username)
    {
        ///return Yii::$app->security->validatePassword($password, $this->password_hash);
        $password_db = Usuario::getPassword($username);
        //print_r($password_db);
        //die;
        if(!empty($password_db[0]['passwordHash'])) return $password_db[0]['passwordHash'] === sha1($password);
        else return null;
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        //$this->password_hash = Yii::$app->security->generatePasswordHash($password);
        return null;
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        //$this->auth_key = Yii::$app->security->generateRandomString();
        return null;
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        //$this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
        return null;
    }

    public function generateEmailVerificationToken()
    {
        //$this->verification_token = Yii::$app->security->generateRandomString() . '_' . time();
        return null;
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
      //  $this->password_reset_token = null;
      return null;
    }

    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

}
