<?php
/**
 * Description of service_provider
 *
 * @author marian.borca
 */
class Service_Provider extends DB_Object
{
    static public function GetByFacebookID($facebook_id)
    {
        return DB_Helper::ExecuteSingleObject("CALL service_provider_get ($facebook_id)", 'Service_Provider');
    }
}
?>
