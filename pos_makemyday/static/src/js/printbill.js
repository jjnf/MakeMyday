odoo.define('makemyday_makemyday.printbill', function (require) {
"use strict";

var core = require('web.core');
var screens = require('point_of_sale.screens');
var gui = require('point_of_sale.gui');

var QWeb = core.qweb;

var BillScreenWidget = screens.ReceiptScreenWidget.extend({
    template: 'BillScreenWidget',
    click_next: function(){
        this.gui.show_screen('products');
    },
    click_back: function(){
        this.gui.show_screen('products');
    },
    render_receipt: function(){
        this._super();
        this.$('.receipt-paymentlines').remove();
        this.$('.receipt-change').remove();
    },
    print_web: function(){
        window.print();
    },
});

gui.define_screen({name:'bill', widget: BillScreenWidget});

var PrintBillButton = screens.ActionButtonWidget.extend({
    template: 'PrintBillButton',
    print_xml: function(){
        var order = this.makemyday.get('selectedOrder');
        if(order.get_orderlines().length > 0){
            var receipt = order.export_for_printing();
            receipt.bill = true;
            this.makemyday.proxy.print_receipt(QWeb.render('BillReceipt',{
                receipt: receipt, widget: this, pos: this.pos, order: order,
            }));
        }
    },
    button_click: function(){
        if (!this.makemyday.config.iface_print_via_proxy) {
            this.gui.show_screen('bill');
        } else {
            this.print_xml();
        }
    },
});

screens.define_action_button({
    'name': 'print_bill',
    'widget': PrintBillButton,
    'condition': function(){ 
        return this.makemyday.config.iface_printbill;
    },
});

});
