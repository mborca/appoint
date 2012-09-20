<?php

include 'Twilio.php';
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class Notification
{
    
//    protected $appID;
//    
//    protected $appSecret;
    
    protected $appToken;
    
    const GRAPH_API_URL = 'https://graph.facebook.com/';
    
    function __construct($appTokenconfig) {
//       $appID = $appIDconfig;
//       $appSecret = $appSecretconfig;
       $this->appToken = $appTokenconfig;
       
    }
    
    function sendNotification($fbReciever,$message)
    {
        $finalUrl = self::GRAPH_API_URL .  $fbReciever . '/notifications?'; 
                
        $myvars = 'access_token=' . $this->appToken . '&template=' . $message;
        
        $ch = curl_init( $finalUrl );
        curl_setopt( $ch, CURLOPT_POST, 1);
        curl_setopt( $ch, CURLOPT_POSTFIELDS, $myvars);
        curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt( $ch, CURLOPT_HEADER, 0);
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);

        $response = curl_exec( $ch );
        
        $jsonResponse = json_decode($response);
        
        if ($jsonResponse->success)
        {
            return true;
        }
        else
        {
            return $jsonResponse->error->message;
        }
        
    }
    
    function sendTwilioNotification($phoneCall)
    {
    
        // Twilio REST API version
        $version = "2010-04-01";

        // Set our Account SID and AuthToken
        $sid = 'ACa2a89cfe69c20a1509505688a28da34c';
        $token = '5c3355a0b1c4e10967b9cc03e32209d3';

        // A phone number you have previously validated with Twilio
        $phonenumber = '15148037957';

        // Instantiate a new Twilio Rest Client
        $client = new Services_Twilio($sid, $token, $version);
        
        try {
        // Initiate a new outbound call
        $call = $client->account->calls->create(
            $phonenumber, // The number of the phone initiating the call
            $phoneCall, // The number of the phone receiving call
            'http://fbapps.my.phpcloud.com/appoint/voice.xml' // The URL Twilio will request when the call is answered
                );
                return true;
            } catch (Exception $e) {
                return 'Error: ' . $e->getMessage();
            }
    }
    
}
?>
