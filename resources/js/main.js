var app = app || {};

app.configuration = app.configuration || {
    // baseUrl: 'https://fbapps.my.phpcloud.com/appoint/',
    baseUrl: 'http://localhost/appoint/',
    appId: '',
    ogNamespace: 'appointments-app',
    userId: ''
};

app.controllers = app.controllers || {};

app.controllers.base = null;
app.controllers.page = null;

app.Base = function() {
    
    this.mapDom_();
    this.init_();
    this.bindEvents_();
};

app.Base.prototype.init_ = function() {
    
    FB.init({
      appId      : app.configuration.appId, // App ID
      channelUrl : app.configuration.baseUrl.replace(/https?:/, '') + 'channel.php', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });
};

app.Base.prototype.mapDom_ = function() {
    this.dom_ = {};

    this.dom_.categories = $('#categories');
    this.dom_.country = $('#country');
};

app.Base.prototype.bindEvents_ = function() {
    var self = this;
    
    this.dom_.country.on('change', function() {
        var cities = $('select[id^=city_]'),
            country = this.value;
        cities.addClass('hidden');
        $('#city_' + country).removeClass('hidden');
    });
};

app.Search = function() {
    
    this.userIsAuthorized_ = null;
    this.mapDom_();
    this.init_();
    this.bindEvents_();
};

app.Search.prototype.init_ = function() {
    var self = this;
    
    self.search($('#category').val(), $('#country').val(), $('#city_Canada').val())
    .done(function(results) {
        self.renderResults_(results);
    });
};

app.Search.prototype.mapDom_ = function() {
    this.dom_ = {};
};

app.Search.prototype.bindEvents_ = function() {
    var self = this;

    $('form').on('submit', function(e) {
        e.preventDefault();
        self.search($('#category').val(), $('#country').val(), $('#city_Canada').val())
        .done(function(results) {
          self.renderResults_(results);
        });
    });

    $('#results').on('change', '.rating', function() {
        var me = $(this),
            li = me.closest('li');

        self.rate(app.configuration.userId, 
            li.data('id'),
            me.val())
        .done(function(rating) {
            li.find('.average-rating').text(rating);
        });
    });
};

app.Search.prototype.renderResults_ = function(results) {
    
    var template = $('#results .template');
    
    $('#results').children(':not(.template)').remove();
    
    if (!results)
        return;

    for (var i = results.length - 1; i >= 0; i--) {
        var item = template.clone(false, false);
        item.data('id', results[i].facebook_id);
        item.find('.name').text(results[i].name);
        item.find('.name').attr('href', 'service.php?id=' + results[i].facebook_id);
        item.find('.city').text(results[i].city);
        item.find('.country').text(results[i].country);
        item.find('.category').text(results[i].category);
        item.find('.average-rating').text(results[i].average_rating ? parseFloat(results[i].average_rating, 2) : 'N/A');
        item.removeClass('template').appendTo('#results');
    };
};

app.Search.prototype.executeIfAuthorized_ = function(callback, askForLogin){
    var self = this;
    
    if(askForLogin === undefined)
        askForLogin = true;

    // if user already logged in
    if(self.userIsAuthorized_)
        callback();
    else {
        FB.getLoginStatus(function(response) {
            if (response.authResponse) {
                self.userIsAuthorized_ = true;
                callback();
            } else if (askForLogin) {
                FB.login(function(response) {
                    if (response.authResponse) {
                        self.userIsAuthorized_ = true;
                        callback();     
                    } else {
                        callback();
                    }
                }, { scope: 'publish_actions, friends_actions:' + app.configuration.ogNamespace + ', user_actions:' + app.configuration.ogNamespace });
            } else 
                callback();
        });
    }
};

app.Search.prototype.search = function(category, country, city) {
   return $.ajax({
        type: 'GET',
        data: {
            category: category, 
            country: country, 
            city: city
        },
        url: app.configuration.baseUrl + 'services/search.php',
        dataType: 'json'
    });
};

app.Search.prototype.rate = function(facebookId, serviceProviderId, rating) {
    var self = this;

    self.executeIfAuthorized_(function() {
        FB.api('/me/' + app.configuration.ogNamespace + ':rate', 
            'post',
            {
                service: app.configuration.baseUrl + 'canvas/service.php?id=' + serviceProviderId,
                rating: rating,
                review: ''
            },
            function(data) {
                console.log(arguments);
            });
    });

    return $.ajax({
        type: 'GET',
        data: {
            facebook_id: app.configuration.userId, 
            service_provider_facebook_id: serviceProviderId, 
            rating: rating
        },
        url: app.configuration.baseUrl + 'services/rate.php',
        dataType: 'json'
    });
};

app.MyService = function(options) {
    
    this.options = $.extend({}, app.MyService.options, options);
    this.mapDom_();
    this.init_();
    this.bindEvents_();
};

app.MyService.options = {
    userId: ''
}

app.MyService.prototype.mapDom_ = function() {
    this.dom_ = {};
    
    this.dom_.form = $('#myservice-form');
    this.dom_.name = $('#name');
    this.dom_.address = $('#address');
    this.dom_.email = $('#email');
    this.dom_.phone = $('#phone');
    this.dom_.category = $('#category');
    this.dom_.country = $('#country');
};

app.MyService.prototype.init_ = function() {
    var self = this;

    if (this.options.userId) {
        $.ajax({
            type: 'GET',
            data: {action: 'get', id: this.options.userId},
            url: this.dom_.form.attr('action'),
            dataType: 'json'
        }).done(function(data) {
            self.dom_.name.val(data.name);
            self.dom_.address.val(data.address);
            self.dom_.email.val(data.email);
            self.dom_.phone.val(data.phone);
            self.dom_.category.val(data.category);
            self.dom_.country.val(data.country);
        });
    }
};

app.MyService.prototype.bindEvents_ = function() {
    var self = this; 
    
    this.dom_.form.on('submit', function(e) {
        // hijack form submission
        e.preventDefault();
        
        self.save().done(function() {
          self.saveSuccess_();
        });;
    });
};

app.MyService.prototype.saveSuccess_ = function() {
    
};

app.MyService.prototype.save = function() {

    return $.ajax({
        type: 'GET',
        data: this.dom_.form.serialize(),
        url: this.dom_.form.attr('action'),
        dataType: 'json'
    });
};