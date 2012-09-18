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
    <div><form method="GET" action="../services/search.php">
            <input type="hidden" id="category" value="<?php echo $_REQUEST['category'] ?>">
            <label for="country">Country: </label>
            <select id="country" name="country">
                <option value="Canada">Canada</option>
                <option value="Spain">Spain</option>
                <option value="Usa">United States</option>
            </select>
            <label for="city">City: </label>
            <select id="city_Canada" name="city">
                <option value="Montreal" selected="selected">Montreal</option>
                <option value="Quebec">Quebec</option>
                <option value="Ottawa">Ottawa</option>
            </select>
            <select id="city_Spain" name="city" class="hidden">
                <option value="barcelona">Barcelona</option>
                <option value="madrid">Madrid</option>
                <option value="seville">Seville</option>
            </select>
            <select id="city_Usa" name="city" class="hidden">
                <option value="new-york">New York</option>
                <option value="washington">Washington</option>
                <option value="san-francisco">San Francisco</option>
            </select>
            <input type="submit" value="Search" />
        </form>
        <ul id="results">
            <li id="service-11101" data-id="11101" class="template">
                <a href="#" class="name"></a>
                (<span class="category"></span>)<br/>
                <span class="city"></span>,
                <span class="country"></span><br/>
                Rating : <span class="average-rating"></span>
                <select class="rating">
                    <option value="">Rate !</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </li>
        </ul></div>
</div>
<?php include('../includes/scripts.php'); ?>
<script>
    $(document).ready(function() {
        app.controllers.page = new app.Search();
    });
</script>
</html>