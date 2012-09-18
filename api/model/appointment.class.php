<?php

/**
 * Description of appointment
 *
 * @author marian.borca
 */
class Appointment extends DB_Object
{
    static public function Insert($start_date, $end_date, $service_provider_facebook_id, $user_email, $user_facebook_id, $user_firstname, $user_lastname)
    {
        return DB_Helper::ExecuteScalar("CALL _appointment_insert ('$start_date', '$end_date', $service_provider_facebook_id, '$user_email', $user_facebook_id, '$user_firstname', '$user_lastname')");
    }
    static public function Delete($id)
    {
        return DB_Helper::ExecuteNonQuery("CALL service_provider_delete ($id)");
    }
}
?>
