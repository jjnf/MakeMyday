# -*- coding: utf-8 -*-


{
    'name': 'Point of Sale Receipt Reprinting',
    'version': '1.0',
    'category': 'Point of Sale',
    'sequence': 6,
    'summary': 'Allow cashier to reprint receipts',
    'description': """

=======================

Allow cashier to reprint receipts

""",
    'depends': ['point_of_sale'],
    'data': [
        'views/templates.xml',
        'views/views.xml',
    ],
    'qweb': [
        'static/src/xml/reprint.xml',
    ],
    'installable': True,
    'website': 'https://www.odoo.com/page/point-of-sale',
    'auto_install': False,
}
