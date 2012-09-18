<?php include('../includes/header.php'); ?>
<div id="fb-root"></div>
<?php include('../includes/menu.php'); ?>
<div class="page">
    <ul id="categories">
        <li><a href="?category=">All</a></li>
        <li><a href="?category=Barber">Barber</a></li>
        <li><a href="?category=Dentist">Dentist</a></li>
        <li><a href="?category=Financial">Financial</a></li>
    </ul>
    <form method="GET" action="../services/search.php">
        <input type="hidden" id="category" value="<?php echo $_REQUEST['category'] ?>">
        <select id="country" name="country">
            <option value="canada">Canada</option>
            <option value="spain">Spain</option>
            <option value="usa">United States</option>
        </select>
        <select id="city_canada" name="city">
            <option value="montreal" selected="selected">Montreal</option>
            <option value="quebec">Quebec</option>
            <option value="toronto">Toronto</option>
        </select>
        <select id="city_spain" name="city" class="hidden">
            <option value="barcelona">Barcelona</option>
            <option value="madrid">Madrid</option>
            <option value="seville">Seville</option>
        </select>
        <select id="city_usa" name="city" class="hidden">
            <option value="new-york">New York</option>
            <option value="washington">Washington</option>
            <option value="san-francisco">San Francisco</option>
        </select>
        <input type="submit" value="Search" />
    </form>
    <ul id="results">
        <li id="service-11101" data-id="11101" class="template">
            <span class="name"></span>
            <span class="city"></span>
            <span class="country"></span>
            <span class="category"></span>
            <span class="average-rating"></span>
            <select class="rating">
                <option value="">Rate !</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
        </li>
    </ul>
</div>
<?php include('../includes/scripts.php'); ?>
<script>
    $(document).ready(function() {
        app.controllers.page = new app.Search();
    });
</script>
</html>