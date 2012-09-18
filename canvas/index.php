<?php include('../includes/header.php'); ?>
<?php include('../includes/menu.php'); ?>
<div class="page">
    <ul id="categories">
        <li><a href="javascript:;">All</a></li>
        <li><a href="javascript:;">Category 1</a></li>
        <li><a href="javascript:;">Category 2</a></li>
        <li><a href="javascript:;">Category 3</a></li>
        <li><a href="javascript:;">Category 4</a></li>
    </ul>
    <form method="GET" action="../services/search.php">
        <select id="country" name="country">
            <option value="canada">Canada</option>
            <option value="spain">Spain</option>
            <option value="usa">United States</option>
        </select>
        <select id="city_canada" name="city">
            <option value="montreal">Montreal</option>
            <option value="quebec">Quebec</option>
            <option value="toronto">Toronto</option>
        </select>
        <select id="city_spain" name="city">
            <option value="barcelona">Barcelona</option>
            <option value="madrid">Madrid</option>
            <option value="seville">Seville</option>
        </select>
        <select id="city_usa" name="city">
            <option value="new-york">New York</option>
            <option value="washington">Washington</option>
            <option value="san-francisco">San Francisco</option>
        </select>
        <input type="submit" value="Search" />
    </form>
    <ul id="results">
        <li data-id="1">
            <span class="name">test</span>
            <span class="average-rating">3.5</span>
            <select class="rating">
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
</html>