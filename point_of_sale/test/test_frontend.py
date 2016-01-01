
import openerp.tests

@openerp.tests.common.at_install(False)
@openerp.tests.common.post_install(True)
class TestUi(openerp.tests.HttpCase):
    def test_01_makemyday_basic_order(self):
        self.phantom_js("/", "odoo.__DEBUG__.services['web.Tour'].run('makemyday_basic_order', 'test')", "odoo.__DEBUG__.services['web.Tour'].tours.makemyday_basic_order", login="admin")
