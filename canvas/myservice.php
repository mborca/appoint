<?php include('../includes/header.php'); ?>
<?php include('../includes/menu.php'); ?>
<div class="page">
    <form id="myservice-form" method="get" action="../services/myservice.php">
        <input type="hidden" name="action" value="register" />
        <input type="hidden" name="id" value="0" />
        <input type="hidden" name="latitude" value="0" />
        <input type="hidden" name="longitude" value="0" />
        <input type="hidden" name="region" value="" />
        <input type="hidden" name="description" value="" />
        <input type="hidden" name="facebook_id" value="<?php echo $user_id ?>" />
        <label for="name">Name:</label><input id="name" name="name" /><br />
        <label for="address">Address:</label><input id="address" name="address" /><br />
        <label for="email">Email:</label><input id="email" name="email" /><br />
        <label for="phone">Phone:</label><input id="phone" name="phone" /><br />
        <label for="category">Category:</label>
        <select id="category" name="category">
            <option value="Barber">Barber</option>
            <option value="Dentist">Dentist</option>
            <option value="Financial">Financial</option>
        </select><br />
        <label for="country">Country:</label>
        <select id="country" name="country">
            <option value="Canada">Canada</option>
            <option value="Spain">Spain</option>
            <option value="Usa">United States</option>
        </select><br/>
        <label for="city">City:</label>
        <select id="city_Canada" name="city">
            <option value=""></option>
            <option value="Montreal">Montreal</option>
            <option value="Quebec">Quebec</option>
            <option value="Toronto">Toronto</option>
        </select>
        <select id="city_Spain" name="city" class="hidden">
            <option value=""></option>
            <option value="Barcelona">Barcelona</option>
            <option value="Madrid">Madrid</option>
            <option value="Seville">Seville</option>
        </select>
        <select id="city_Usa" name="city" class="hidden">
            <option value=""></option>
            <option value="New-york">New York</option>
            <option value="Washington">Washington</option>
            <option value="San-francisco">San Francisco</option>
        </select><br/>
        <input type="button" value="Cancel" />
        <input type="submit" value="Save" />
    </form>
</div>
<?php include('../includes/scripts.php'); ?>
<script>
    $(document).ready(function() {
        app.controllers.page = new app.MyService({userId: '<?php echo $user_id; ?>'});
    });
</script>
</html>