<?php include('../includes/header.php'); ?>
<?php include('../includes/menu.php'); ?>
<div class="page">
    <form id="myservice-form" method="get" action="../services/myservice.php">
        <label for="name">Name:</label><input id="name" name="name" /><br />
        <label for="address">Address:</label><input id="address" name="address" /><br />
        <label for="email">Email:</label><input id="email" name="email" /><br />
        <label for="phone">Phone:</label><input id="phone" name="phone" /><br />
        <label for="category">Category:</label>
        <select id="category" name="category">
            <option value="category_1">Category 1</option>
            <option value="category_2">Category 2</option>
            <option value="category_3">Category 3</option>
            <option value="category_4">Category 4</option>
        </select><br />
        <label for="country">Country:</label>
        <select id="country" name="country">
            <option value="canada">Canada</option>
            <option value="spain">Spain</option>
            <option value="usa">United States</option>
        </select><br/>
        <label for="city">City:</label>
        <select id="city_canada" name="city">
            <option value=""></option>
            <option value="montreal">Montreal</option>
            <option value="quebec">Quebec</option>
            <option value="toronto">Toronto</option>
        </select>
        <select id="city_spain" name="city" class="hidden">
            <option value=""></option>
            <option value="barcelona">Barcelona</option>
            <option value="madrid">Madrid</option>
            <option value="seville">Seville</option>
        </select>
        <select id="city_usa" name="city" class="hidden">
            <option value=""></option>
            <option value="new-york">New York</option>
            <option value="washington">Washington</option>
            <option value="san-francisco">San Francisco</option>
        </select><br/>
        <input type="button" value="Cancel" />
        <input type="submit" value="Save" />
    </form>
</div>
<?php include('../includes/scripts.php'); ?>
<script>
    $(document).ready(function() {
        app.controllers.page = new app.MyService();
    });
</script>
</html>