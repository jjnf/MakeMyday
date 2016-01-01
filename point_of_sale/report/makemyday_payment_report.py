# -*- coding: utf-8 -*-
import time
from openerp.osv import osv
from openerp.report import report_sxw


class makemyday_payment_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(makemyday_payment_report, self).__init__(cr, uid, name, context=context)
        self.total = 0.0
        self.localcontext.update({
            'time': time,
            'makemyday_payment': self._makemyday_payment,
            'makemyday_payment_total':self._makemyday_payment_total,
        })

    def _makemyday_payment(self, obj):
        self.total = 0
        data={}
        sql = """ select id from makemyday_order where id = %d"""%(obj.id)
        self.cr.execute(sql)
        if self.cr.fetchone():
            self.cr.execute ("select pt.name,pp.default_code as code,pol.qty,pu.name as uom,pol.discount,pol.price_unit, " \
                                 "(pol.price_unit * pol.qty * (1 - (pol.discount) / 100.0)) as total  " \
                                 "from makemyday_order as po,makemyday_order_line as pol,product_product as pp,product_template as pt, product_uom as pu " \
                                 "where pt.id=pp.product_tmpl_id and pp.id=pol.product_id and po.id = pol.order_id  and pu.id=pt.uom_id " \
                                 "and po.state IN ('paid','invoiced') and to_char(date_trunc('day',po.date_order),'YYYY-MM-DD')::date = current_date and po.id=%d"%(obj.id))
            data=self.cr.dictfetchall()
        else:
            self.cr.execute ("select pt.name,pp.default_code as code,pol.qty,pu.name as uom,pol.discount,pol.price_unit, " \
                                 "(pol.price_unit * pol.qty * (1 - (pol.discount) / 100.0)) as total  " \
                                 "from makemyday_order as po,makemyday_order_line as pol,product_product as pp,product_template as pt, product_uom as pu  " \
                                 "where pt.id=pp.product_tmpl_id and pp.id=pol.product_id and po.id = pol.order_id and pu.id=pt.uom_id  " \
                                 "and po.state IN ('paid','invoiced') and to_char(date_trunc('day',po.date_order),'YYYY-MM-DD')::date = current_date")
            data=self.cr.dictfetchall()

        for d in data:
            self.total += d['price_unit'] * d['qty']
        return data

    def _makemyday_payment_total(self, o):
        return self.total


class report_makemyday_payment(osv.AbstractModel):
    _name = 'report.point_of_sale.report_payment'
    _inherit = 'report.abstract_report'
    _template = 'point_of_sale.report_payment'
    _wrapped_report_class = makemyday_payment_report
