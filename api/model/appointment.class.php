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
        return DB_Helper::ExecuteScalar("CALL appointment_insert ('$start_date', '$end_date', $service_provider_facebook_id, '$user_email', $user_facebook_id, '$user_firstname', '$user_lastname')");
    }
    static public function Delete($id)
    {
        return DB_Helper::ExecuteNonQuery("CALL service_provider_delete ($id)");
    }
    static public function Select($facebook_id, $start_date, $end_date)
    {
        return DB_Helper::ExecuteObjectArray("CALL appointment_get_by_date($facebook_id, '$start_date', '$end_date')", 'Appointment');
    }
    static public function Check($service_provider_facebook_id, $start_date, $end_date)
    {
        return DB_Helper::ExecuteScalar("CALL appointment_check ($service_provider_facebook_id, '$start_date', '$end_date')");
    }
}
?>
