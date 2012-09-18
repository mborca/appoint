var app = app || {};

app.configuration = app.configuration || {
    // baseUrl: 'https://fbapps.my.phpcloud.com/appoint/',
    baseUrl: 'http://localhost/appoint/canvas/',
    appId: '',
    ogNamespace: ''
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
    
    this.mapDom_();
    this.init_();
    this.bindEvents_();
};

app.Search.prototype.init_ = function() {
    
};

app.Search.prototype.mapDom_ = function() {
    this.dom_ = {};
};

app.Search.prototype.bindEvents_ = function() {
    var self = this;

    $('#results').on('change', '.rating', function() {
        var me = $(this);
        self.rate(me.closest('li').data('id') ,me.val());
    });
};

app.Search.prototype.search = function() {
    return $.ajax({
        type: 'GET',
        data: {},
        url: this.dom_.form.attr('action')});
};

app.Search.prototype.rate = function(id, rating) {
     return $.ajax({
        type: 'GET',
        data: {},
        url: this.dom_.form.attr('action'),
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