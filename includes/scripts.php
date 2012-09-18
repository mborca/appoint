<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../resources/js/libs/jquery-1.8.1.min.js"><\/script>')</script>
<script src="../resources/js/plugins.js"></script>
<script src="../resources/js/main.js"></script>
<script>
    app.dependencies = { 
        facebookSDK: false, 
        ready: false, 
    };
    
    app.configuration.appId = '<?php echo FB_APP_ID; ?>';

    window.fbAsyncInit = function() {
        app.dependencies.facebookSDK = true;
        $(document).trigger('checkdependencies');
    };

    // Load Facebook SDK Asynchronously
    (function(d){
        var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement('script'); js.id = id; js.async = true;
        js.src = "//connect.facebook.net/en_US/all.js";
        ref.parentNode.insertBefore(js, ref);
    }(document));

    $(document).ready(function() {
        app.dependencies.ready = true;
        $(document).trigger('checkdependencies');                
    })
    .on('checkdependencies', function() {

        for(var d in app.dependencies) {
            if(!app.dependencies[d])
                return;
        }

        // And we're ready to go, start all the things !
        app.controllers.base = new app.Base();
    });
</script>