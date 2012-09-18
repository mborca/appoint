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
    static public function Register($facebook_id, $category, $name, $description, $country, $region, $city, $address, $phone, $email, $longitude, $latitude)
    {
        return DB_Helper::ExecuteNonQuery("CALL service_provider_register ('$address', '$category', '$city', '$country', '$description', '$email', $facebook_id, NULL, NULL, '$name', '$phone', '$region')");
    }
    static public function Delete($facebook_id)
    {
        return DB_Helper::ExecuteNonQuery("CALL service_provider_delete ($facebook_id)");
    }
}
