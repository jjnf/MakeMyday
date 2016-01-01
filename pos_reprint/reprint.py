# -*- coding: utf-8 -*-

import openerp
from openerp.osv import fields, osv

class makemyday_config(osv.osv):
    _inherit = 'makemyday.config' 
    _columns = {
        'iface_reprint': fields.boolean('Receipt Reprinting', help="This allows you to reprint a previously printed receipt."),
        }
    _defaults = {
        'iface_reprint': False,
    }
