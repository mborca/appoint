<?php
/**
 * Description of service_provider
 *
 * @author marian.borca
 */
class Service_Provider
{
    static public function Get($id)
    {
        return DB_Object::Get($id);
    }
}

?>
