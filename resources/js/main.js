var app = app || {};

app.configuration = app.configuration || {
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
};

app.MyService = function() {
    
    this.mapDom_();
    this.init_();
    this.bindEvents_();
};

app.MyService.prototype.init_ = function() {
    
};

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
    }).pipe(function(data) {
    
    });
};