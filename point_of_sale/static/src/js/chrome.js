odoo.define('point_of_sale.chrome', function (require) {
"use strict";

var PosBaseWidget = require('point_of_sale.BaseWidget');
var gui = require('point_of_sale.gui');
var keyboard = require('point_of_sale.keyboard');
var models = require('point_of_sale.models');
var core = require('web.core');
var CrashManager = require('web.CrashManager');


var _t = core._t;
var QWeb = core.qweb;

/* -------- The Order Selector -------- */

// Allows the cashier to create / delete and
// switch between orders.

var OrderSelectorWidget = PosBaseWidget.extend({
    template: 'OrderSelectorWidget',
    init: function(parent, options) {
        this._super(parent, options);
        this.makemyday.get('orders').bind('add remove change',this.renderElement,this);
        this.makemyday.bind('change:selectedOrder',this.renderElement,this);
    },
    get_order_by_uid: function(uid) {
        var orders = this.makemyday.get_order_list();
        for (var i = 0; i < orders.length; i++) {
            if (orders[i].uid === uid) {
                return orders[i];
            }
        }
        return undefined;
    },
    order_click_handler: function(event,$el) {
        var order = this.get_order_by_uid($el.data('uid'));
        if (order) {
            this.makemyday.set_order(order);
        }
    },
    neworder_click_handler: function(event, $el) {
        this.makemyday.add_new_order();
    },
    deleteorder_click_handler: function(event, $el) {
        var self  = this;
        var order = this.makemyday.get_order(); 
        if (!order) {
            return;
        } else if ( !order.is_empty() ){
            this.gui.show_popup('confirm',{
                'title': _t('Destroy Current Order ?'),
                'body': _t('You will lose any data associated with the current order'),
                confirm: function(){
                    self.makemyday.delete_current_order();
                },
            });
        } else {
            this.makemyday.delete_current_order();
        }
    },
    renderElement: function(){
        var self = this;
        this._super();
        this.$('.order-button.select-order').click(function(event){
            self.order_click_handler(event,$(this));
        });
        this.$('.neworder-button').click(function(event){
            self.neworder_click_handler(event,$(this));
        });
        this.$('.deleteorder-button').click(function(event){
            self.deleteorder_click_handler(event,$(this));
        });
    },
});

/* ------- The User Name Widget ------- */

// Displays the current cashier's name and allows
// to switch between cashiers.

var UsernameWidget = PosBaseWidget.extend({
    template: 'UsernameWidget',
    init: function(parent, options){
        options = options || {};
        this._super(parent,options);
    },
    renderElement: function(){
        var self = this;
        this._super();

        this.$el.click(function(){
            self.click_username();
        });
    },
    click_username: function(){
        var self = this;
        this.gui.select_user({
            'security':     true,
            'current_user': this.makemyday.get_cashier(),
            'title':      _t('Change Cashier'),
        }).then(function(user){
            self.makemyday.set_cashier(user);
            self.renderElement();
        });
    },
    get_name: function(){
        var user = this.makemyday.cashier || this.makemyday.user;
        if(user){
            return user.name;
        }else{
            return "";
        }
    },
});

/* -------- The Header Button --------- */

// Used to quickly add buttons with simple
// labels and actions to the point of sale 
// header.

var HeaderButtonWidget = PosBaseWidget.extend({
    template: 'HeaderButtonWidget',
    init: function(parent, options){
        options = options || {};
        this._super(parent, options);
        this.action = options.action;
        this.label   = options.label;
    },
    renderElement: function(){
        var self = this;
        this._super();
        if(this.action){
            this.$el.click(function(){
                self.action();
            });
        }
    },
    show: function(){ this.$el.removeClass('oe_hidden'); },
    hide: function(){ this.$el.addClass('oe_hidden'); },
});

/* --------- The Debug Widget --------- */

// The debug widget lets the user control 
// and monitor the hardware and software status
// without the use of the proxy, or to access
// the raw locally stored db values, useful
// for debugging

var DebugWidget = PosBaseWidget.extend({
    template: "DebugWidget",
    eans:{
        admin_badge:  '0410100000006',
        client_badge: '0420200000004',
        invalid_ean:  '1232456',
        soda_33cl:    '5449000000996',
        oranges_kg:   '2100002031410',
        lemon_price:  '2301000001560',
        unknown_product: '9900000000004',
    },
    events:[
        'open_cashbox',
        'print_receipt',
        'scale_read',
    ],
    init: function(parent,options){
        this._super(parent,options);
        var self = this;
        
        // for dragging the debug widget around
        this.dragging  = false;
        this.dragmakemyday = {x:0, y:0};

        function eventmakemyday(event){
            if(event.touches && event.touches[0]){
                return {x: event.touches[0].screenX, y: event.touches[0].screenY};
            }else{
                return {x: event.screenX, y: event.screenY};
            }
        }

        this.dragend_handler = function(event){
            self.dragging = false;
        };
        this.dragstart_handler = function(event){
            self.dragging = true;
            self.dragmakemyday = eventmakemyday(event);
        };
        this.dragmove_handler = function(event){
            if(self.dragging){
                var top = this.offsetTop;
                var left = this.offsetLeft;
                var makemyday  = eventmakemyday(event);
                var dx   = makemyday.x - self.dragmakemyday.x; 
                var dy   = makemyday.y - self.dragmakemyday.y; 

                self.dragmakemyday = makemyday;

                this.style.right = 'auto';
                this.style.bottom = 'auto';
                this.style.left = left + dx + 'px';
                this.style.top  = top  + dy + 'px';
            }
            event.preventDefault();
            event.stopPropagation();
        };
    },
    show: function() {
        this.$el.css({opacity:0});
        this.$el.removeClass('oe_hidden');
        this.$el.animate({opacity:1},250,'swing');
    },
    hide: function() {
        var self = this;
        this.$el.animate({opacity:0,},250,'swing',function(){
            self.$el.addClass('oe_hidden');
        });
    },
    start: function(){
        var self = this;
        
        if (this.makemyday.debug) {
            this.show();
        }

        this.el.addEventListener('mouseleave', this.dragend_handler);
        this.el.addEventListener('mouseup',    this.dragend_handler);
        this.el.addEventListener('touchend',   this.dragend_handler);
        this.el.addEventListener('touchcancel',this.dragend_handler);
        this.el.addEventListener('mousedown',  this.dragstart_handler);
        this.el.addEventListener('touchstart', this.dragstart_handler);
        this.el.addEventListener('mousemove',  this.dragmove_handler);
        this.el.addEventListener('touchmove',  this.dragmove_handler);

        this.$('.toggle').click(function(){
            self.hide();
        });
        this.$('.button.set_weight').click(function(){
            var kg = Number(self.$('input.weight').val());
            if(!isNaN(kg)){
                self.makemyday.proxy.debug_set_weight(kg);
            }
        });
        this.$('.button.reset_weight').click(function(){
            self.$('input.weight').val('');
            self.makemyday.proxy.debug_reset_weight();
        });
        this.$('.button.custom_ean').click(function(){
            var ean = self.makemyday.barcode_reader.barcode_parser.sanitize_ean(self.$('input.ean').val() || '0');
            self.$('input.ean').val(ean);
            self.makemyday.barcode_reader.scan(ean);
        });
        this.$('.button.barcode').click(function(){
            self.makemyday.barcode_reader.scan(self.$('input.ean').val());
        });
        this.$('.button.delete_orders').click(function(){
            self.gui.show_popup('confirm',{
                'title': _t('Delete Paid Orders ?'),
                'body':  _t('This operation will permanently destroy all paid orders from the local storage. You will lose all the data. This operation cannot be undone.'),
                confirm: function(){
                    self.makemyday.db.remove_all_orders();
                    self.makemyday.set({synch: { state:'connected', pending: 0 }});
                },
            });
        });
        this.$('.button.delete_unpaid_orders').click(function(){
            self.gui.show_popup('confirm',{
                'title': _t('Delete Unpaid Orders ?'),
                'body':  _t('This operation will permanently destroy all unpaid orders from all sessions that have been put in the local storage. You will lose all the data and exit the point of sale. This operation cannot be undone.'),
                confirm: function(){
                    self.makemyday.db.remove_all_unpaid_orders();
                    window.location = '/';
                },
            });
        });

        this.$('.button.export_unpaid_orders').click(function(){
            self.gui.download_file(self.makemyday.export_unpaid_orders(),
                "unpaid_orders_" + (new Date()).toUTCString().replace(/\ /g,'_') + '.json');
        });

        this.$('.button.export_paid_orders').click(function() {
            self.gui.download_file(self.makemyday.export_paid_orders(),
                "paid_orders_" + (new Date()).toUTCString().replace(/\ /g,'_') + '.json');
        });

        this.$('.button.import_orders input').on('change', function(event) {
            var file = event.target.files[0];

            if (file) {
                var reader = new FileReader();
                
                reader.onload = function(event) {
                    var report = self.makemyday.import_orders(event.target.result);
                    self.gui.show_popup('orderimport',{report:report});
                };
                
                reader.readAsText(file);
            }
        });

        _.each(this.events, function(name){
            self.makemyday.proxy.add_notification(name,function(){
                self.$('.event.'+name).stop().clearQueue().css({'background-color':'#6CD11D'}); 
                self.$('.event.'+name).animate({'background-color':'#1E1E1E'},2000);
            });
        });
    },
});

/* --------- The Status Widget -------- */

// Base class for widgets that want to display
// status in the point of sale header.

var StatusWidget = PosBaseWidget.extend({
    status: ['connected','connecting','disconnected','warning','error'],
    set_status: function(status,msg){
        for(var i = 0; i < this.status.length; i++){
            this.$('.js_'+this.status[i]).addClass('oe_hidden');
        }
        this.$('.js_'+status).removeClass('oe_hidden');
        
        if(msg){
            this.$('.js_msg').removeClass('oe_hidden').html(msg);
        }else{
            this.$('.js_msg').addClass('oe_hidden').html('');
        }
    },
});

/* ------- Synch. Notifications ------- */

// Displays if there are orders that could
// not be submitted, and how many. 

var SynchNotificationWidget = StatusWidget.extend({
    template: 'SynchNotificationWidget',
    start: function(){
        var self = this;
        this.makemyday.bind('change:synch', function(makemyday,synch){
            self.set_status(synch.state, synch.pending);
        });
        this.$el.click(function(){
            self.makemyday.push_order(null,{'show_error':true});
        });
    },
});

/* --------- The Proxy Status --------- */

// Displays the status of the hardware proxy
// (connected, disconnected, errors ... )

var ProxyStatusWidget = StatusWidget.extend({
    template: 'ProxyStatusWidget',
    set_smart_status: function(status){
        if(status.status === 'connected'){
            var warning = false;
            var msg = '';
            if(this.makemyday.config.iface_scan_via_proxy){
                var scanner = status.drivers.scanner ? status.drivers.scanner.status : false;
                if( scanner != 'connected' && scanner != 'connecting'){
                    warning = true;
                    msg += _t('Scanner');
                }
            }
            if( this.makemyday.config.iface_print_via_proxy || 
                this.makemyday.config.iface_cashdrawer ){
                var printer = status.drivers.escmakemyday ? status.drivers.escmakemyday.status : false;
                if( printer != 'connected' && printer != 'connecting'){
                    warning = true;
                    msg = msg ? msg + ' & ' : msg;
                    msg += _t('Printer');
                }
            }
            if( this.makemyday.config.iface_electronic_scale ){
                var scale = status.drivers.scale ? status.drivers.scale.status : false;
                if( scale != 'connected' && scale != 'connecting' ){
                    warning = true;
                    msg = msg ? msg + ' & ' : msg;
                    msg += _t('Scale');
                }
            }
            msg = msg ? msg + ' ' + _t('Offline') : msg;
            this.set_status(warning ? 'warning' : 'connected', msg);
        }else{
            this.set_status(status.status,'');
        }
    },
    start: function(){
        var self = this;
        
        this.set_smart_status(this.makemyday.proxy.get('status'));

        this.makemyday.proxy.on('change:status',this,function(eh,status){ //FIXME remove duplicate changes 
            self.set_smart_status(status.newValue);
        });

        this.$el.click(function(){
            self.makemyday.connect_to_proxy();
        });
    },
});

/*--------------------------------------*\
 |             THE CHROME               |
\*======================================*/

// The Chrome is the main widget that contains 
// all other widgets in the PointOfSale.
//
// It is the first object instanciated and the
// starting point of the point of sale code.
//
// It is mainly composed of :
// - a header, containing the list of orders
// - a leftpane, containing the list of bought 
//   products (orderlines) 
// - a rightpane, containing the screens 
//   (see makemyday_screens.js)
// - popups
// - an onscreen keyboard
// - .gui which controls the switching between 
//   screens and the showing/closing of popups

var Chrome = PosBaseWidget.extend({
    template: 'Chrome',
    init: function() { 
        var self = this;
        this._super(arguments[0],{});

        this.started  = new $.Deferred(); // resolves when DOM is online
        this.ready    = new $.Deferred(); // resolves when the whole GUI has been loaded

        this.makemyday = new models.PosModel(this.session,{chrome:this});
        this.gui = new gui.Gui({makemyday: this.makemyday, chrome: this});
        this.chrome = this; // So that chrome's childs have chrome set automatically
        this.makemyday.gui = this.gui;

        this.logo_click_time  = 0;
        this.logo_click_count = 0;

        this.widget = {};   // contains references to subwidgets instances

        this.cleanup_dom();

        this.makemyday.ready.done(function(){
            self.build_chrome();
            self.build_widgets();
            self.disable_rubberbanding();
            self.disable_backpace_back();
            self.ready.resolve();
            self.loading_hide();
            self.replace_crashmanager();
            self.makemyday.push_order();
        }).fail(function(err){   // error when loading models data from the backend
            self.loading_error(err);
        });
    },

    cleanup_dom:  function() {
        // remove default webclient handlers that induce click delay
        $(document).off();
        $(window).off();
        $('html').off();
        $('body').off();
        $(this.$el).parent().off();
        $('document').off();
        $('.oe_web_client').off();
        $('.openerp_webclient_container').off();
    },

    build_chrome: function() { 
        var self = this;
        FastClick.attach(document.body);
        core.bus.trigger('set_full_screen', true);

        this.renderElement();

        this.$('.makemyday-logo').click(function(){
            self.click_logo();
        });

        if(this.makemyday.config.iface_big_scrollbars){
            this.$el.addClass('big-scrollbars');
        }
    },

    // displays a system error with the error-traceback
    // popup.
    show_error: function(error) {
        this.gui.show_popup('error-traceback',{
            'title': error.message,
            'body':  error.message + '\n' + error.data.debug + '\n',
        });
    },

    // replaces the error handling of the existing crashmanager which
    // uses jquery dialog to display the error, to use the makemyday popup
    // instead
    replace_crashmanager: function() {
        var self = this;
        CrashManager.include({
            show_error: function(error) {
                if (self.gui) {
                    self.show_error(error);
                } else {
                    this._super(error);
                }
            },
        });
    },

    click_logo: function() {
        if (this.makemyday.debug) {
            this.widget.debug.show();
        } else {
            var self  = this;
            var time  = (new Date()).getTime();
            var delay = 500;
            if (this.logo_click_time + 500 < time) {
                this.logo_click_time  = time;
                this.logo_click_count = 1;
            } else {
                this.logo_click_time  = time;
                this.logo_click_count += 1;
                if (this.logo_click_count >= 6) {
                    this.logo_click_count = 0;
                    this.gui.sudo().then(function(){
                        self.widget.debug.show();
                    });
                }
            }
        }
    },

    disable_rubberbanding: function(){
        // prevent the makemyday body from being scrollable. 
        document.body.addEventListener('touchmove',function(event){
            var node = event.target;
            while(node){
                if(node.classList && node.classList.contains('touch-scrollable')){
                    return;
                }
                node = node.parentNode;
            }
            event.preventDefault();
        });
    },

    // prevent backspace from performing a 'back' navigation
    disable_backpace_back: function() {
       $(document).on("keydown", function (e) {
           if (e.which === 8 && !$(e.target).is("input, textarea")) {
               e.preventDefault();
           }
       });
    },

    loading_error: function(err){
        var self = this;

        var title = err.message;
        var body  = err.stack;

        if(err.message === 'XmlHttpRequestError '){
            title = 'Network Failure (XmlHttpRequestError)';
            body  = 'The Point of Sale could not be loaded due to a network problem.\n Please check your internet connection.';
        }else if(err.message === 'OpenERP Server Error'){
            title = err.data.message;
            body  = err.data.debug;
        }

        if( typeof body !== 'string' ){
            body = 'Traceback not available.';
        }

        var popup = $(QWeb.render('ErrorTracebackPopupWidget',{
            widget: { options: {title: title , body: body }},
        }));

        popup.find('.button').click(function(){
            self.gui.close();
        });

        popup.css({ zindex: 9001 });

        popup.appendTo(this.$el);
    },
    loading_progress: function(fac){
        this.$('.loader .loader-feedback').removeClass('oe_hidden');
        this.$('.loader .progress').removeClass('oe_hidden').css({'width': ''+Math.floor(fac*100)+'%'});
    },
    loading_message: function(msg,progress){
        this.$('.loader .loader-feedback').removeClass('oe_hidden');
        this.$('.loader .message').text(msg);
        if (typeof progress !== 'undefined') {
            this.loading_progress(progress);
        } else {
            this.$('.loader .progress').addClass('oe_hidden');
        }
    },
    loading_skip: function(callback){
        if(callback){
            this.$('.loader .loader-feedback').removeClass('oe_hidden');
            this.$('.loader .button.skip').removeClass('oe_hidden');
            this.$('.loader .button.skip').off('click');
            this.$('.loader .button.skip').click(callback);
        }else{
            this.$('.loader .button.skip').addClass('oe_hidden');
        }
    },
    loading_hide: function(){
        var self = this;
        this.$('.loader').animate({opacity:0},1500,'swing',function(){self.$('.loader').addClass('oe_hidden');});
    },
    loading_show: function(){
        this.$('.loader').removeClass('oe_hidden').animate({opacity:1},150,'swing');
    },
    widgets: [
        {
            'name':   'order_selector',
            'widget': OrderSelectorWidget,
            'replace':  '.placeholder-OrderSelectorWidget',
        },{
            'name':   'proxy_status',
            'widget': ProxyStatusWidget,
            'append':  '.makemyday-rightheader',
            'condition': function(){ return this.makemyday.config.use_proxy; },
        },{
            'name':   'notification',
            'widget': SynchNotificationWidget,
            'append':  '.makemyday-rightheader',
        },{
            'name':   'close_button',
            'widget': HeaderButtonWidget,
            'append':  '.makemyday-rightheader',
            'args': {
                label: _t('Close'),
                action: function(){ 
                    var self = this;
                    if (!this.confirmed) {
                        this.$el.addClass('confirm');
                        this.$el.text(_t('Confirm'));
                        this.confirmed = setTimeout(function(){
                            self.$el.removeClass('confirm');
                            self.$el.text(_t('Close'));
                            self.confirmed = false;
                        },2000);
                    } else {
                        clearTimeout(this.confirmed);
                        this.gui.close();
                    }
                },
            }
        },{
            'name':   'username',
            'widget': UsernameWidget,
            'replace':  '.placeholder-UsernameWidget',
        },{
            'name':  'keyboard',
            'widget': keyboard.OnscreenKeyboardWidget,
            'replace': '.placeholder-OnscreenKeyboardWidget',
        },{
            'name':  'debug',
            'widget': DebugWidget,
            'append': '.makemyday-content',
        },
    ],

    // This method instantiates all the screens, widgets, etc. 
    build_widgets: function() {
        var classe;

        for (var i = 0; i < this.widgets.length; i++) {
            var def = this.widgets[i];
            if ( !def.condition || def.condition.call(this) ) {
                var args = typeof def.args === 'function' ? def.args(this) : def.args;
                var w = new def.widget(this, args || {});
                if (def.replace) {
                    w.replace(this.$(def.replace));
                } else if (def.append) {
                    w.appendTo(this.$(def.append));
                } else if (def.prepend) {
                    w.prependTo(this.$(def.prepend));
                } else {
                    w.appendTo(this.$el);
                }
                this.widget[def.name] = w;
            }
        }

        this.screens = {};
        for (i = 0; i < this.gui.screen_classes.length; i++) {
            classe = this.gui.screen_classes[i];
            if (!classe.condition || classe.condition.call(this)) {
                var screen = new classe.widget(this,{});
                    screen.appendTo(this.$('.screens'));
                this.screens[classe.name] = screen;
                this.gui.add_screen(classe.name, screen);
            }
        }

        this.popups = {};
        for (i = 0; i < this.gui.popup_classes.length; i++) {
            classe = this.gui.popup_classes[i];
            if (!classe.condition || classe.condition.call(this)) {
                var popup = new classe.widget(this,{});
                    popup.appendTo(this.$('.popups'));
                this.popups[classe.name] = popup;
                this.gui.add_popup(classe.name, popup);
            }
        }

        this.gui.set_startup_screen('products');
        this.gui.set_default_screen('products');

    },

    destroy: function() {
        this.makemyday.destroy();
        core.bus.trigger('set_full_screen', false);
        this._super();
    }
});

return {
    Chrome: Chrome,
    OrderSelectorWidget: OrderSelectorWidget,
};
});

