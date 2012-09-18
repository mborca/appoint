var app = app || {};

app.configuration = app.configuration || {
    appId: '',
    ogNamespace: ''
};

app.controllers = app.controllers || {};

app.controllers.base = null;
app.controllers.page = null;

app.Base = function() {

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
    this.dom_.categories = $('#categories');
};

app.Search.prototype.bindEvents_ = function() {
    var self = this;
};