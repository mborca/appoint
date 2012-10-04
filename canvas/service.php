<?php include('../includes/header.php'); ?>
<div id="fb-root"></div>
<?php include('../includes/menu.php'); ?>
<?php
if (!isset($user_id)) {
    exit();
}

$facebook_id = $user_id;

$service_provider_facebook_id = 1517375131;
$start_date = '2012-09-24';
$end_date = '2012-09-30';
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
    for ($h = 10; $h < 18; $h = $h + 1) {
        $start = $h;
        $end = $h + 1;
        echo "<tr><td>$start - $end</td>";
        for ($d = 0; $d < 7; $d = $d + 1) {
            $since = new DateTime($start_date);
            $since->add(new DateInterval("P{$d}D"));
            $since->add(new DateInterval("PT{$h}H"));
            $nh = $h + 1;
            $until = new DateTime($start_date);
            $until->add(new DateInterval("P{$d}D"));
            $until->add(new DateInterval("PT{$nh}H"));
            $id = Appointment::Check($service_provider_facebook_id, $since->format(DateTime::W3C), $until->format(DateTime::W3C));
            if ($id == 0)
                echo "<td data-since=\"{$since->format(DateTime::W3C)}\" data-until=\"{$until->format(DateTime::W3C)}\" data-action=\"book\" data-id=\"$facebook_id\"></td>";
            elseif ($id == $facebook_id)
                echo "<td style='background-color:green' data-action=\"cancel\" data-id=\"$facebook_id\" data-since=\"{$since->format(DateTime::W3C)}\"></td>";
            else
                echo "<td style='background-color:red'></td>";
        }
        echo '</tr>';
    }
    ?>
</table>

    <?php include('../includes/scripts.php'); ?>
<script>
    $(document).ready(function() {
        app.controllers.page = new app.Service('<?php echo $service_provider_facebook_id; ?>');
    });
</script>
</html>
