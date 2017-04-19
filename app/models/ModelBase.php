<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\SoftDelete;
use Carbon\Carbon;

/**
 * 基础模型
 * @author jsyzchenchen@gmail.com
 * @date 2017/04/17
 */
class ModelBase extends Model
{
    const DELETED = 0;
    const NOT_DELETED = 1;

    public $created_at;
    public $updated_at;
    public $status;

    public function initialize()
    {
        $this->addBehavior(
            new SoftDelete(
                [
                    "field" => "status",
                    "value" => TopicsVotes::DELETED,
                ]
            )
        );
    }

    public function beforeCreate()
    {
        $this->created_at = Carbon::now()->toDateTimeString();
    }

    public function beforeUpdate()
    {
        $this->updated_at = Carbon::now()->toDateTimeString();
    }

    /**
     * Implement a method that returns a string key based
     * on the query parameters
     */
    protected static function _createKey($parameters)
    {
        $uniqueKey = [];

        foreach ($parameters as $key => $value) {
            if (is_scalar($value)) {
                $uniqueKey[] = $key . ":" . $value;
            } elseif (is_array($value)) {
                $uniqueKey[] = $key . ":[" . self::_createKey($value) . "]";
            }
        }

        return join(",", $uniqueKey);
    }
}