odoo.define('makemyday_reprint.makemyday_reprint', function (require) {
"use strict";

var devices = require('point_of_sale.devices');
var screens = require('point_of_sale.screens');
var core = require('web.core');

var _t = core._t;

devices.ProxyDevice.include({
    print_receipt: function(receipt) { 
        this._super(receipt);
        this.makemyday.old_receipt = receipt || this.makemyday.old_receipt;
    },
});

var ReprintButton = screens.ActionButtonWidget.extend({
    template: 'ReprintButton',
    button_click: function() {
        if (this.makemyday.old_receipt) {
            this.makemyday.proxy.print_receipt(this.makemyday.old_receipt);
        } else {
            this.gui.show_popup('error', {
                'title': _t('Nothing to Print'),
                'body':  _t('There is no previous receipt to print.'),
            });
        }
    },
});

screens.define_action_button({
    'name': 'reprint',
    'widget': ReprintButton,
    'condition': function(){
        return this.makemyday.config.iface_reprint && this.makemyday.config.iface_print_via_proxy;
    },
});

});
