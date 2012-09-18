<?php include('../includes/header.php'); ?>
<?php include('../includes/menu.php'); ?>
<?php

$facebook_id = 1517375131;
$service_provider_facebook_id = 1517375131;
$start_date = '2012-09-24';
$end_date = '2012-09-30';

//$appointments = Appointment::Select($service_provider_facebook_id, $start_date, $end_date);
?>
<table border="1">
    <tr>
        <th>Hour</th>
        <th>S</th>
        <th>M</th>
        <th>T</th>
        <th>T</th>
        <th>W</th>
        <th>F</th>
        <th>S</th>
    </tr>
<?php
for ($h=10; $h<18; $h=$h+1)
{
    $start = $h;
    $end = $h + 1;
    echo "<tr><td>$start - $end</td>";
    for($d=0; $d<7; $d=$d+1)
    {
        $since = new DateTime($start_date);
        $since->add(new DateInterval("P{$d}D"));
        $since->add(new DateInterval("PT{$h}H"));
        $nh = $h + 1;
        $until = new DateTime($start_date);
        $until->add(new DateInterval("P{$d}D"));
        $until->add(new DateInterval("PT{$nh}H"));
        $id = Appointment::Check($service_provider_facebook_id, $since->format(DateTime::W3C), $until->format((DateTime::W3C)));
        if($id == 0)
            echo "<td onclick=alert('book')></td>";
        elseif($id == $facebook_id)
            echo "<td style='background-color:green' onclick=alert('cancel')></td>";
        else
            echo "<td style='background-color:red'></td>";
    }
    echo '</tr>';
}
?>
</table>
    
<?php include('../includes/scripts.php'); ?>
</html>
