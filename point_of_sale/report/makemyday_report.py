# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from openerp.osv import fields, osv
from openerp import tools

class report_transaction_makemyday(osv.osv):
    _name = "report.transaction.makemyday"
    _description = "transaction for the makemyday"
    _auto = False
    _columns = {
        'date_create': fields.char('Date', size=16, readonly=True),
        'journal_id': fields.many2one('account.journal', 'Sales Journal', readonly=True),
        'jl_id': fields.many2one('account.journal', 'Cash Journals', readonly=True),
        'user_id': fields.many2one('res.users', 'User', readonly=True),
        'no_trans': fields.float('Number of Transaction', readonly=True),
        'amount': fields.float('Amount', readonly=True),
        'invoice_id': fields.float('Nbr Invoice', readonly=True),
        'invoice_am': fields.float('Invoice Amount', readonly=True),
        'product_nb': fields.float('Product Nb.', readonly=True),
        'disc': fields.float('Disc.', readonly=True),
    }

    def init(self, cr):
        tools.drop_view_if_exists(cr, 'report_transaction_makemyday')
        cr.execute("""
            create or replace view report_transaction_makemyday as (
               select
                    min(absl.id) as id,
                    count(absl.id) as no_trans,
                    sum(absl.amount) as amount,
                    sum((100.0-line.discount) * line.price_unit * line.qty / 100.0) as disc,
                    to_char(date_trunc('day',absl.create_date),'YYYY-MM-DD')::text as date_create,
                    po.user_id as user_id,
                    po.sale_journal as journal_id,
                    abs.journal_id as jl_id,
                    count(po.invoice_id) as invoice_id,
                    count(p.id) as product_nb
                from
                    account_bank_statement_line as absl,
                    account_bank_statement as abs,
                    product_product as p,
                    makemyday_order_line as line,
                    makemyday_order as po
                where
                    absl.makemyday_statement_id = po.id and
                    line.order_id=po.id and
                    line.product_id=p.id and
                    absl.statement_id=abs.id

                group by
                    po.user_id,po.sale_journal, abs.journal_id,
                    to_char(date_trunc('day',absl.create_date),'YYYY-MM-DD')::text
                )
        """)
                    #to_char(date_trunc('day',absl.create_date),'YYYY-MM-DD')
                    #to_char(date_trunc('day',absl.create_date),'YYYY-MM-DD')::text as date_create,

class report_sales_by_user_makemyday(osv.osv):
    _name = "report.sales.by.user.makemyday"
    _description = "Sales by user"
    _auto = False
    _columns = {
        'date_order': fields.date('Order Date',required=True, select=True),
        'amount': fields.float('Total', readonly=True, select=True),
        'qty': fields.float('Quantity', readonly=True, select=True),
        'user_id': fields.many2one('res.users', 'User', readonly=True, select=True),
    }

    def init(self, cr):
        tools.drop_view_if_exists(cr, 'report_sales_by_user_makemyday')
        cr.execute("""
            create or replace view report_sales_by_user_makemyday as (
                select
                    min(po.id) as id,
                    to_char(date_trunc('day',po.date_order),'YYYY-MM-DD')::text as date_order,
                    po.user_id as user_id,
                    sum(pol.qty)as qty,
                    sum((pol.price_unit * pol.qty * (1 - (pol.discount) / 100.0))) as amount
                from
                    makemyday_order as po,makemyday_order_line as pol,product_product as pp,product_template as pt
                where
                    pt.id=pp.product_tmpl_id and pp.id=pol.product_id and po.id = pol.order_id
               group by
                    to_char(date_trunc('day',po.date_order),'YYYY-MM-DD')::text,
                    po.user_id

                )
        """)

class report_sales_by_user_makemyday_month(osv.osv):
    _name = "report.sales.by.user.makemyday.month"
    _description = "Sales by user monthly"
    _auto = False
    _columns = {
        'date_order': fields.date('Order Date',required=True, select=True),
        'amount': fields.float('Total', readonly=True, select=True),
        'qty': fields.float('Quantity', readonly=True, select=True),
        'user_id': fields.many2one('res.users', 'User', readonly=True, select=True),
    }

    def init(self, cr):
        tools.drop_view_if_exists(cr, 'report_sales_by_user_makemyday_month')
        cr.execute("""
            create or replace view report_sales_by_user_makemyday_month as (
                select
                    min(po.id) as id,
                    to_char(date_trunc('month',po.date_order),'YYYY-MM-DD')::text as date_order,
                    po.user_id as user_id,
                    sum(pol.qty)as qty,
                    sum((pol.price_unit * pol.qty * (1 - (pol.discount) / 100.0))) as amount
                from
                    makemyday_order as po,makemyday_order_line as pol,product_product as pp,product_template as pt
                where
                    pt.id=pp.product_tmpl_id and pp.id=pol.product_id and po.id = pol.order_id
               group by
                    to_char(date_trunc('month',po.date_order),'YYYY-MM-DD')::text,
                    po.user_id

                )
        """)
