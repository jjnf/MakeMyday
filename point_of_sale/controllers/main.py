# -*- coding: utf-8 -*-
import logging
import werkzeug.utils

from openerp import http
from openerp.http import request

_logger = logging.getLogger(__name__)


class PosController(http.Controller):

    @http.route('/makemyday/web', type='http', auth='user')
    def a(self, debug=False, **k):
        cr, uid, context, session = request.cr, request.uid, request.context, request.session

        # if user not logged in, log him in
        PosSession = request.registry['makemyday.session']
        makemyday_session_ids = PosSession.search(cr, uid, [('state','=','opened'),('user_id','=',session.uid)], context=context)
        if not makemyday_session_ids:
            return werkzeug.utils.redirect('/web#action=point_of_sale.action_client_makemyday_menu')
        PosSession.login(cr, uid, makemyday_session_ids, context=context)
        
        return request.render('point_of_sale.index')

