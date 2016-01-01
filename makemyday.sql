-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.7.0
-- PostgreSQL version: 9.3
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: makemyday | type: DATABASE --
-- -- DROP DATABASE makemyday;
-- CREATE DATABASE makemyday
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'pt_PT.UTF8'
-- 	LC_CTYPE = 'pt_PT.UTF8'
-- 	TABLESPACE = pg_default
-- ;
-- -- ddl-end --
-- 

-- object: public.res_users | type: TABLE --
-- DROP TABLE public.res_users;
CREATE TABLE public.res_users(
	id integer NOT NULL DEFAULT nextval('res_users_id_seq'::regclass),
	active boolean DEFAULT true,
	login character varying(64) NOT NULL,
	password character varying DEFAULT NULL::character varying,
	company_id integer NOT NULL,
	partner_id integer NOT NULL,
	create_date timestamp,
	create_uid integer,
	share boolean,
	write_uid integer,
	write_date timestamp,
	signature text,
	action_id integer,
	password_crypt character varying,
	alias_id integer NOT NULL,
	chatter_needaction_auto boolean,
	sale_team_id integer,
	makemyday_config integer,
	makemyday_security_pin character varying(32),
	CONSTRAINT res_users_pkey PRIMARY KEY (id),
	CONSTRAINT res_users_login_key UNIQUE (login)

);
-- ddl-end --
COMMENT ON COLUMN public.res_users.create_date IS 'Created on';
COMMENT ON COLUMN public.res_users.create_uid IS 'Created by';
COMMENT ON COLUMN public.res_users.share IS 'Share User';
COMMENT ON COLUMN public.res_users.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.res_users.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.res_users.signature IS 'Signature';
COMMENT ON COLUMN public.res_users.action_id IS 'Home Action';
COMMENT ON COLUMN public.res_users.password_crypt IS 'Encrypted Password';
COMMENT ON COLUMN public.res_users.alias_id IS 'Alias';
COMMENT ON COLUMN public.res_users.chatter_needaction_auto IS 'Automatically set needaction as Read';
COMMENT ON COLUMN public.res_users.sale_team_id IS 'Sales Team';
COMMENT ON COLUMN public.res_users.makemyday_config IS 'Default Point of Sale';
COMMENT ON COLUMN public.res_users.makemyday_security_pin IS 'Security PIN';
-- ddl-end --

-- object: public.res_company | type: TABLE --
-- DROP TABLE public.res_company;
CREATE TABLE public.res_company(
	id integer NOT NULL DEFAULT nextval('res_company_id_seq'::regclass),
	name character varying NOT NULL,
	partner_id integer NOT NULL,
	currency_id integer NOT NULL,
	rml_footer text,
	create_date timestamp,
	rml_header text NOT NULL,
	rml_paper_format character varying NOT NULL,
	write_uid integer,
	logo_web bytea,
	font integer,
	account_no character varying,
	parent_id integer,
	email character varying(64),
	create_uid integer,
	custom_footer boolean,
	phone character varying(64),
	rml_header2 text NOT NULL,
	rml_header3 text NOT NULL,
	write_date timestamp,
	rml_header1 character varying,
	company_registry character varying(64),
	paperformat_id integer,
	fiscalyear_lock_date date,
	bank_account_code_prefix character varying,
	cash_account_code_prefix character varying,
	anglo_saxon_accounting boolean,
	fiscalyear_last_day integer NOT NULL,
	property_stock_account_input_categ_id integer,
	property_stock_valuation_account_id integer,
	expects_chart_of_accounts boolean,
	transfer_account_id integer,
	property_stock_account_output_categ_id integer,
	currency_exchange_journal_id integer,
	period_lock_date date,
	paypal_account character varying(128),
	accounts_code_digits integer,
	chart_template_id integer,
	overdue_msg text,
	fiscalyear_last_month integer NOT NULL,
	tax_calculation_rounding_method character varying,
	sale_note text,
	propagation_minimum_delta integer,
	internal_transit_location_id integer,
	security_lead double precision NOT NULL,
	vat_check_vies boolean,
	CONSTRAINT res_company_pkey PRIMARY KEY (id),
	CONSTRAINT res_company_name_uniq UNIQUE (name)

);
-- ddl-end --
-- object: res_company_parent_id_index | type: INDEX --
-- DROP INDEX public.res_company_parent_id_index;
CREATE INDEX res_company_parent_id_index ON public.res_company
	USING btree
	(
	  parent_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON COLUMN public.res_company.rml_footer IS 'Report Footer';
COMMENT ON COLUMN public.res_company.create_date IS 'Created on';
COMMENT ON COLUMN public.res_company.rml_header IS 'RML Header';
COMMENT ON COLUMN public.res_company.rml_paper_format IS 'Paper Format';
COMMENT ON COLUMN public.res_company.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.res_company.logo_web IS 'Logo Web';
COMMENT ON COLUMN public.res_company.font IS 'Font';
COMMENT ON COLUMN public.res_company.account_no IS 'Account No.';
COMMENT ON COLUMN public.res_company.parent_id IS 'Parent Company';
COMMENT ON COLUMN public.res_company.email IS 'Email';
COMMENT ON COLUMN public.res_company.create_uid IS 'Created by';
COMMENT ON COLUMN public.res_company.custom_footer IS 'Custom Footer';
COMMENT ON COLUMN public.res_company.phone IS 'Phone';
COMMENT ON COLUMN public.res_company.rml_header2 IS 'RML Internal Header';
COMMENT ON COLUMN public.res_company.rml_header3 IS 'RML Internal Header for Landscape Reports';
COMMENT ON COLUMN public.res_company.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.res_company.rml_header1 IS 'Company Tagline';
COMMENT ON COLUMN public.res_company.company_registry IS 'Company Registry';
COMMENT ON COLUMN public.res_company.paperformat_id IS 'Paper format';
COMMENT ON COLUMN public.res_company.fiscalyear_lock_date IS 'Lock Date';
COMMENT ON COLUMN public.res_company.bank_account_code_prefix IS 'Prefix of the bank accounts';
COMMENT ON COLUMN public.res_company.cash_account_code_prefix IS 'Prefix of the cash accounts';
COMMENT ON COLUMN public.res_company.anglo_saxon_accounting IS 'Use anglo-saxon accounting';
COMMENT ON COLUMN public.res_company.fiscalyear_last_day IS 'Fiscalyear last day';
COMMENT ON COLUMN public.res_company.property_stock_account_input_categ_id IS 'Input Account for Stock Valuation';
COMMENT ON COLUMN public.res_company.property_stock_valuation_account_id IS 'Account Template for Stock Valuation';
COMMENT ON COLUMN public.res_company.expects_chart_of_accounts IS 'Expects a Chart of Accounts';
COMMENT ON COLUMN public.res_company.transfer_account_id IS 'Inter-Banks Transfer Account';
COMMENT ON COLUMN public.res_company.property_stock_account_output_categ_id IS 'Output Account for Stock Valuation';
COMMENT ON COLUMN public.res_company.currency_exchange_journal_id IS 'Exchange Gain or Loss Journal';
COMMENT ON COLUMN public.res_company.period_lock_date IS 'Lock Date for Non-Advisers';
COMMENT ON COLUMN public.res_company.paypal_account IS 'Paypal Account';
COMMENT ON COLUMN public.res_company.accounts_code_digits IS 'Number of digits in an account code';
COMMENT ON COLUMN public.res_company.chart_template_id IS 'Chart template id';
COMMENT ON COLUMN public.res_company.overdue_msg IS 'Overdue Payments Message';
COMMENT ON COLUMN public.res_company.fiscalyear_last_month IS 'Fiscalyear last month';
COMMENT ON COLUMN public.res_company.tax_calculation_rounding_method IS 'Tax Calculation Rounding Method';
COMMENT ON COLUMN public.res_company.sale_note IS 'Default Terms and Conditions';
COMMENT ON COLUMN public.res_company.propagation_minimum_delta IS 'Minimum Delta for Propagation of a Date Change on moves linked together';
COMMENT ON COLUMN public.res_company.internal_transit_location_id IS 'Internal Transit Location';
COMMENT ON COLUMN public.res_company.security_lead IS 'Sales Safety Days';
COMMENT ON COLUMN public.res_company.vat_check_vies IS 'VIES VAT Check';
-- ddl-end --

-- object: public.res_partner | type: TABLE --
-- DROP TABLE public.res_partner;
CREATE TABLE public.res_partner(
	id integer NOT NULL DEFAULT nextval('res_partner_id_seq'::regclass),
	name character varying,
	company_id integer,
	comment text,
	function character varying,
	create_date timestamp,
	color integer,
	company_type character varying,
	date date,
	street character varying,
	city character varying,
	display_name character varying,
	zip character varying(24),
	title integer,
	country_id integer,
	parent_id integer,
	supplier boolean,
	ref character varying,
	email character varying,
	is_company boolean,
	website character varying,
	customer boolean,
	fax character varying,
	street2 character varying,
	barcode character varying,
	employee boolean,
	credit_limit double precision,
	write_date timestamp,
	active boolean,
	tz character varying(64),
	write_uid integer,
	lang character varying,
	create_uid integer,
	phone character varying,
	mobile character varying,
	type character varying,
	use_parent_address boolean,
	user_id integer,
	birthdate character varying,
	vat character varying,
	state_id integer,
	commercial_partner_id integer,
	notify_email character varying NOT NULL,
	message_last_post timestamp,
	opt_out boolean,
	signup_type character varying,
	signup_expiration timestamp,
	signup_token character varying,
	team_id integer,
	last_time_entries_checked timestamp,
	debit_limit numeric,
	CONSTRAINT res_partner_pkey PRIMARY KEY (id),
	CONSTRAINT res_partner_check_name CHECK (((((type)::text = 'contact'::text) AND (name IS NOT NULL)) OR ((type)::text <> 'contact'::text)))

);
-- ddl-end --
-- object: res_partner_company_id_index | type: INDEX --
-- DROP INDEX public.res_partner_company_id_index;
CREATE INDEX res_partner_company_id_index ON public.res_partner
	USING btree
	(
	  company_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: res_partner_date_index | type: INDEX --
-- DROP INDEX public.res_partner_date_index;
CREATE INDEX res_partner_date_index ON public.res_partner
	USING btree
	(
	  date
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: res_partner_display_name_index | type: INDEX --
-- DROP INDEX public.res_partner_display_name_index;
CREATE INDEX res_partner_display_name_index ON public.res_partner
	USING btree
	(
	  display_name
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: res_partner_parent_id_index | type: INDEX --
-- DROP INDEX public.res_partner_parent_id_index;
CREATE INDEX res_partner_parent_id_index ON public.res_partner
	USING btree
	(
	  parent_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: res_partner_ref_index | type: INDEX --
-- DROP INDEX public.res_partner_ref_index;
CREATE INDEX res_partner_ref_index ON public.res_partner
	USING btree
	(
	  ref
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: res_partner_name_index | type: INDEX --
-- DROP INDEX public.res_partner_name_index;
CREATE INDEX res_partner_name_index ON public.res_partner
	USING btree
	(
	  name
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON COLUMN public.res_partner.comment IS 'Notes';
COMMENT ON COLUMN public.res_partner.function IS 'Job Position';
COMMENT ON COLUMN public.res_partner.create_date IS 'Created on';
COMMENT ON COLUMN public.res_partner.color IS 'Color Index';
COMMENT ON COLUMN public.res_partner.company_type IS 'Company Type';
COMMENT ON COLUMN public.res_partner.date IS 'Date';
COMMENT ON COLUMN public.res_partner.street IS 'Street';
COMMENT ON COLUMN public.res_partner.city IS 'City';
COMMENT ON COLUMN public.res_partner.display_name IS 'Name';
COMMENT ON COLUMN public.res_partner.zip IS 'Zip';
COMMENT ON COLUMN public.res_partner.title IS 'Title';
COMMENT ON COLUMN public.res_partner.country_id IS 'Country';
COMMENT ON COLUMN public.res_partner.parent_id IS 'Related Company';
COMMENT ON COLUMN public.res_partner.supplier IS 'Is a Vendor';
COMMENT ON COLUMN public.res_partner.ref IS 'Internal Reference';
COMMENT ON COLUMN public.res_partner.email IS 'Email';
COMMENT ON COLUMN public.res_partner.is_company IS 'Is a Company';
COMMENT ON COLUMN public.res_partner.website IS 'Website';
COMMENT ON COLUMN public.res_partner.customer IS 'Is a Customer';
COMMENT ON COLUMN public.res_partner.fax IS 'Fax';
COMMENT ON COLUMN public.res_partner.street2 IS 'Street2';
COMMENT ON COLUMN public.res_partner.barcode IS 'Barcode';
COMMENT ON COLUMN public.res_partner.employee IS 'Employee';
COMMENT ON COLUMN public.res_partner.credit_limit IS 'Credit Limit';
COMMENT ON COLUMN public.res_partner.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.res_partner.active IS 'Active';
COMMENT ON COLUMN public.res_partner.tz IS 'Timezone';
COMMENT ON COLUMN public.res_partner.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.res_partner.lang IS 'Language';
COMMENT ON COLUMN public.res_partner.create_uid IS 'Created by';
COMMENT ON COLUMN public.res_partner.phone IS 'Phone';
COMMENT ON COLUMN public.res_partner.mobile IS 'Mobile';
COMMENT ON COLUMN public.res_partner.type IS 'Address Type';
COMMENT ON COLUMN public.res_partner.use_parent_address IS 'Use Company Address';
COMMENT ON COLUMN public.res_partner.user_id IS 'Salesperson';
COMMENT ON COLUMN public.res_partner.birthdate IS 'Birthdate';
COMMENT ON COLUMN public.res_partner.vat IS 'TIN';
COMMENT ON COLUMN public.res_partner.state_id IS 'State';
COMMENT ON COLUMN public.res_partner.commercial_partner_id IS 'Commercial Entity';
COMMENT ON COLUMN public.res_partner.notify_email IS 'Email Messages and Notifications';
COMMENT ON COLUMN public.res_partner.message_last_post IS 'Last Message Date';
COMMENT ON COLUMN public.res_partner.opt_out IS 'Opt-Out';
COMMENT ON COLUMN public.res_partner.signup_type IS 'Signup Token Type';
COMMENT ON COLUMN public.res_partner.signup_expiration IS 'Signup Expiration';
COMMENT ON COLUMN public.res_partner.signup_token IS 'Signup Token';
COMMENT ON COLUMN public.res_partner.team_id IS 'Sales Team';
COMMENT ON COLUMN public.res_partner.last_time_entries_checked IS 'Latest Invoices & Payments Matching Date';
COMMENT ON COLUMN public.res_partner.debit_limit IS 'Payable Limit';
-- ddl-end --

-- object: public.product_category | type: TABLE --
-- DROP TABLE public.product_category;
CREATE TABLE public.product_category(
	id integer NOT NULL DEFAULT nextval('product_category_id_seq'::regclass),
	parent_left integer,
	parent_right integer,
	create_uid integer,
	create_date timestamp,
	name character varying NOT NULL,
	sequence integer,
	write_uid integer,
	parent_id integer,
	write_date timestamp,
	type character varying,
	removal_strategy_id integer,
	CONSTRAINT product_category_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: product_category_parent_right_index | type: INDEX --
-- DROP INDEX public.product_category_parent_right_index;
CREATE INDEX product_category_parent_right_index ON public.product_category
	USING btree
	(
	  parent_right
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: product_category_name_index | type: INDEX --
-- DROP INDEX public.product_category_name_index;
CREATE INDEX product_category_name_index ON public.product_category
	USING btree
	(
	  name
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: product_category_sequence_index | type: INDEX --
-- DROP INDEX public.product_category_sequence_index;
CREATE INDEX product_category_sequence_index ON public.product_category
	USING btree
	(
	  sequence
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: product_category_parent_id_index | type: INDEX --
-- DROP INDEX public.product_category_parent_id_index;
CREATE INDEX product_category_parent_id_index ON public.product_category
	USING btree
	(
	  parent_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: product_category_parent_left_index | type: INDEX --
-- DROP INDEX public.product_category_parent_left_index;
CREATE INDEX product_category_parent_left_index ON public.product_category
	USING btree
	(
	  parent_left
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.product_category IS 'Product Category';
COMMENT ON COLUMN public.product_category.create_uid IS 'Created by';
COMMENT ON COLUMN public.product_category.create_date IS 'Created on';
COMMENT ON COLUMN public.product_category.name IS 'Name';
COMMENT ON COLUMN public.product_category.sequence IS 'Sequence';
COMMENT ON COLUMN public.product_category.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.product_category.parent_id IS 'Parent Category';
COMMENT ON COLUMN public.product_category.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.product_category.type IS 'Category Type';
COMMENT ON COLUMN public.product_category.removal_strategy_id IS 'Force Removal Strategy';
-- ddl-end --

-- object: public.product_template | type: TABLE --
-- DROP TABLE public.product_template;
CREATE TABLE public.product_template(
	id integer NOT NULL DEFAULT nextval('product_template_id_seq'::regclass),
	warranty double precision,
	list_price numeric,
	weight numeric,
	sequence integer,
	color integer,
	write_uid integer,
	uom_id integer NOT NULL,
	description_purchase text,
	create_date timestamp,
	create_uid integer,
	sale_ok boolean,
	categ_id integer NOT NULL,
	product_manager integer,
	message_last_post timestamp,
	company_id integer,
	state character varying,
	uom_po_id integer NOT NULL,
	description_sale text,
	description text,
	volume numeric,
	write_date timestamp,
	active boolean,
	rental boolean,
	name character varying NOT NULL,
	type character varying NOT NULL,
	track_service character varying,
	invoice_policy character varying,
	description_picking text,
	sale_delay double precision,
	tracking character varying NOT NULL,
	makemyday_categ_id integer,
	to_weight boolean,
	available_in_pos boolean,
	CONSTRAINT product_template_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: product_template_company_id_index | type: INDEX --
-- DROP INDEX public.product_template_company_id_index;
CREATE INDEX product_template_company_id_index ON public.product_template
	USING btree
	(
	  company_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: product_template_name_index | type: INDEX --
-- DROP INDEX public.product_template_name_index;
CREATE INDEX product_template_name_index ON public.product_template
	USING btree
	(
	  name
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.product_template IS 'Product Template';
COMMENT ON COLUMN public.product_template.warranty IS 'Warranty';
COMMENT ON COLUMN public.product_template.list_price IS 'Sale Price';
COMMENT ON COLUMN public.product_template.weight IS 'Gross Weight';
COMMENT ON COLUMN public.product_template.sequence IS 'Sequence';
COMMENT ON COLUMN public.product_template.color IS 'Color Index';
COMMENT ON COLUMN public.product_template.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.product_template.uom_id IS 'Unit of Measure';
COMMENT ON COLUMN public.product_template.description_purchase IS 'Purchase Description';
COMMENT ON COLUMN public.product_template.create_date IS 'Created on';
COMMENT ON COLUMN public.product_template.create_uid IS 'Created by';
COMMENT ON COLUMN public.product_template.sale_ok IS 'Can be Sold';
COMMENT ON COLUMN public.product_template.categ_id IS 'Internal Category';
COMMENT ON COLUMN public.product_template.product_manager IS 'Product Manager';
COMMENT ON COLUMN public.product_template.message_last_post IS 'Last Message Date';
COMMENT ON COLUMN public.product_template.company_id IS 'Company';
COMMENT ON COLUMN public.product_template.state IS 'Status';
COMMENT ON COLUMN public.product_template.uom_po_id IS 'Purchase Unit of Measure';
COMMENT ON COLUMN public.product_template.description_sale IS 'Sale Description';
COMMENT ON COLUMN public.product_template.description IS 'Description';
COMMENT ON COLUMN public.product_template.volume IS 'Volume';
COMMENT ON COLUMN public.product_template.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.product_template.active IS 'Active';
COMMENT ON COLUMN public.product_template.rental IS 'Can be Rent';
COMMENT ON COLUMN public.product_template.name IS 'Name';
COMMENT ON COLUMN public.product_template.type IS 'Product Type';
COMMENT ON COLUMN public.product_template.track_service IS 'Track Service';
COMMENT ON COLUMN public.product_template.invoice_policy IS 'Invoicing Policy';
COMMENT ON COLUMN public.product_template.description_picking IS 'Description on Picking';
COMMENT ON COLUMN public.product_template.sale_delay IS 'Customer Lead Time';
COMMENT ON COLUMN public.product_template.tracking IS 'Tracking';
COMMENT ON COLUMN public.product_template.makemyday_categ_id IS 'Point of Sale Category';
COMMENT ON COLUMN public.product_template.to_weight IS 'To Weigh With Scale';
COMMENT ON COLUMN public.product_template.available_in_pos IS 'Available in the Point of Sale';
-- ddl-end --

-- object: public.account_invoice | type: TABLE --
-- DROP TABLE public.account_invoice;
CREATE TABLE public.account_invoice(
	id integer NOT NULL DEFAULT nextval('account_invoice_id_seq'::regclass),
	comment text,
	date_due date,
	create_date timestamp,
	reference character varying,
	reference_type character varying NOT NULL,
	number character varying,
	journal_id integer NOT NULL,
	currency_id integer NOT NULL,
	amount_total_company_signed numeric,
	partner_id integer NOT NULL,
	create_uid integer,
	amount_untaxed numeric,
	partner_bank_id integer,
	residual_company_signed numeric,
	amount_total_signed numeric,
	message_last_post timestamp,
	company_id integer NOT NULL,
	amount_tax numeric,
	state character varying,
	fiscal_position_id integer,
	type character varying,
	sent boolean,
	account_id integer NOT NULL,
	reconciled boolean,
	origin character varying,
	residual numeric,
	move_name character varying,
	date_invoice date,
	payment_term_id integer,
	write_date timestamp,
	residual_signed numeric,
	date date,
	user_id integer,
	write_uid integer,
	move_id integer,
	amount_total numeric,
	amount_untaxed_signed numeric,
	name character varying,
	commercial_partner_id integer,
	team_id integer,
	incoterms_id integer,
	CONSTRAINT account_invoice_pkey PRIMARY KEY (id),
	CONSTRAINT account_invoice_number_uniq UNIQUE (number,company_id,journal_id,type)

);
-- ddl-end --
-- object: account_invoice_date_due_index | type: INDEX --
-- DROP INDEX public.account_invoice_date_due_index;
CREATE INDEX account_invoice_date_due_index ON public.account_invoice
	USING btree
	(
	  date_due
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_invoice_state_index | type: INDEX --
-- DROP INDEX public.account_invoice_state_index;
CREATE INDEX account_invoice_state_index ON public.account_invoice
	USING btree
	(
	  state
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_invoice_type_index | type: INDEX --
-- DROP INDEX public.account_invoice_type_index;
CREATE INDEX account_invoice_type_index ON public.account_invoice
	USING btree
	(
	  type
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_invoice_date_invoice_index | type: INDEX --
-- DROP INDEX public.account_invoice_date_invoice_index;
CREATE INDEX account_invoice_date_invoice_index ON public.account_invoice
	USING btree
	(
	  date_invoice
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_invoice_move_id_index | type: INDEX --
-- DROP INDEX public.account_invoice_move_id_index;
CREATE INDEX account_invoice_move_id_index ON public.account_invoice
	USING btree
	(
	  move_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_invoice_name_index | type: INDEX --
-- DROP INDEX public.account_invoice_name_index;
CREATE INDEX account_invoice_name_index ON public.account_invoice
	USING btree
	(
	  name
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.account_invoice IS 'Invoice';
COMMENT ON COLUMN public.account_invoice.comment IS 'Additional Information';
COMMENT ON COLUMN public.account_invoice.date_due IS 'Due Date';
COMMENT ON COLUMN public.account_invoice.create_date IS 'Created on';
COMMENT ON COLUMN public.account_invoice.reference IS 'Vendor Reference';
COMMENT ON COLUMN public.account_invoice.reference_type IS 'Payment Reference';
COMMENT ON COLUMN public.account_invoice.number IS 'Number';
COMMENT ON COLUMN public.account_invoice.journal_id IS 'Journal';
COMMENT ON COLUMN public.account_invoice.currency_id IS 'Currency';
COMMENT ON COLUMN public.account_invoice.amount_total_company_signed IS 'Total';
COMMENT ON COLUMN public.account_invoice.partner_id IS 'Partner';
COMMENT ON COLUMN public.account_invoice.create_uid IS 'Created by';
COMMENT ON COLUMN public.account_invoice.amount_untaxed IS 'Untaxed Amount';
COMMENT ON COLUMN public.account_invoice.partner_bank_id IS 'Bank Account';
COMMENT ON COLUMN public.account_invoice.residual_company_signed IS 'Amount Due';
COMMENT ON COLUMN public.account_invoice.amount_total_signed IS 'Total';
COMMENT ON COLUMN public.account_invoice.message_last_post IS 'Last Message Date';
COMMENT ON COLUMN public.account_invoice.company_id IS 'Company';
COMMENT ON COLUMN public.account_invoice.amount_tax IS 'Tax';
COMMENT ON COLUMN public.account_invoice.state IS 'Status';
COMMENT ON COLUMN public.account_invoice.fiscal_position_id IS 'Fiscal Position';
COMMENT ON COLUMN public.account_invoice.type IS 'Type';
COMMENT ON COLUMN public.account_invoice.sent IS 'Sent';
COMMENT ON COLUMN public.account_invoice.account_id IS 'Account';
COMMENT ON COLUMN public.account_invoice.reconciled IS 'Paid/Reconciled';
COMMENT ON COLUMN public.account_invoice.origin IS 'Source Document';
COMMENT ON COLUMN public.account_invoice.residual IS 'Amount Due';
COMMENT ON COLUMN public.account_invoice.move_name IS 'Journal Entry';
COMMENT ON COLUMN public.account_invoice.date_invoice IS 'Invoice Date';
COMMENT ON COLUMN public.account_invoice.payment_term_id IS 'Payment Term';
COMMENT ON COLUMN public.account_invoice.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.account_invoice.residual_signed IS 'Amount Due';
COMMENT ON COLUMN public.account_invoice.date IS 'Accounting Date';
COMMENT ON COLUMN public.account_invoice.user_id IS 'Salesperson';
COMMENT ON COLUMN public.account_invoice.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.account_invoice.move_id IS 'Journal Entry';
COMMENT ON COLUMN public.account_invoice.amount_total IS 'Total';
COMMENT ON COLUMN public.account_invoice.amount_untaxed_signed IS 'Untaxed Amount';
COMMENT ON COLUMN public.account_invoice.name IS 'Reference/Description';
COMMENT ON COLUMN public.account_invoice.commercial_partner_id IS 'Commercial Entity';
COMMENT ON COLUMN public.account_invoice.team_id IS 'Sales Team';
COMMENT ON COLUMN public.account_invoice.incoterms_id IS 'Incoterms';
-- ddl-end --

-- object: public.account_invoice_line | type: TABLE --
-- DROP TABLE public.account_invoice_line;
CREATE TABLE public.account_invoice_line(
	id integer NOT NULL DEFAULT nextval('account_invoice_line_id_seq'::regclass),
	origin character varying,
	create_date timestamp,
	sequence integer,
	price_unit numeric NOT NULL,
	price_subtotal numeric,
	write_uid integer,
	currency_id integer,
	uom_id integer,
	partner_id integer,
	create_uid integer,
	company_id integer,
	account_analytic_id integer,
	account_id integer NOT NULL,
	discount numeric,
	write_date timestamp,
	price_subtotal_signed numeric,
	name text NOT NULL,
	product_id integer,
	invoice_id integer,
	quantity numeric NOT NULL,
	CONSTRAINT account_invoice_line_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: account_invoice_line_uom_id_index | type: INDEX --
-- DROP INDEX public.account_invoice_line_uom_id_index;
CREATE INDEX account_invoice_line_uom_id_index ON public.account_invoice_line
	USING btree
	(
	  uom_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_invoice_line_product_id_index | type: INDEX --
-- DROP INDEX public.account_invoice_line_product_id_index;
CREATE INDEX account_invoice_line_product_id_index ON public.account_invoice_line
	USING btree
	(
	  product_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_invoice_line_invoice_id_index | type: INDEX --
-- DROP INDEX public.account_invoice_line_invoice_id_index;
CREATE INDEX account_invoice_line_invoice_id_index ON public.account_invoice_line
	USING btree
	(
	  invoice_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.account_invoice_line IS 'Invoice Line';
COMMENT ON COLUMN public.account_invoice_line.origin IS 'Source Document';
COMMENT ON COLUMN public.account_invoice_line.create_date IS 'Created on';
COMMENT ON COLUMN public.account_invoice_line.sequence IS 'Sequence';
COMMENT ON COLUMN public.account_invoice_line.price_unit IS 'Unit Price';
COMMENT ON COLUMN public.account_invoice_line.price_subtotal IS 'Amount';
COMMENT ON COLUMN public.account_invoice_line.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.account_invoice_line.currency_id IS 'Currency';
COMMENT ON COLUMN public.account_invoice_line.uom_id IS 'Unit of Measure';
COMMENT ON COLUMN public.account_invoice_line.partner_id IS 'Partner';
COMMENT ON COLUMN public.account_invoice_line.create_uid IS 'Created by';
COMMENT ON COLUMN public.account_invoice_line.company_id IS 'Company';
COMMENT ON COLUMN public.account_invoice_line.account_analytic_id IS 'Analytic Account';
COMMENT ON COLUMN public.account_invoice_line.account_id IS 'Account';
COMMENT ON COLUMN public.account_invoice_line.discount IS 'Discount (%)';
COMMENT ON COLUMN public.account_invoice_line.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.account_invoice_line.price_subtotal_signed IS 'Amount Signed';
COMMENT ON COLUMN public.account_invoice_line.name IS 'Description';
COMMENT ON COLUMN public.account_invoice_line.product_id IS 'Product';
COMMENT ON COLUMN public.account_invoice_line.invoice_id IS 'Invoice Reference';
COMMENT ON COLUMN public.account_invoice_line.quantity IS 'Quantity';
-- ddl-end --

-- object: public.account_bank_statement | type: TABLE --
-- DROP TABLE public.account_bank_statement;
CREATE TABLE public.account_bank_statement(
	id integer NOT NULL DEFAULT nextval('account_bank_statement_id_seq'::regclass),
	create_date timestamp,
	date_done timestamp,
	balance_start numeric,
	company_id integer,
	write_uid integer,
	create_uid integer,
	user_id integer,
	message_last_post timestamp,
	journal_id integer NOT NULL,
	state character varying NOT NULL,
	cashbox_start_id integer,
	cashbox_end_id integer,
	total_entry_encoding numeric,
	write_date timestamp,
	date date NOT NULL,
	difference numeric,
	name character varying,
	balance_end numeric,
	balance_end_real numeric,
	makemyday_session_id integer,
	CONSTRAINT account_bank_statement_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: account_bank_statement_date_index | type: INDEX --
-- DROP INDEX public.account_bank_statement_date_index;
CREATE INDEX account_bank_statement_date_index ON public.account_bank_statement
	USING btree
	(
	  date
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.account_bank_statement IS 'Bank Statement';
COMMENT ON COLUMN public.account_bank_statement.create_date IS 'Created on';
COMMENT ON COLUMN public.account_bank_statement.date_done IS 'Closed On';
COMMENT ON COLUMN public.account_bank_statement.balance_start IS 'Starting Balance';
COMMENT ON COLUMN public.account_bank_statement.company_id IS 'Company';
COMMENT ON COLUMN public.account_bank_statement.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.account_bank_statement.create_uid IS 'Created by';
COMMENT ON COLUMN public.account_bank_statement.user_id IS 'Responsible';
COMMENT ON COLUMN public.account_bank_statement.message_last_post IS 'Last Message Date';
COMMENT ON COLUMN public.account_bank_statement.journal_id IS 'Journal';
COMMENT ON COLUMN public.account_bank_statement.state IS 'Status';
COMMENT ON COLUMN public.account_bank_statement.cashbox_start_id IS 'Starting Cashbox';
COMMENT ON COLUMN public.account_bank_statement.cashbox_end_id IS 'Ending Cashbox';
COMMENT ON COLUMN public.account_bank_statement.total_entry_encoding IS 'Transactions Subtotal';
COMMENT ON COLUMN public.account_bank_statement.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.account_bank_statement.date IS 'Date';
COMMENT ON COLUMN public.account_bank_statement.difference IS 'Difference';
COMMENT ON COLUMN public.account_bank_statement.name IS 'Reference';
COMMENT ON COLUMN public.account_bank_statement.balance_end IS 'Computed Balance';
COMMENT ON COLUMN public.account_bank_statement.balance_end_real IS 'Ending Balance';
COMMENT ON COLUMN public.account_bank_statement.makemyday_session_id IS 'Session';
-- ddl-end --

-- object: public.account_bank_statement_line | type: TABLE --
-- DROP TABLE public.account_bank_statement_line;
CREATE TABLE public.account_bank_statement_line(
	id integer NOT NULL DEFAULT nextval('account_bank_statement_line_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	statement_id integer NOT NULL,
	name character varying NOT NULL,
	sequence integer,
	partner_name character varying,
	ref character varying,
	currency_id integer,
	journal_id integer,
	company_id integer,
	note text,
	amount numeric,
	write_date timestamp,
	bank_account_id integer,
	date date NOT NULL,
	amount_currency numeric,
	write_uid integer,
	partner_id integer,
	account_id integer,
	unique_import_id character varying,
	makemyday_statement_id integer,
	CONSTRAINT account_bank_statement_line_pkey PRIMARY KEY (id),
	CONSTRAINT account_bank_statement_line_unique_import_id UNIQUE (unique_import_id)

);
-- ddl-end --
-- object: account_bank_statement_line_statement_id_index | type: INDEX --
-- DROP INDEX public.account_bank_statement_line_statement_id_index;
CREATE INDEX account_bank_statement_line_statement_id_index ON public.account_bank_statement_line
	USING btree
	(
	  statement_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_bank_statement_line_sequence_index | type: INDEX --
-- DROP INDEX public.account_bank_statement_line_sequence_index;
CREATE INDEX account_bank_statement_line_sequence_index ON public.account_bank_statement_line
	USING btree
	(
	  sequence
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.account_bank_statement_line IS 'Bank Statement Line';
COMMENT ON COLUMN public.account_bank_statement_line.create_uid IS 'Created by';
COMMENT ON COLUMN public.account_bank_statement_line.create_date IS 'Created on';
COMMENT ON COLUMN public.account_bank_statement_line.statement_id IS 'Statement';
COMMENT ON COLUMN public.account_bank_statement_line.name IS 'Memo';
COMMENT ON COLUMN public.account_bank_statement_line.sequence IS 'Sequence';
COMMENT ON COLUMN public.account_bank_statement_line.partner_name IS 'Partner name';
COMMENT ON COLUMN public.account_bank_statement_line.ref IS 'Reference';
COMMENT ON COLUMN public.account_bank_statement_line.currency_id IS 'Currency';
COMMENT ON COLUMN public.account_bank_statement_line.journal_id IS 'Journal';
COMMENT ON COLUMN public.account_bank_statement_line.company_id IS 'Company';
COMMENT ON COLUMN public.account_bank_statement_line.note IS 'Notes';
COMMENT ON COLUMN public.account_bank_statement_line.amount IS 'Amount';
COMMENT ON COLUMN public.account_bank_statement_line.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.account_bank_statement_line.bank_account_id IS 'Bank Account';
COMMENT ON COLUMN public.account_bank_statement_line.date IS 'Date';
COMMENT ON COLUMN public.account_bank_statement_line.amount_currency IS 'Amount currency';
COMMENT ON COLUMN public.account_bank_statement_line.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.account_bank_statement_line.partner_id IS 'Partner';
COMMENT ON COLUMN public.account_bank_statement_line.account_id IS 'Counterpart Account';
COMMENT ON COLUMN public.account_bank_statement_line.unique_import_id IS 'Import ID';
COMMENT ON COLUMN public.account_bank_statement_line.makemyday_statement_id IS 'POS statement';
-- ddl-end --

-- object: public.stock_location | type: TABLE --
-- DROP TABLE public.stock_location;
CREATE TABLE public.stock_location(
	id integer NOT NULL DEFAULT nextval('stock_location_id_seq'::regclass),
	parent_left integer,
	parent_right integer,
	comment text,
	putaway_strategy_id integer,
	create_date timestamp,
	write_date timestamp,
	write_uid integer,
	location_id integer,
	removal_strategy_id integer,
	scrap_location boolean,
	partner_id integer,
	company_id integer,
	complete_name character varying,
	usage character varying NOT NULL,
	create_uid integer,
	barcode character varying,
	posz integer,
	posx integer,
	posy integer,
	active boolean,
	name character varying NOT NULL,
	return_location boolean,
	valuation_in_account_id integer,
	valuation_out_account_id integer,
	CONSTRAINT stock_location_pkey PRIMARY KEY (id),
	CONSTRAINT stock_location_barcode_company_uniq UNIQUE (barcode,company_id)

);
-- ddl-end --
-- object: stock_location_location_id_index | type: INDEX --
-- DROP INDEX public.stock_location_location_id_index;
CREATE INDEX stock_location_location_id_index ON public.stock_location
	USING btree
	(
	  location_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_location_company_id_index | type: INDEX --
-- DROP INDEX public.stock_location_company_id_index;
CREATE INDEX stock_location_company_id_index ON public.stock_location
	USING btree
	(
	  company_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_location_usage_index | type: INDEX --
-- DROP INDEX public.stock_location_usage_index;
CREATE INDEX stock_location_usage_index ON public.stock_location
	USING btree
	(
	  usage
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_location_parent_right_index | type: INDEX --
-- DROP INDEX public.stock_location_parent_right_index;
CREATE INDEX stock_location_parent_right_index ON public.stock_location
	USING btree
	(
	  parent_right
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_location_parent_left_index | type: INDEX --
-- DROP INDEX public.stock_location_parent_left_index;
CREATE INDEX stock_location_parent_left_index ON public.stock_location
	USING btree
	(
	  parent_left
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.stock_location IS 'Inventory Locations';
COMMENT ON COLUMN public.stock_location.comment IS 'Additional Information';
COMMENT ON COLUMN public.stock_location.putaway_strategy_id IS 'Put Away Strategy';
COMMENT ON COLUMN public.stock_location.create_date IS 'Created on';
COMMENT ON COLUMN public.stock_location.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.stock_location.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.stock_location.location_id IS 'Parent Location';
COMMENT ON COLUMN public.stock_location.removal_strategy_id IS 'Removal Strategy';
COMMENT ON COLUMN public.stock_location.scrap_location IS 'Is a Scrap Location?';
COMMENT ON COLUMN public.stock_location.partner_id IS 'Owner';
COMMENT ON COLUMN public.stock_location.company_id IS 'Company';
COMMENT ON COLUMN public.stock_location.complete_name IS 'Full Location Name';
COMMENT ON COLUMN public.stock_location.usage IS 'Location Type';
COMMENT ON COLUMN public.stock_location.create_uid IS 'Created by';
COMMENT ON COLUMN public.stock_location.barcode IS 'Barcode';
COMMENT ON COLUMN public.stock_location.posz IS 'Height (Z)';
COMMENT ON COLUMN public.stock_location.posx IS 'Corridor (X)';
COMMENT ON COLUMN public.stock_location.posy IS 'Shelves (Y)';
COMMENT ON COLUMN public.stock_location.active IS 'Active';
COMMENT ON COLUMN public.stock_location.name IS 'Location Name';
COMMENT ON COLUMN public.stock_location.return_location IS 'Is a Return Location?';
COMMENT ON COLUMN public.stock_location.valuation_in_account_id IS 'Stock Valuation Account (Incoming)';
COMMENT ON COLUMN public.stock_location.valuation_out_account_id IS 'Stock Valuation Account (Outgoing)';
-- ddl-end --

-- object: public.stock_move | type: TABLE --
-- DROP TABLE public.stock_move;
CREATE TABLE public.stock_move(
	id integer NOT NULL DEFAULT nextval('stock_move_id_seq'::regclass),
	origin character varying,
	create_date timestamp,
	move_dest_id integer,
	product_uom integer NOT NULL,
	price_unit double precision,
	product_uom_qty numeric NOT NULL,
	company_id integer NOT NULL,
	date timestamp NOT NULL,
	product_qty numeric,
	location_id integer NOT NULL,
	priority character varying,
	picking_type_id integer,
	sequence integer,
	note text,
	state character varying,
	origin_returned_move_id integer,
	product_packaging integer,
	date_expected timestamp NOT NULL,
	procurement_id integer,
	name character varying NOT NULL,
	create_uid integer,
	warehouse_id integer,
	inventory_id integer,
	partially_available boolean,
	propagate boolean,
	restrict_partner_id integer,
	procure_method character varying NOT NULL,
	write_uid integer,
	restrict_lot_id integer,
	partner_id integer,
	group_id integer,
	product_id integer NOT NULL,
	split_from integer,
	picking_id integer,
	location_dest_id integer NOT NULL,
	write_date timestamp,
	push_rule_id integer,
	rule_id integer,
	CONSTRAINT stock_move_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: stock_move_create_date_index | type: INDEX --
-- DROP INDEX public.stock_move_create_date_index;
CREATE INDEX stock_move_create_date_index ON public.stock_move
	USING btree
	(
	  create_date
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_move_dest_id_index | type: INDEX --
-- DROP INDEX public.stock_move_move_dest_id_index;
CREATE INDEX stock_move_move_dest_id_index ON public.stock_move
	USING btree
	(
	  move_dest_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_company_id_index | type: INDEX --
-- DROP INDEX public.stock_move_company_id_index;
CREATE INDEX stock_move_company_id_index ON public.stock_move
	USING btree
	(
	  company_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_date_index | type: INDEX --
-- DROP INDEX public.stock_move_date_index;
CREATE INDEX stock_move_date_index ON public.stock_move
	USING btree
	(
	  date
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_location_id_index | type: INDEX --
-- DROP INDEX public.stock_move_location_id_index;
CREATE INDEX stock_move_location_id_index ON public.stock_move
	USING btree
	(
	  location_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_state_index | type: INDEX --
-- DROP INDEX public.stock_move_state_index;
CREATE INDEX stock_move_state_index ON public.stock_move
	USING btree
	(
	  state
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_date_expected_index | type: INDEX --
-- DROP INDEX public.stock_move_date_expected_index;
CREATE INDEX stock_move_date_expected_index ON public.stock_move
	USING btree
	(
	  date_expected
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_name_index | type: INDEX --
-- DROP INDEX public.stock_move_name_index;
CREATE INDEX stock_move_name_index ON public.stock_move
	USING btree
	(
	  name
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_product_id_index | type: INDEX --
-- DROP INDEX public.stock_move_product_id_index;
CREATE INDEX stock_move_product_id_index ON public.stock_move
	USING btree
	(
	  product_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_picking_id_index | type: INDEX --
-- DROP INDEX public.stock_move_picking_id_index;
CREATE INDEX stock_move_picking_id_index ON public.stock_move
	USING btree
	(
	  picking_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_location_dest_id_index | type: INDEX --
-- DROP INDEX public.stock_move_location_dest_id_index;
CREATE INDEX stock_move_location_dest_id_index ON public.stock_move
	USING btree
	(
	  location_dest_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_move_product_location_index | type: INDEX --
-- DROP INDEX public.stock_move_product_location_index;
CREATE INDEX stock_move_product_location_index ON public.stock_move
	USING btree
	(
	  product_id,
	  location_id,
	  location_dest_id,
	  company_id,
	  state
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.stock_move IS 'Stock Move';
COMMENT ON COLUMN public.stock_move.origin IS 'Source Document';
COMMENT ON COLUMN public.stock_move.create_date IS 'Creation Date';
COMMENT ON COLUMN public.stock_move.move_dest_id IS 'Destination Move';
COMMENT ON COLUMN public.stock_move.product_uom IS 'Unit of Measure';
COMMENT ON COLUMN public.stock_move.price_unit IS 'Unit Price';
COMMENT ON COLUMN public.stock_move.product_uom_qty IS 'Quantity';
COMMENT ON COLUMN public.stock_move.company_id IS 'Company';
COMMENT ON COLUMN public.stock_move.date IS 'Date';
COMMENT ON COLUMN public.stock_move.product_qty IS 'Quantity';
COMMENT ON COLUMN public.stock_move.location_id IS 'Source Location';
COMMENT ON COLUMN public.stock_move.priority IS 'Priority';
COMMENT ON COLUMN public.stock_move.picking_type_id IS 'Picking Type';
COMMENT ON COLUMN public.stock_move.sequence IS 'Sequence';
COMMENT ON COLUMN public.stock_move.note IS 'Notes';
COMMENT ON COLUMN public.stock_move.state IS 'Status';
COMMENT ON COLUMN public.stock_move.origin_returned_move_id IS 'Origin return move';
COMMENT ON COLUMN public.stock_move.product_packaging IS 'preferred Packaging';
COMMENT ON COLUMN public.stock_move.date_expected IS 'Expected Date';
COMMENT ON COLUMN public.stock_move.procurement_id IS 'Procurement';
COMMENT ON COLUMN public.stock_move.name IS 'Description';
COMMENT ON COLUMN public.stock_move.create_uid IS 'Created by';
COMMENT ON COLUMN public.stock_move.warehouse_id IS 'Warehouse';
COMMENT ON COLUMN public.stock_move.inventory_id IS 'Inventory';
COMMENT ON COLUMN public.stock_move.partially_available IS 'Partially Available';
COMMENT ON COLUMN public.stock_move.propagate IS 'Propagate cancel and split';
COMMENT ON COLUMN public.stock_move.restrict_partner_id IS 'Owner ';
COMMENT ON COLUMN public.stock_move.procure_method IS 'Supply Method';
COMMENT ON COLUMN public.stock_move.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.stock_move.restrict_lot_id IS 'Lot';
COMMENT ON COLUMN public.stock_move.partner_id IS 'Destination Address ';
COMMENT ON COLUMN public.stock_move.group_id IS 'Procurement Group';
COMMENT ON COLUMN public.stock_move.product_id IS 'Product';
COMMENT ON COLUMN public.stock_move.split_from IS 'Move Split From';
COMMENT ON COLUMN public.stock_move.picking_id IS 'Transfer Reference';
COMMENT ON COLUMN public.stock_move.location_dest_id IS 'Destination Location';
COMMENT ON COLUMN public.stock_move.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.stock_move.push_rule_id IS 'Push Rule';
COMMENT ON COLUMN public.stock_move.rule_id IS 'Procurement Rule';
-- ddl-end --

-- object: public.stock_inventory | type: TABLE --
-- DROP TABLE public.stock_inventory;
CREATE TABLE public.stock_inventory(
	id integer NOT NULL DEFAULT nextval('stock_inventory_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	name character varying NOT NULL,
	location_id integer NOT NULL,
	company_id integer NOT NULL,
	write_uid integer,
	state character varying,
	write_date timestamp,
	lot_id integer,
	date timestamp NOT NULL,
	package_id integer,
	partner_id integer,
	filter character varying NOT NULL,
	product_id integer,
	accounting_date date,
	CONSTRAINT stock_inventory_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: stock_inventory_company_id_index | type: INDEX --
-- DROP INDEX public.stock_inventory_company_id_index;
CREATE INDEX stock_inventory_company_id_index ON public.stock_inventory
	USING btree
	(
	  company_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_inventory_state_index | type: INDEX --
-- DROP INDEX public.stock_inventory_state_index;
CREATE INDEX stock_inventory_state_index ON public.stock_inventory
	USING btree
	(
	  state
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.stock_inventory IS 'Inventory';
COMMENT ON COLUMN public.stock_inventory.create_uid IS 'Created by';
COMMENT ON COLUMN public.stock_inventory.create_date IS 'Created on';
COMMENT ON COLUMN public.stock_inventory.name IS 'Inventory Reference';
COMMENT ON COLUMN public.stock_inventory.location_id IS 'Inventoried Location';
COMMENT ON COLUMN public.stock_inventory.company_id IS 'Company';
COMMENT ON COLUMN public.stock_inventory.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.stock_inventory.state IS 'Status';
COMMENT ON COLUMN public.stock_inventory.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.stock_inventory.lot_id IS 'Inventoried Lot/Serial Number';
COMMENT ON COLUMN public.stock_inventory.date IS 'Inventory Date';
COMMENT ON COLUMN public.stock_inventory.package_id IS 'Inventoried Pack';
COMMENT ON COLUMN public.stock_inventory.partner_id IS 'Inventoried Owner';
COMMENT ON COLUMN public.stock_inventory.filter IS 'Inventory of';
COMMENT ON COLUMN public.stock_inventory.product_id IS 'Inventoried Product';
COMMENT ON COLUMN public.stock_inventory.accounting_date IS 'Force Accounting Date';
-- ddl-end --

-- object: public.stock_inventory_line | type: TABLE --
-- DROP TABLE public.stock_inventory_line;
CREATE TABLE public.stock_inventory_line(
	id integer NOT NULL DEFAULT nextval('stock_inventory_line_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	prodlot_name character varying,
	product_name character varying,
	partner_id integer,
	prod_lot_id integer,
	location_name character varying,
	company_id integer,
	write_uid integer,
	inventory_id integer,
	package_id integer,
	write_date timestamp,
	product_qty numeric,
	theoretical_qty numeric,
	product_uom_id integer NOT NULL,
	product_code character varying,
	location_id integer NOT NULL,
	product_id integer NOT NULL,
	CONSTRAINT stock_inventory_line_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: stock_inventory_line_company_id_index | type: INDEX --
-- DROP INDEX public.stock_inventory_line_company_id_index;
CREATE INDEX stock_inventory_line_company_id_index ON public.stock_inventory_line
	USING btree
	(
	  company_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_inventory_line_inventory_id_index | type: INDEX --
-- DROP INDEX public.stock_inventory_line_inventory_id_index;
CREATE INDEX stock_inventory_line_inventory_id_index ON public.stock_inventory_line
	USING btree
	(
	  inventory_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_inventory_line_package_id_index | type: INDEX --
-- DROP INDEX public.stock_inventory_line_package_id_index;
CREATE INDEX stock_inventory_line_package_id_index ON public.stock_inventory_line
	USING btree
	(
	  package_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_inventory_line_location_id_index | type: INDEX --
-- DROP INDEX public.stock_inventory_line_location_id_index;
CREATE INDEX stock_inventory_line_location_id_index ON public.stock_inventory_line
	USING btree
	(
	  location_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_inventory_line_product_id_index | type: INDEX --
-- DROP INDEX public.stock_inventory_line_product_id_index;
CREATE INDEX stock_inventory_line_product_id_index ON public.stock_inventory_line
	USING btree
	(
	  product_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.stock_inventory_line IS 'Inventory Line';
COMMENT ON COLUMN public.stock_inventory_line.create_uid IS 'Created by';
COMMENT ON COLUMN public.stock_inventory_line.create_date IS 'Created on';
COMMENT ON COLUMN public.stock_inventory_line.prodlot_name IS 'Serial Number Name';
COMMENT ON COLUMN public.stock_inventory_line.product_name IS 'Product Name';
COMMENT ON COLUMN public.stock_inventory_line.partner_id IS 'Owner';
COMMENT ON COLUMN public.stock_inventory_line.prod_lot_id IS 'Serial Number';
COMMENT ON COLUMN public.stock_inventory_line.location_name IS 'Location Name';
COMMENT ON COLUMN public.stock_inventory_line.company_id IS 'Company';
COMMENT ON COLUMN public.stock_inventory_line.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.stock_inventory_line.inventory_id IS 'Inventory';
COMMENT ON COLUMN public.stock_inventory_line.package_id IS 'Pack';
COMMENT ON COLUMN public.stock_inventory_line.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.stock_inventory_line.product_qty IS 'Checked Quantity';
COMMENT ON COLUMN public.stock_inventory_line.theoretical_qty IS 'Theoretical Quantity';
COMMENT ON COLUMN public.stock_inventory_line.product_uom_id IS 'Product Unit of Measure';
COMMENT ON COLUMN public.stock_inventory_line.product_code IS 'Product Code';
COMMENT ON COLUMN public.stock_inventory_line.location_id IS 'Location';
COMMENT ON COLUMN public.stock_inventory_line.product_id IS 'Product';
-- ddl-end --

-- object: public.stock_warehouse | type: TABLE --
-- DROP TABLE public.stock_warehouse;
CREATE TABLE public.stock_warehouse(
	id integer NOT NULL DEFAULT nextval('stock_warehouse_id_seq'::regclass),
	crossdock_route_id integer,
	create_date timestamp,
	lot_stock_id integer NOT NULL,
	wh_pack_stock_loc_id integer,
	company_id integer NOT NULL,
	pick_type_id integer,
	code character varying(5) NOT NULL,
	partner_id integer,
	create_uid integer,
	mto_pull_id integer,
	reception_route_id integer,
	wh_input_stock_loc_id integer,
	delivery_steps character varying NOT NULL,
	default_resupply_wh_id integer,
	view_location_id integer NOT NULL,
	wh_qc_stock_loc_id integer,
	reception_steps character varying NOT NULL,
	resupply_from_wh boolean,
	pack_type_id integer,
	wh_output_stock_loc_id integer,
	write_date timestamp,
	delivery_route_id integer,
	name character varying NOT NULL,
	write_uid integer,
	in_type_id integer,
	out_type_id integer,
	int_type_id integer,
	CONSTRAINT stock_warehouse_pkey PRIMARY KEY (id),
	CONSTRAINT stock_warehouse_warehouse_name_uniq UNIQUE (name,company_id),
	CONSTRAINT stock_warehouse_warehouse_code_uniq UNIQUE (code,company_id)

);
-- ddl-end --
-- object: stock_warehouse_company_id_index | type: INDEX --
-- DROP INDEX public.stock_warehouse_company_id_index;
CREATE INDEX stock_warehouse_company_id_index ON public.stock_warehouse
	USING btree
	(
	  company_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: stock_warehouse_name_index | type: INDEX --
-- DROP INDEX public.stock_warehouse_name_index;
CREATE INDEX stock_warehouse_name_index ON public.stock_warehouse
	USING btree
	(
	  name
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.stock_warehouse IS 'Warehouse';
COMMENT ON COLUMN public.stock_warehouse.crossdock_route_id IS 'Crossdock Route';
COMMENT ON COLUMN public.stock_warehouse.create_date IS 'Created on';
COMMENT ON COLUMN public.stock_warehouse.lot_stock_id IS 'Location Stock';
COMMENT ON COLUMN public.stock_warehouse.wh_pack_stock_loc_id IS 'Packing Location';
COMMENT ON COLUMN public.stock_warehouse.company_id IS 'Company';
COMMENT ON COLUMN public.stock_warehouse.pick_type_id IS 'Pick Type';
COMMENT ON COLUMN public.stock_warehouse.code IS 'Short Name';
COMMENT ON COLUMN public.stock_warehouse.partner_id IS 'Address';
COMMENT ON COLUMN public.stock_warehouse.create_uid IS 'Created by';
COMMENT ON COLUMN public.stock_warehouse.mto_pull_id IS 'MTO rule';
COMMENT ON COLUMN public.stock_warehouse.reception_route_id IS 'Receipt Route';
COMMENT ON COLUMN public.stock_warehouse.wh_input_stock_loc_id IS 'Input Location';
COMMENT ON COLUMN public.stock_warehouse.delivery_steps IS 'Outgoing Shippings';
COMMENT ON COLUMN public.stock_warehouse.default_resupply_wh_id IS 'Default Resupply Warehouse';
COMMENT ON COLUMN public.stock_warehouse.view_location_id IS 'View Location';
COMMENT ON COLUMN public.stock_warehouse.wh_qc_stock_loc_id IS 'Quality Control Location';
COMMENT ON COLUMN public.stock_warehouse.reception_steps IS 'Incoming Shipments';
COMMENT ON COLUMN public.stock_warehouse.resupply_from_wh IS 'Resupply From Other Warehouses';
COMMENT ON COLUMN public.stock_warehouse.pack_type_id IS 'Pack Type';
COMMENT ON COLUMN public.stock_warehouse.wh_output_stock_loc_id IS 'Output Location';
COMMENT ON COLUMN public.stock_warehouse.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.stock_warehouse.delivery_route_id IS 'Delivery Route';
COMMENT ON COLUMN public.stock_warehouse.name IS 'Warehouse Name';
COMMENT ON COLUMN public.stock_warehouse.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.stock_warehouse.in_type_id IS 'In Type';
COMMENT ON COLUMN public.stock_warehouse.out_type_id IS 'Out Type';
COMMENT ON COLUMN public.stock_warehouse.int_type_id IS 'Internal Type';
-- ddl-end --

-- object: public.stock_warehouse_orderpoint | type: TABLE --
-- DROP TABLE public.stock_warehouse_orderpoint;
CREATE TABLE public.stock_warehouse_orderpoint(
	id integer NOT NULL DEFAULT nextval('stock_warehouse_orderpoint_id_seq'::regclass),
	product_max_qty numeric NOT NULL,
	create_uid integer,
	product_min_qty numeric NOT NULL,
	qty_multiple numeric NOT NULL,
	create_date timestamp,
	product_id integer NOT NULL,
	warehouse_id integer NOT NULL,
	company_id integer NOT NULL,
	lead_days integer,
	active boolean,
	write_date timestamp,
	lead_type character varying NOT NULL,
	write_uid integer,
	location_id integer NOT NULL,
	group_id integer,
	name character varying NOT NULL,
	CONSTRAINT stock_warehouse_orderpoint_pkey PRIMARY KEY (id),
	CONSTRAINT stock_warehouse_orderpoint_qty_multiple_check CHECK ((qty_multiple >= (0)::numeric))

);
-- ddl-end --
COMMENT ON TABLE public.stock_warehouse_orderpoint IS 'Minimum Inventory Rule';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.product_max_qty IS 'Maximum Quantity';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.create_uid IS 'Created by';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.product_min_qty IS 'Minimum Quantity';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.qty_multiple IS 'Qty Multiple';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.create_date IS 'Created on';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.product_id IS 'Product';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.warehouse_id IS 'Warehouse';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.company_id IS 'Company';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.lead_days IS 'Lead Time';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.active IS 'Active';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.lead_type IS 'Lead Type';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.location_id IS 'Location';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.group_id IS 'Procurement Group';
COMMENT ON COLUMN public.stock_warehouse_orderpoint.name IS 'Name';
-- ddl-end --

-- object: public.makemyday_config_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_config_id_seq;
CREATE SEQUENCE public.makemyday_config_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_config | type: TABLE --
-- DROP TABLE public.makemyday_config;
CREATE TABLE public.makemyday_config(
	id integer NOT NULL DEFAULT nextval('makemyday_config_id_seq'::regclass),
	iface_big_scrollbars boolean,
	journal_id integer,
	iface_electronic_scale boolean,
	proxy_ip character varying(45),
	create_date timestamp,
	iface_vkeyboard boolean,
	iface_print_auto boolean,
	uuid character varying,
	cash_control boolean,
	barcode_nomenclature_id integer NOT NULL,
	company_id integer NOT NULL,
	iface_scan_via_proxy boolean,
	state character varying NOT NULL,
	group_by boolean,
	iface_invoicing boolean,
	receipt_header text,
	iface_display_categ_images boolean,
	group_makemyday_manager_id integer,
	pricelist_id integer NOT NULL,
	iface_start_categ_id integer,
	group_makemyday_user_id integer,
	create_uid integer,
	iface_print_skip_screen boolean,
	stock_location_id integer NOT NULL,
	sequence_id integer,
	write_date timestamp,
	tip_product_id integer,
	iface_tax_included boolean,
	iface_payment_terminal boolean,
	write_uid integer,
	iface_precompute_cash boolean,
	iface_cashdrawer boolean,
	name character varying NOT NULL,
	iface_fullscreen boolean,
	picking_type_id integer,
	receipt_footer text,
	iface_print_via_proxy boolean,
	iface_splitbill boolean,
	iface_orderline_notes boolean,
	iface_printbill boolean,
	CONSTRAINT makemyday_config_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: makemyday_config_name_index | type: INDEX --
-- DROP INDEX public.makemyday_config_name_index;
CREATE INDEX makemyday_config_name_index ON public.makemyday_config
	USING btree
	(
	  name
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.makemyday_config IS 'makemyday.config';
COMMENT ON COLUMN public.makemyday_config.iface_big_scrollbars IS 'Large Scrollbars';
COMMENT ON COLUMN public.makemyday_config.journal_id IS 'Sale Journal';
COMMENT ON COLUMN public.makemyday_config.iface_electronic_scale IS 'Electronic Scale';
COMMENT ON COLUMN public.makemyday_config.proxy_ip IS 'IP Address';
COMMENT ON COLUMN public.makemyday_config.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_config.iface_vkeyboard IS 'Virtual KeyBoard';
COMMENT ON COLUMN public.makemyday_config.iface_print_auto IS 'Automatic Receipt Printing';
COMMENT ON COLUMN public.makemyday_config.uuid IS 'uuid';
COMMENT ON COLUMN public.makemyday_config.cash_control IS 'Cash Control';
COMMENT ON COLUMN public.makemyday_config.barcode_nomenclature_id IS 'Barcodes';
COMMENT ON COLUMN public.makemyday_config.company_id IS 'Company';
COMMENT ON COLUMN public.makemyday_config.iface_scan_via_proxy IS 'Scan via Proxy';
COMMENT ON COLUMN public.makemyday_config.state IS 'Status';
COMMENT ON COLUMN public.makemyday_config.group_by IS 'Group Journal Items';
COMMENT ON COLUMN public.makemyday_config.iface_invoicing IS 'Invoicing';
COMMENT ON COLUMN public.makemyday_config.receipt_header IS 'Receipt Header';
COMMENT ON COLUMN public.makemyday_config.iface_display_categ_images IS 'Display Category Pictures';
COMMENT ON COLUMN public.makemyday_config.group_makemyday_manager_id IS 'Point of Sale Manager Group';
COMMENT ON COLUMN public.makemyday_config.pricelist_id IS 'Pricelist';
COMMENT ON COLUMN public.makemyday_config.iface_start_categ_id IS 'Start Category';
COMMENT ON COLUMN public.makemyday_config.group_makemyday_user_id IS 'Point of Sale User Group';
COMMENT ON COLUMN public.makemyday_config.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_config.iface_print_skip_screen IS 'Skip Receipt Screen';
COMMENT ON COLUMN public.makemyday_config.stock_location_id IS 'Stock Location';
COMMENT ON COLUMN public.makemyday_config.sequence_id IS 'Order IDs Sequence';
COMMENT ON COLUMN public.makemyday_config.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_config.tip_product_id IS 'Tip Product';
COMMENT ON COLUMN public.makemyday_config.iface_tax_included IS 'Include Taxes in Prices';
COMMENT ON COLUMN public.makemyday_config.iface_payment_terminal IS 'Payment Terminal';
COMMENT ON COLUMN public.makemyday_config.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_config.iface_precompute_cash IS 'Prefill Cash Payment';
COMMENT ON COLUMN public.makemyday_config.iface_cashdrawer IS 'Cashdrawer';
COMMENT ON COLUMN public.makemyday_config.name IS 'Point of Sale Name';
COMMENT ON COLUMN public.makemyday_config.iface_fullscreen IS 'Fullscreen';
COMMENT ON COLUMN public.makemyday_config.picking_type_id IS 'Picking Type';
COMMENT ON COLUMN public.makemyday_config.receipt_footer IS 'Receipt Footer';
COMMENT ON COLUMN public.makemyday_config.iface_print_via_proxy IS 'Print via Proxy';
COMMENT ON COLUMN public.makemyday_config.iface_splitbill IS 'Bill Splitting';
COMMENT ON COLUMN public.makemyday_config.iface_orderline_notes IS 'Orderline Notes';
COMMENT ON COLUMN public.makemyday_config.iface_printbill IS 'Bill Printing';
-- ddl-end --

-- object: public.account_fiscal_position_makemyday_config_rel | type: TABLE --
-- DROP TABLE public.account_fiscal_position_makemyday_config_rel;
CREATE TABLE public.account_fiscal_position_makemyday_config_rel(
	makemyday_config_id integer NOT NULL,
	account_fiscal_position_id integer NOT NULL,
	CONSTRAINT account_fiscal_position_makem_makemyday_config_id_account_f_key UNIQUE (makemyday_config_id,account_fiscal_position_id)

);
-- ddl-end --
-- object: account_fiscal_position_makemyday_confi_makemyday_config_id_idx | type: INDEX --
-- DROP INDEX public.account_fiscal_position_makemyday_confi_makemyday_config_id_idx;
CREATE INDEX account_fiscal_position_makemyday_confi_makemyday_config_id_idx ON public.account_fiscal_position_makemyday_config_rel
	USING btree
	(
	  makemyday_config_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_fiscal_position_makemyda_account_fiscal_position_id_idx | type: INDEX --
-- DROP INDEX public.account_fiscal_position_makemyda_account_fiscal_position_id_idx;
CREATE INDEX account_fiscal_position_makemyda_account_fiscal_position_id_idx ON public.account_fiscal_position_makemyday_config_rel
	USING btree
	(
	  account_fiscal_position_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.account_fiscal_position_makemyday_config_rel IS 'RELATION BETWEEN makemyday_config AND account_fiscal_position';
-- ddl-end --

-- object: public.makemyday_config_journal_rel | type: TABLE --
-- DROP TABLE public.makemyday_config_journal_rel;
CREATE TABLE public.makemyday_config_journal_rel(
	makemyday_config_id integer NOT NULL,
	journal_id integer NOT NULL,
	CONSTRAINT makemyday_config_journal_rel_makemyday_config_id_journal_id_key UNIQUE (makemyday_config_id,journal_id)

);
-- ddl-end --
-- object: makemyday_config_journal_rel_makemyday_config_id_idx | type: INDEX --
-- DROP INDEX public.makemyday_config_journal_rel_makemyday_config_id_idx;
CREATE INDEX makemyday_config_journal_rel_makemyday_config_id_idx ON public.makemyday_config_journal_rel
	USING btree
	(
	  makemyday_config_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: makemyday_config_journal_rel_journal_id_idx | type: INDEX --
-- DROP INDEX public.makemyday_config_journal_rel_journal_id_idx;
CREATE INDEX makemyday_config_journal_rel_journal_id_idx ON public.makemyday_config_journal_rel
	USING btree
	(
	  journal_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.makemyday_config_journal_rel IS 'RELATION BETWEEN makemyday_config AND account_journal';
-- ddl-end --

-- object: public.makemyday_session_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_session_id_seq;
CREATE SEQUENCE public.makemyday_session_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_session | type: TABLE --
-- DROP TABLE public.makemyday_session;
CREATE TABLE public.makemyday_session(
	id integer NOT NULL DEFAULT nextval('makemyday_session_id_seq'::regclass),
	config_id integer NOT NULL,
	write_uid integer,
	cash_journal_id integer,
	cash_register_id integer,
	user_id integer NOT NULL,
	login_number integer,
	state character varying NOT NULL,
	start_at timestamp,
	rescue boolean,
	create_uid integer,
	write_date timestamp,
	name character varying NOT NULL,
	stop_at timestamp,
	create_date timestamp,
	sequence_number integer,
	CONSTRAINT makemyday_session_pkey PRIMARY KEY (id),
	CONSTRAINT makemyday_session_uniq_name UNIQUE (name)

);
-- ddl-end --
-- object: makemyday_session_config_id_index | type: INDEX --
-- DROP INDEX public.makemyday_session_config_id_index;
CREATE INDEX makemyday_session_config_id_index ON public.makemyday_session
	USING btree
	(
	  config_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: makemyday_session_user_id_index | type: INDEX --
-- DROP INDEX public.makemyday_session_user_id_index;
CREATE INDEX makemyday_session_user_id_index ON public.makemyday_session
	USING btree
	(
	  user_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: makemyday_session_state_index | type: INDEX --
-- DROP INDEX public.makemyday_session_state_index;
CREATE INDEX makemyday_session_state_index ON public.makemyday_session
	USING btree
	(
	  state
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.makemyday_session IS 'makemyday.session';
COMMENT ON COLUMN public.makemyday_session.config_id IS 'Point of Sale';
COMMENT ON COLUMN public.makemyday_session.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_session.cash_journal_id IS 'Cash Journal';
COMMENT ON COLUMN public.makemyday_session.cash_register_id IS 'Cash Register';
COMMENT ON COLUMN public.makemyday_session.user_id IS 'Responsible';
COMMENT ON COLUMN public.makemyday_session.login_number IS 'Login Sequence Number';
COMMENT ON COLUMN public.makemyday_session.state IS 'Status';
COMMENT ON COLUMN public.makemyday_session.start_at IS 'Opening Date';
COMMENT ON COLUMN public.makemyday_session.rescue IS 'Rescue session';
COMMENT ON COLUMN public.makemyday_session.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_session.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_session.name IS 'Session ID';
COMMENT ON COLUMN public.makemyday_session.stop_at IS 'Closing Date';
COMMENT ON COLUMN public.makemyday_session.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_session.sequence_number IS 'Order Sequence Number';
-- ddl-end --

-- object: public.makemyday_order_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_order_id_seq;
CREATE SEQUENCE public.makemyday_order_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_order | type: TABLE --
-- DROP TABLE public.makemyday_order;
CREATE TABLE public.makemyday_order(
	id integer NOT NULL DEFAULT nextval('makemyday_order_id_seq'::regclass),
	create_date timestamp,
	sale_journal integer,
	write_uid integer,
	account_move integer,
	date_order timestamp,
	location_id integer,
	nb_print integer,
	create_uid integer,
	user_id integer,
	partner_id integer,
	company_id integer NOT NULL,
	note text,
	state character varying,
	pricelist_id integer NOT NULL,
	write_date timestamp,
	fiscal_position_id integer,
	name character varying NOT NULL,
	invoice_id integer,
	session_id integer NOT NULL,
	makemyday_reference character varying,
	picking_id integer,
	sequence_number integer,
	customer_count integer,
	table_id integer,
	CONSTRAINT makemyday_order_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: makemyday_order_date_order_index | type: INDEX --
-- DROP INDEX public.makemyday_order_date_order_index;
CREATE INDEX makemyday_order_date_order_index ON public.makemyday_order
	USING btree
	(
	  date_order
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: makemyday_order_partner_id_index | type: INDEX --
-- DROP INDEX public.makemyday_order_partner_id_index;
CREATE INDEX makemyday_order_partner_id_index ON public.makemyday_order
	USING btree
	(
	  partner_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: makemyday_order_session_id_index | type: INDEX --
-- DROP INDEX public.makemyday_order_session_id_index;
CREATE INDEX makemyday_order_session_id_index ON public.makemyday_order
	USING btree
	(
	  session_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.makemyday_order IS 'Point of Sale';
COMMENT ON COLUMN public.makemyday_order.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_order.sale_journal IS 'Sale Journal';
COMMENT ON COLUMN public.makemyday_order.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_order.account_move IS 'Journal Entry';
COMMENT ON COLUMN public.makemyday_order.date_order IS 'Order Date';
COMMENT ON COLUMN public.makemyday_order.location_id IS 'Location';
COMMENT ON COLUMN public.makemyday_order.nb_print IS 'Number of Print';
COMMENT ON COLUMN public.makemyday_order.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_order.user_id IS 'Salesman';
COMMENT ON COLUMN public.makemyday_order.partner_id IS 'Customer';
COMMENT ON COLUMN public.makemyday_order.company_id IS 'Company';
COMMENT ON COLUMN public.makemyday_order.note IS 'Internal Notes';
COMMENT ON COLUMN public.makemyday_order.state IS 'Status';
COMMENT ON COLUMN public.makemyday_order.pricelist_id IS 'Pricelist';
COMMENT ON COLUMN public.makemyday_order.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_order.fiscal_position_id IS 'Fiscal Position';
COMMENT ON COLUMN public.makemyday_order.name IS 'Order Ref';
COMMENT ON COLUMN public.makemyday_order.invoice_id IS 'Invoice';
COMMENT ON COLUMN public.makemyday_order.session_id IS 'Session';
COMMENT ON COLUMN public.makemyday_order.makemyday_reference IS 'Receipt Ref';
COMMENT ON COLUMN public.makemyday_order.picking_id IS 'Picking';
COMMENT ON COLUMN public.makemyday_order.sequence_number IS 'Sequence Number';
COMMENT ON COLUMN public.makemyday_order.customer_count IS 'Guests';
COMMENT ON COLUMN public.makemyday_order.table_id IS 'Table';
-- ddl-end --

-- object: public.makemyday_order_line_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_order_line_id_seq;
CREATE SEQUENCE public.makemyday_order_line_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_order_line | type: TABLE --
-- DROP TABLE public.makemyday_order_line;
CREATE TABLE public.makemyday_order_line(
	id integer NOT NULL DEFAULT nextval('makemyday_order_line_id_seq'::regclass),
	create_uid integer,
	notice character varying,
	create_date timestamp,
	product_id integer NOT NULL,
	name character varying NOT NULL,
	order_id integer,
	price_unit numeric,
	company_id integer NOT NULL,
	qty numeric,
	discount numeric,
	write_date timestamp,
	write_uid integer,
	CONSTRAINT makemyday_order_line_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_order_line IS 'Lines of Point of Sale';
COMMENT ON COLUMN public.makemyday_order_line.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_order_line.notice IS 'Discount Notice';
COMMENT ON COLUMN public.makemyday_order_line.create_date IS 'Creation Date';
COMMENT ON COLUMN public.makemyday_order_line.product_id IS 'Product';
COMMENT ON COLUMN public.makemyday_order_line.name IS 'Line No';
COMMENT ON COLUMN public.makemyday_order_line.order_id IS 'Order Ref';
COMMENT ON COLUMN public.makemyday_order_line.price_unit IS 'Unit Price';
COMMENT ON COLUMN public.makemyday_order_line.company_id IS 'Company';
COMMENT ON COLUMN public.makemyday_order_line.qty IS 'Quantity';
COMMENT ON COLUMN public.makemyday_order_line.discount IS 'Discount (%)';
COMMENT ON COLUMN public.makemyday_order_line.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_order_line.write_uid IS 'Last Updated by';
-- ddl-end --

-- object: public.account_tax_makemyday_order_line_rel | type: TABLE --
-- DROP TABLE public.account_tax_makemyday_order_line_rel;
CREATE TABLE public.account_tax_makemyday_order_line_rel(
	makemyday_order_line_id integer NOT NULL,
	account_tax_id integer NOT NULL,
	CONSTRAINT account_tax_makemyday_order_l_makemyday_order_line_id_accou_key UNIQUE (makemyday_order_line_id,account_tax_id)

);
-- ddl-end --
-- object: account_tax_makemyday_order_line_re_makemyday_order_line_id_idx | type: INDEX --
-- DROP INDEX public.account_tax_makemyday_order_line_re_makemyday_order_line_id_idx;
CREATE INDEX account_tax_makemyday_order_line_re_makemyday_order_line_id_idx ON public.account_tax_makemyday_order_line_rel
	USING btree
	(
	  makemyday_order_line_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: account_tax_makemyday_order_line_rel_account_tax_id_idx | type: INDEX --
-- DROP INDEX public.account_tax_makemyday_order_line_rel_account_tax_id_idx;
CREATE INDEX account_tax_makemyday_order_line_rel_account_tax_id_idx ON public.account_tax_makemyday_order_line_rel
	USING btree
	(
	  account_tax_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.account_tax_makemyday_order_line_rel IS 'RELATION BETWEEN makemyday_order_line AND account_tax';
-- ddl-end --

-- object: public.makemyday_category_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_category_id_seq;
CREATE SEQUENCE public.makemyday_category_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_category | type: TABLE --
-- DROP TABLE public.makemyday_category;
CREATE TABLE public.makemyday_category(
	id integer NOT NULL DEFAULT nextval('makemyday_category_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	name character varying NOT NULL,
	sequence integer,
	write_uid integer,
	parent_id integer,
	write_date timestamp,
	CONSTRAINT makemyday_category_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- object: makemyday_category_parent_id_index | type: INDEX --
-- DROP INDEX public.makemyday_category_parent_id_index;
CREATE INDEX makemyday_category_parent_id_index ON public.makemyday_category
	USING btree
	(
	  parent_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.makemyday_category IS 'Public Category';
COMMENT ON COLUMN public.makemyday_category.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_category.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_category.name IS 'Name';
COMMENT ON COLUMN public.makemyday_category.sequence IS 'Sequence';
COMMENT ON COLUMN public.makemyday_category.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_category.parent_id IS 'Parent Category';
COMMENT ON COLUMN public.makemyday_category.write_date IS 'Last Updated on';
-- ddl-end --

-- object: public.makemyday_confirm_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_confirm_id_seq;
CREATE SEQUENCE public.makemyday_confirm_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_confirm | type: TABLE --
-- DROP TABLE public.makemyday_confirm;
CREATE TABLE public.makemyday_confirm(
	id integer NOT NULL DEFAULT nextval('makemyday_confirm_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	write_date timestamp,
	write_uid integer,
	CONSTRAINT makemyday_confirm_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_confirm IS 'Post POS Journal Entries';
COMMENT ON COLUMN public.makemyday_confirm.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_confirm.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_confirm.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_confirm.write_uid IS 'Last Updated by';
-- ddl-end --

-- object: public.makemyday_details_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_details_id_seq;
CREATE SEQUENCE public.makemyday_details_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_details | type: TABLE --
-- DROP TABLE public.makemyday_details;
CREATE TABLE public.makemyday_details(
	id integer NOT NULL DEFAULT nextval('makemyday_details_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	date_end date NOT NULL,
	date_start date NOT NULL,
	write_uid integer,
	write_date timestamp,
	CONSTRAINT makemyday_details_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_details IS 'Sales Details';
COMMENT ON COLUMN public.makemyday_details.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_details.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_details.date_end IS 'Date End';
COMMENT ON COLUMN public.makemyday_details.date_start IS 'Date Start';
COMMENT ON COLUMN public.makemyday_details.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_details.write_date IS 'Last Updated on';
-- ddl-end --

-- object: public.makemyday_details_report_user_rel | type: TABLE --
-- DROP TABLE public.makemyday_details_report_user_rel;
CREATE TABLE public.makemyday_details_report_user_rel(
	user_id integer NOT NULL,
	wizard_id integer NOT NULL,
	CONSTRAINT makemyday_details_report_user_rel_user_id_wizard_id_key UNIQUE (user_id,wizard_id)

);
-- ddl-end --
-- object: makemyday_details_report_user_rel_user_id_idx | type: INDEX --
-- DROP INDEX public.makemyday_details_report_user_rel_user_id_idx;
CREATE INDEX makemyday_details_report_user_rel_user_id_idx ON public.makemyday_details_report_user_rel
	USING btree
	(
	  user_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: makemyday_details_report_user_rel_wizard_id_idx | type: INDEX --
-- DROP INDEX public.makemyday_details_report_user_rel_wizard_id_idx;
CREATE INDEX makemyday_details_report_user_rel_wizard_id_idx ON public.makemyday_details_report_user_rel
	USING btree
	(
	  wizard_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.makemyday_details_report_user_rel IS 'RELATION BETWEEN makemyday_details AND res_users';
-- ddl-end --

-- object: public.makemyday_discount_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_discount_id_seq;
CREATE SEQUENCE public.makemyday_discount_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_discount | type: TABLE --
-- DROP TABLE public.makemyday_discount;
CREATE TABLE public.makemyday_discount(
	id integer NOT NULL DEFAULT nextval('makemyday_discount_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	write_uid integer,
	discount numeric NOT NULL,
	write_date timestamp,
	CONSTRAINT makemyday_discount_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_discount IS 'Add a Global Discount';
COMMENT ON COLUMN public.makemyday_discount.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_discount.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_discount.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_discount.discount IS 'Discount (%)';
COMMENT ON COLUMN public.makemyday_discount.write_date IS 'Last Updated on';
-- ddl-end --

-- object: public.makemyday_open_statement_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_open_statement_id_seq;
CREATE SEQUENCE public.makemyday_open_statement_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_open_statement | type: TABLE --
-- DROP TABLE public.makemyday_open_statement;
CREATE TABLE public.makemyday_open_statement(
	id integer NOT NULL DEFAULT nextval('makemyday_open_statement_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	write_date timestamp,
	write_uid integer,
	CONSTRAINT makemyday_open_statement_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_open_statement IS 'Open Statements';
COMMENT ON COLUMN public.makemyday_open_statement.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_open_statement.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_open_statement.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_open_statement.write_uid IS 'Last Updated by';
-- ddl-end --

-- object: public.makemyday_make_payment_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_make_payment_id_seq;
CREATE SEQUENCE public.makemyday_make_payment_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_make_payment | type: TABLE --
-- DROP TABLE public.makemyday_make_payment;
CREATE TABLE public.makemyday_make_payment(
	id integer NOT NULL DEFAULT nextval('makemyday_make_payment_id_seq'::regclass),
	payment_date date NOT NULL,
	payment_name character varying,
	create_uid integer,
	journal_id integer NOT NULL,
	write_uid integer,
	amount numeric NOT NULL,
	write_date timestamp,
	create_date timestamp,
	CONSTRAINT makemyday_make_payment_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_make_payment IS 'Point of Sale Payment';
COMMENT ON COLUMN public.makemyday_make_payment.payment_date IS 'Payment Date';
COMMENT ON COLUMN public.makemyday_make_payment.payment_name IS 'Payment Reference';
COMMENT ON COLUMN public.makemyday_make_payment.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_make_payment.journal_id IS 'Payment Mode';
COMMENT ON COLUMN public.makemyday_make_payment.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_make_payment.amount IS 'Amount';
COMMENT ON COLUMN public.makemyday_make_payment.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_make_payment.create_date IS 'Created on';
-- ddl-end --

-- object: public.makemyday_config_settings_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_config_settings_id_seq;
CREATE SEQUENCE public.makemyday_config_settings_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_config_settings | type: TABLE --
-- DROP TABLE public.makemyday_config_settings;
CREATE TABLE public.makemyday_config_settings(
	id integer NOT NULL DEFAULT nextval('makemyday_config_settings_id_seq'::regclass),
	module_pos_reprint integer,
	create_uid integer,
	module_pos_discount integer,
	module_pos_mercury integer,
	module_pos_loyalty boolean,
	write_uid integer,
	module_pos_makemyday integer,
	write_date timestamp,
	create_date timestamp,
	module_makemyday_discount integer,
	CONSTRAINT makemyday_config_settings_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_config_settings IS 'makemyday.config.settings';
COMMENT ON COLUMN public.makemyday_config_settings.module_pos_reprint IS 'Reprints';
COMMENT ON COLUMN public.makemyday_config_settings.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_config_settings.module_pos_discount IS 'Discount';
COMMENT ON COLUMN public.makemyday_config_settings.module_pos_mercury IS 'Credit Cards';
COMMENT ON COLUMN public.makemyday_config_settings.module_pos_loyalty IS 'Loyalty Program';
COMMENT ON COLUMN public.makemyday_config_settings.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_config_settings.module_pos_makemyday IS 'Restaurant';
COMMENT ON COLUMN public.makemyday_config_settings.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_config_settings.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_config_settings.module_makemyday_discount IS 'Discount';
-- ddl-end --

-- object: public.makemyday_floor_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_floor_id_seq;
CREATE SEQUENCE public.makemyday_floor_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_floor | type: TABLE --
-- DROP TABLE public.makemyday_floor;
CREATE TABLE public.makemyday_floor(
	id integer NOT NULL DEFAULT nextval('makemyday_floor_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	name character varying NOT NULL,
	sequence integer,
	write_uid integer,
	write_date timestamp,
	background_color character varying,
	makemyday_config_id integer,
	CONSTRAINT makemyday_floor_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_floor IS 'makemyday.floor';
COMMENT ON COLUMN public.makemyday_floor.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_floor.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_floor.name IS 'Floor Name';
COMMENT ON COLUMN public.makemyday_floor.sequence IS 'Sequence';
COMMENT ON COLUMN public.makemyday_floor.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_floor.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_floor.background_color IS 'Background Color';
COMMENT ON COLUMN public.makemyday_floor.makemyday_config_id IS 'Point of Sale';
-- ddl-end --

-- object: public.makemyday_table_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_table_id_seq;
CREATE SEQUENCE public.makemyday_table_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_table | type: TABLE --
-- DROP TABLE public.makemyday_table;
CREATE TABLE public.makemyday_table(
	id integer NOT NULL DEFAULT nextval('makemyday_table_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	name character varying(32) NOT NULL,
	position_h double precision,
	color character varying,
	floor_id integer,
	height double precision,
	width double precision,
	shape character varying NOT NULL,
	write_date timestamp,
	seats integer,
	position_v double precision,
	write_uid integer,
	active boolean,
	CONSTRAINT makemyday_table_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_table IS 'makemyday.table';
COMMENT ON COLUMN public.makemyday_table.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_table.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_table.name IS 'Table Name';
COMMENT ON COLUMN public.makemyday_table.position_h IS 'Horizontal Position';
COMMENT ON COLUMN public.makemyday_table.color IS 'Color';
COMMENT ON COLUMN public.makemyday_table.floor_id IS 'Floor';
COMMENT ON COLUMN public.makemyday_table.height IS 'Height';
COMMENT ON COLUMN public.makemyday_table.width IS 'Width';
COMMENT ON COLUMN public.makemyday_table.shape IS 'Shape';
COMMENT ON COLUMN public.makemyday_table.write_date IS 'Last Updated on';
COMMENT ON COLUMN public.makemyday_table.seats IS 'Seats';
COMMENT ON COLUMN public.makemyday_table.position_v IS 'Vertical Position';
COMMENT ON COLUMN public.makemyday_table.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_table.active IS 'Active';
-- ddl-end --

-- object: public.makemyday_printer_id_seq | type: SEQUENCE --
-- DROP SEQUENCE public.makemyday_printer_id_seq;
CREATE SEQUENCE public.makemyday_printer_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: public.makemyday_printer | type: TABLE --
-- DROP TABLE public.makemyday_printer;
CREATE TABLE public.makemyday_printer(
	id integer NOT NULL DEFAULT nextval('makemyday_printer_id_seq'::regclass),
	create_uid integer,
	create_date timestamp,
	name character varying(32) NOT NULL,
	write_uid integer,
	proxy_ip character varying(32),
	write_date timestamp,
	CONSTRAINT makemyday_printer_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.makemyday_printer IS 'makemyday.printer';
COMMENT ON COLUMN public.makemyday_printer.create_uid IS 'Created by';
COMMENT ON COLUMN public.makemyday_printer.create_date IS 'Created on';
COMMENT ON COLUMN public.makemyday_printer.name IS 'Printer Name';
COMMENT ON COLUMN public.makemyday_printer.write_uid IS 'Last Updated by';
COMMENT ON COLUMN public.makemyday_printer.proxy_ip IS 'Proxy IP Address';
COMMENT ON COLUMN public.makemyday_printer.write_date IS 'Last Updated on';
-- ddl-end --

-- object: public.makemyday_config_printer_rel | type: TABLE --
-- DROP TABLE public.makemyday_config_printer_rel;
CREATE TABLE public.makemyday_config_printer_rel(
	config_id integer NOT NULL,
	printer_id integer NOT NULL,
	CONSTRAINT makemyday_config_printer_rel_config_id_printer_id_key UNIQUE (config_id,printer_id)

);
-- ddl-end --
-- object: makemyday_config_printer_rel_config_id_idx | type: INDEX --
-- DROP INDEX public.makemyday_config_printer_rel_config_id_idx;
CREATE INDEX makemyday_config_printer_rel_config_id_idx ON public.makemyday_config_printer_rel
	USING btree
	(
	  config_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: makemyday_config_printer_rel_printer_id_idx | type: INDEX --
-- DROP INDEX public.makemyday_config_printer_rel_printer_id_idx;
CREATE INDEX makemyday_config_printer_rel_printer_id_idx ON public.makemyday_config_printer_rel
	USING btree
	(
	  printer_id
	)	WITH (FILLFACTOR = 90);
-- ddl-end --


COMMENT ON TABLE public.makemyday_config_printer_rel IS 'RELATION BETWEEN makemyday_config AND makemyday_printer';
-- ddl-end --

-- object: res_users_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_users DROP CONSTRAINT res_users_company_id_fkey;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_users_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_users DROP CONSTRAINT res_users_write_uid_fkey;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_users_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_users DROP CONSTRAINT res_users_create_uid_fkey;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_users_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_users DROP CONSTRAINT res_users_partner_id_fkey;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_users_makemyday_config_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_users DROP CONSTRAINT res_users_makemyday_config_fkey;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_makemyday_config_fkey FOREIGN KEY (makemyday_config)
REFERENCES public.makemyday_config (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_company_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_company DROP CONSTRAINT res_company_create_uid_fkey;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_company_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_company DROP CONSTRAINT res_company_partner_id_fkey;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_company_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_company DROP CONSTRAINT res_company_write_uid_fkey;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_company_parent_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_company DROP CONSTRAINT res_company_parent_id_fkey;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_parent_id_fkey FOREIGN KEY (parent_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_company_internal_transit_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_company DROP CONSTRAINT res_company_internal_transit_location_id_fkey;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_internal_transit_location_id_fkey FOREIGN KEY (internal_transit_location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_partner_user_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_partner DROP CONSTRAINT res_partner_user_id_fkey;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_user_id_fkey FOREIGN KEY (user_id)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_partner_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_partner DROP CONSTRAINT res_partner_create_uid_fkey;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_partner_commercial_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_partner DROP CONSTRAINT res_partner_commercial_partner_id_fkey;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_commercial_partner_id_fkey FOREIGN KEY (commercial_partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_partner_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_partner DROP CONSTRAINT res_partner_company_id_fkey;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_partner_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_partner DROP CONSTRAINT res_partner_write_uid_fkey;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: res_partner_parent_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.res_partner DROP CONSTRAINT res_partner_parent_id_fkey;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_parent_id_fkey FOREIGN KEY (parent_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_category_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_category DROP CONSTRAINT product_category_create_uid_fkey;
ALTER TABLE public.product_category ADD CONSTRAINT product_category_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_category_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_category DROP CONSTRAINT product_category_write_uid_fkey;
ALTER TABLE public.product_category ADD CONSTRAINT product_category_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_category_parent_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_category DROP CONSTRAINT product_category_parent_id_fkey;
ALTER TABLE public.product_category ADD CONSTRAINT product_category_parent_id_fkey FOREIGN KEY (parent_id)
REFERENCES public.product_category (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_template_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_template DROP CONSTRAINT product_template_create_uid_fkey;
ALTER TABLE public.product_template ADD CONSTRAINT product_template_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_template_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_template DROP CONSTRAINT product_template_company_id_fkey;
ALTER TABLE public.product_template ADD CONSTRAINT product_template_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_template_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_template DROP CONSTRAINT product_template_write_uid_fkey;
ALTER TABLE public.product_template ADD CONSTRAINT product_template_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_template_product_manager_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_template DROP CONSTRAINT product_template_product_manager_fkey;
ALTER TABLE public.product_template ADD CONSTRAINT product_template_product_manager_fkey FOREIGN KEY (product_manager)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_template_categ_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_template DROP CONSTRAINT product_template_categ_id_fkey;
ALTER TABLE public.product_template ADD CONSTRAINT product_template_categ_id_fkey FOREIGN KEY (categ_id)
REFERENCES public.product_category (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: product_template_makemyday_categ_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.product_template DROP CONSTRAINT product_template_makemyday_categ_id_fkey;
ALTER TABLE public.product_template ADD CONSTRAINT product_template_makemyday_categ_id_fkey FOREIGN KEY (makemyday_categ_id)
REFERENCES public.makemyday_category (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice DROP CONSTRAINT account_invoice_partner_id_fkey;
ALTER TABLE public.account_invoice ADD CONSTRAINT account_invoice_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_commercial_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice DROP CONSTRAINT account_invoice_commercial_partner_id_fkey;
ALTER TABLE public.account_invoice ADD CONSTRAINT account_invoice_commercial_partner_id_fkey FOREIGN KEY (commercial_partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_user_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice DROP CONSTRAINT account_invoice_user_id_fkey;
ALTER TABLE public.account_invoice ADD CONSTRAINT account_invoice_user_id_fkey FOREIGN KEY (user_id)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice DROP CONSTRAINT account_invoice_create_uid_fkey;
ALTER TABLE public.account_invoice ADD CONSTRAINT account_invoice_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice DROP CONSTRAINT account_invoice_company_id_fkey;
ALTER TABLE public.account_invoice ADD CONSTRAINT account_invoice_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice DROP CONSTRAINT account_invoice_write_uid_fkey;
ALTER TABLE public.account_invoice ADD CONSTRAINT account_invoice_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_line_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice_line DROP CONSTRAINT account_invoice_line_create_uid_fkey;
ALTER TABLE public.account_invoice_line ADD CONSTRAINT account_invoice_line_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_line_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice_line DROP CONSTRAINT account_invoice_line_company_id_fkey;
ALTER TABLE public.account_invoice_line ADD CONSTRAINT account_invoice_line_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_line_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice_line DROP CONSTRAINT account_invoice_line_partner_id_fkey;
ALTER TABLE public.account_invoice_line ADD CONSTRAINT account_invoice_line_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_line_invoice_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice_line DROP CONSTRAINT account_invoice_line_invoice_id_fkey;
ALTER TABLE public.account_invoice_line ADD CONSTRAINT account_invoice_line_invoice_id_fkey FOREIGN KEY (invoice_id)
REFERENCES public.account_invoice (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_invoice_line_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_invoice_line DROP CONSTRAINT account_invoice_line_write_uid_fkey;
ALTER TABLE public.account_invoice_line ADD CONSTRAINT account_invoice_line_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_user_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement DROP CONSTRAINT account_bank_statement_user_id_fkey;
ALTER TABLE public.account_bank_statement ADD CONSTRAINT account_bank_statement_user_id_fkey FOREIGN KEY (user_id)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement DROP CONSTRAINT account_bank_statement_create_uid_fkey;
ALTER TABLE public.account_bank_statement ADD CONSTRAINT account_bank_statement_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement DROP CONSTRAINT account_bank_statement_company_id_fkey;
ALTER TABLE public.account_bank_statement ADD CONSTRAINT account_bank_statement_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement DROP CONSTRAINT account_bank_statement_write_uid_fkey;
ALTER TABLE public.account_bank_statement ADD CONSTRAINT account_bank_statement_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_makemyday_session_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement DROP CONSTRAINT account_bank_statement_makemyday_session_id_fkey;
ALTER TABLE public.account_bank_statement ADD CONSTRAINT account_bank_statement_makemyday_session_id_fkey FOREIGN KEY (makemyday_session_id)
REFERENCES public.makemyday_session (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_line_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement_line DROP CONSTRAINT account_bank_statement_line_create_uid_fkey;
ALTER TABLE public.account_bank_statement_line ADD CONSTRAINT account_bank_statement_line_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_line_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement_line DROP CONSTRAINT account_bank_statement_line_company_id_fkey;
ALTER TABLE public.account_bank_statement_line ADD CONSTRAINT account_bank_statement_line_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_line_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement_line DROP CONSTRAINT account_bank_statement_line_partner_id_fkey;
ALTER TABLE public.account_bank_statement_line ADD CONSTRAINT account_bank_statement_line_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_line_statement_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement_line DROP CONSTRAINT account_bank_statement_line_statement_id_fkey;
ALTER TABLE public.account_bank_statement_line ADD CONSTRAINT account_bank_statement_line_statement_id_fkey FOREIGN KEY (statement_id)
REFERENCES public.account_bank_statement (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_line_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement_line DROP CONSTRAINT account_bank_statement_line_write_uid_fkey;
ALTER TABLE public.account_bank_statement_line ADD CONSTRAINT account_bank_statement_line_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_bank_statement_line_makemyday_statement_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_bank_statement_line DROP CONSTRAINT account_bank_statement_line_makemyday_statement_id_fkey;
ALTER TABLE public.account_bank_statement_line ADD CONSTRAINT account_bank_statement_line_makemyday_statement_id_fkey FOREIGN KEY (makemyday_statement_id)
REFERENCES public.makemyday_order (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_location_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_location DROP CONSTRAINT stock_location_write_uid_fkey;
ALTER TABLE public.stock_location ADD CONSTRAINT stock_location_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_location_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_location DROP CONSTRAINT stock_location_company_id_fkey;
ALTER TABLE public.stock_location ADD CONSTRAINT stock_location_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_location_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_location DROP CONSTRAINT stock_location_partner_id_fkey;
ALTER TABLE public.stock_location ADD CONSTRAINT stock_location_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_location_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_location DROP CONSTRAINT stock_location_location_id_fkey;
ALTER TABLE public.stock_location ADD CONSTRAINT stock_location_location_id_fkey FOREIGN KEY (location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_location_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_location DROP CONSTRAINT stock_location_create_uid_fkey;
ALTER TABLE public.stock_location ADD CONSTRAINT stock_location_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_restrict_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_restrict_partner_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_restrict_partner_id_fkey FOREIGN KEY (restrict_partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_location_dest_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_location_dest_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_location_dest_id_fkey FOREIGN KEY (location_dest_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_company_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_split_from_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_split_from_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_split_from_fkey FOREIGN KEY (split_from)
REFERENCES public.stock_move (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_create_uid_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_write_uid_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_partner_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_origin_returned_move_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_origin_returned_move_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_origin_returned_move_id_fkey FOREIGN KEY (origin_returned_move_id)
REFERENCES public.stock_move (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_warehouse_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_warehouse_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_warehouse_id_fkey FOREIGN KEY (warehouse_id)
REFERENCES public.stock_warehouse (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_location_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_location_id_fkey FOREIGN KEY (location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_inventory_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_inventory_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_inventory_id_fkey FOREIGN KEY (inventory_id)
REFERENCES public.stock_inventory (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_move_move_dest_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_move DROP CONSTRAINT stock_move_move_dest_id_fkey;
ALTER TABLE public.stock_move ADD CONSTRAINT stock_move_move_dest_id_fkey FOREIGN KEY (move_dest_id)
REFERENCES public.stock_move (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory DROP CONSTRAINT stock_inventory_partner_id_fkey;
ALTER TABLE public.stock_inventory ADD CONSTRAINT stock_inventory_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory DROP CONSTRAINT stock_inventory_company_id_fkey;
ALTER TABLE public.stock_inventory ADD CONSTRAINT stock_inventory_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory DROP CONSTRAINT stock_inventory_location_id_fkey;
ALTER TABLE public.stock_inventory ADD CONSTRAINT stock_inventory_location_id_fkey FOREIGN KEY (location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory DROP CONSTRAINT stock_inventory_create_uid_fkey;
ALTER TABLE public.stock_inventory ADD CONSTRAINT stock_inventory_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory DROP CONSTRAINT stock_inventory_write_uid_fkey;
ALTER TABLE public.stock_inventory ADD CONSTRAINT stock_inventory_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_line_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory_line DROP CONSTRAINT stock_inventory_line_partner_id_fkey;
ALTER TABLE public.stock_inventory_line ADD CONSTRAINT stock_inventory_line_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_line_inventory_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory_line DROP CONSTRAINT stock_inventory_line_inventory_id_fkey;
ALTER TABLE public.stock_inventory_line ADD CONSTRAINT stock_inventory_line_inventory_id_fkey FOREIGN KEY (inventory_id)
REFERENCES public.stock_inventory (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_line_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory_line DROP CONSTRAINT stock_inventory_line_company_id_fkey;
ALTER TABLE public.stock_inventory_line ADD CONSTRAINT stock_inventory_line_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_line_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory_line DROP CONSTRAINT stock_inventory_line_location_id_fkey;
ALTER TABLE public.stock_inventory_line ADD CONSTRAINT stock_inventory_line_location_id_fkey FOREIGN KEY (location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_line_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory_line DROP CONSTRAINT stock_inventory_line_create_uid_fkey;
ALTER TABLE public.stock_inventory_line ADD CONSTRAINT stock_inventory_line_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_inventory_line_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_inventory_line DROP CONSTRAINT stock_inventory_line_write_uid_fkey;
ALTER TABLE public.stock_inventory_line ADD CONSTRAINT stock_inventory_line_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_partner_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_view_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_view_location_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_view_location_id_fkey FOREIGN KEY (view_location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_company_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_wh_input_stock_loc_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_wh_input_stock_loc_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_wh_input_stock_loc_id_fkey FOREIGN KEY (wh_input_stock_loc_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_wh_pack_stock_loc_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_wh_pack_stock_loc_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_wh_pack_stock_loc_id_fkey FOREIGN KEY (wh_pack_stock_loc_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_lot_stock_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_lot_stock_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_lot_stock_id_fkey FOREIGN KEY (lot_stock_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_default_resupply_wh_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_default_resupply_wh_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_default_resupply_wh_id_fkey FOREIGN KEY (default_resupply_wh_id)
REFERENCES public.stock_warehouse (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_wh_output_stock_loc_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_wh_output_stock_loc_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_wh_output_stock_loc_id_fkey FOREIGN KEY (wh_output_stock_loc_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_wh_qc_stock_loc_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_wh_qc_stock_loc_id_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_wh_qc_stock_loc_id_fkey FOREIGN KEY (wh_qc_stock_loc_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_write_uid_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse DROP CONSTRAINT stock_warehouse_create_uid_fkey;
ALTER TABLE public.stock_warehouse ADD CONSTRAINT stock_warehouse_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_orderpoint_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse_orderpoint DROP CONSTRAINT stock_warehouse_orderpoint_write_uid_fkey;
ALTER TABLE public.stock_warehouse_orderpoint ADD CONSTRAINT stock_warehouse_orderpoint_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_orderpoint_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse_orderpoint DROP CONSTRAINT stock_warehouse_orderpoint_location_id_fkey;
ALTER TABLE public.stock_warehouse_orderpoint ADD CONSTRAINT stock_warehouse_orderpoint_location_id_fkey FOREIGN KEY (location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_orderpoint_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse_orderpoint DROP CONSTRAINT stock_warehouse_orderpoint_company_id_fkey;
ALTER TABLE public.stock_warehouse_orderpoint ADD CONSTRAINT stock_warehouse_orderpoint_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_orderpoint_warehouse_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse_orderpoint DROP CONSTRAINT stock_warehouse_orderpoint_warehouse_id_fkey;
ALTER TABLE public.stock_warehouse_orderpoint ADD CONSTRAINT stock_warehouse_orderpoint_warehouse_id_fkey FOREIGN KEY (warehouse_id)
REFERENCES public.stock_warehouse (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: stock_warehouse_orderpoint_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.stock_warehouse_orderpoint DROP CONSTRAINT stock_warehouse_orderpoint_create_uid_fkey;
ALTER TABLE public.stock_warehouse_orderpoint ADD CONSTRAINT stock_warehouse_orderpoint_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_iface_start_categ_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config DROP CONSTRAINT makemyday_config_iface_start_categ_id_fkey;
ALTER TABLE public.makemyday_config ADD CONSTRAINT makemyday_config_iface_start_categ_id_fkey FOREIGN KEY (iface_start_categ_id)
REFERENCES public.makemyday_category (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config DROP CONSTRAINT makemyday_config_write_uid_fkey;
ALTER TABLE public.makemyday_config ADD CONSTRAINT makemyday_config_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config DROP CONSTRAINT makemyday_config_company_id_fkey;
ALTER TABLE public.makemyday_config ADD CONSTRAINT makemyday_config_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config DROP CONSTRAINT makemyday_config_create_uid_fkey;
ALTER TABLE public.makemyday_config ADD CONSTRAINT makemyday_config_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_stock_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config DROP CONSTRAINT makemyday_config_stock_location_id_fkey;
ALTER TABLE public.makemyday_config ADD CONSTRAINT makemyday_config_stock_location_id_fkey FOREIGN KEY (stock_location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_fiscal_position_makemyday_conf_makemyday_config_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_fiscal_position_makemyday_config_rel DROP CONSTRAINT account_fiscal_position_makemyday_conf_makemyday_config_id_fkey;
ALTER TABLE public.account_fiscal_position_makemyday_config_rel ADD CONSTRAINT account_fiscal_position_makemyday_conf_makemyday_config_id_fkey FOREIGN KEY (makemyday_config_id)
REFERENCES public.makemyday_config (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_journal_rel_makemyday_config_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config_journal_rel DROP CONSTRAINT makemyday_config_journal_rel_makemyday_config_id_fkey;
ALTER TABLE public.makemyday_config_journal_rel ADD CONSTRAINT makemyday_config_journal_rel_makemyday_config_id_fkey FOREIGN KEY (makemyday_config_id)
REFERENCES public.makemyday_config (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_session_user_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_session DROP CONSTRAINT makemyday_session_user_id_fkey;
ALTER TABLE public.makemyday_session ADD CONSTRAINT makemyday_session_user_id_fkey FOREIGN KEY (user_id)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_session_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_session DROP CONSTRAINT makemyday_session_create_uid_fkey;
ALTER TABLE public.makemyday_session ADD CONSTRAINT makemyday_session_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_session_cash_register_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_session DROP CONSTRAINT makemyday_session_cash_register_id_fkey;
ALTER TABLE public.makemyday_session ADD CONSTRAINT makemyday_session_cash_register_id_fkey FOREIGN KEY (cash_register_id)
REFERENCES public.account_bank_statement (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_session_config_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_session DROP CONSTRAINT makemyday_session_config_id_fkey;
ALTER TABLE public.makemyday_session ADD CONSTRAINT makemyday_session_config_id_fkey FOREIGN KEY (config_id)
REFERENCES public.makemyday_config (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_session_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_session DROP CONSTRAINT makemyday_session_write_uid_fkey;
ALTER TABLE public.makemyday_session ADD CONSTRAINT makemyday_session_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_user_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_user_id_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_user_id_fkey FOREIGN KEY (user_id)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_create_uid_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_session_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_session_id_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_session_id_fkey FOREIGN KEY (session_id)
REFERENCES public.makemyday_session (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_location_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_location_id_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_location_id_fkey FOREIGN KEY (location_id)
REFERENCES public.stock_location (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_partner_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_partner_id_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_partner_id_fkey FOREIGN KEY (partner_id)
REFERENCES public.res_partner (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_invoice_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_invoice_id_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_invoice_id_fkey FOREIGN KEY (invoice_id)
REFERENCES public.account_invoice (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_company_id_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_write_uid_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_table_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order DROP CONSTRAINT makemyday_order_table_id_fkey;
ALTER TABLE public.makemyday_order ADD CONSTRAINT makemyday_order_table_id_fkey FOREIGN KEY (table_id)
REFERENCES public.makemyday_table (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_line_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order_line DROP CONSTRAINT makemyday_order_line_create_uid_fkey;
ALTER TABLE public.makemyday_order_line ADD CONSTRAINT makemyday_order_line_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_line_order_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order_line DROP CONSTRAINT makemyday_order_line_order_id_fkey;
ALTER TABLE public.makemyday_order_line ADD CONSTRAINT makemyday_order_line_order_id_fkey FOREIGN KEY (order_id)
REFERENCES public.makemyday_order (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_line_company_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order_line DROP CONSTRAINT makemyday_order_line_company_id_fkey;
ALTER TABLE public.makemyday_order_line ADD CONSTRAINT makemyday_order_line_company_id_fkey FOREIGN KEY (company_id)
REFERENCES public.res_company (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_order_line_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_order_line DROP CONSTRAINT makemyday_order_line_write_uid_fkey;
ALTER TABLE public.makemyday_order_line ADD CONSTRAINT makemyday_order_line_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: account_tax_makemyday_order_line_r_makemyday_order_line_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.account_tax_makemyday_order_line_rel DROP CONSTRAINT account_tax_makemyday_order_line_r_makemyday_order_line_id_fkey;
ALTER TABLE public.account_tax_makemyday_order_line_rel ADD CONSTRAINT account_tax_makemyday_order_line_r_makemyday_order_line_id_fkey FOREIGN KEY (makemyday_order_line_id)
REFERENCES public.makemyday_order_line (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_category_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_category DROP CONSTRAINT makemyday_category_create_uid_fkey;
ALTER TABLE public.makemyday_category ADD CONSTRAINT makemyday_category_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_category_parent_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_category DROP CONSTRAINT makemyday_category_parent_id_fkey;
ALTER TABLE public.makemyday_category ADD CONSTRAINT makemyday_category_parent_id_fkey FOREIGN KEY (parent_id)
REFERENCES public.makemyday_category (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_category_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_category DROP CONSTRAINT makemyday_category_write_uid_fkey;
ALTER TABLE public.makemyday_category ADD CONSTRAINT makemyday_category_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_confirm_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_confirm DROP CONSTRAINT makemyday_confirm_create_uid_fkey;
ALTER TABLE public.makemyday_confirm ADD CONSTRAINT makemyday_confirm_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_confirm_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_confirm DROP CONSTRAINT makemyday_confirm_write_uid_fkey;
ALTER TABLE public.makemyday_confirm ADD CONSTRAINT makemyday_confirm_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_details_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_details DROP CONSTRAINT makemyday_details_create_uid_fkey;
ALTER TABLE public.makemyday_details ADD CONSTRAINT makemyday_details_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_details_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_details DROP CONSTRAINT makemyday_details_write_uid_fkey;
ALTER TABLE public.makemyday_details ADD CONSTRAINT makemyday_details_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_details_report_user_rel_user_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_details_report_user_rel DROP CONSTRAINT makemyday_details_report_user_rel_user_id_fkey;
ALTER TABLE public.makemyday_details_report_user_rel ADD CONSTRAINT makemyday_details_report_user_rel_user_id_fkey FOREIGN KEY (user_id)
REFERENCES public.makemyday_details (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_details_report_user_rel_wizard_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_details_report_user_rel DROP CONSTRAINT makemyday_details_report_user_rel_wizard_id_fkey;
ALTER TABLE public.makemyday_details_report_user_rel ADD CONSTRAINT makemyday_details_report_user_rel_wizard_id_fkey FOREIGN KEY (wizard_id)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_discount_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_discount DROP CONSTRAINT makemyday_discount_create_uid_fkey;
ALTER TABLE public.makemyday_discount ADD CONSTRAINT makemyday_discount_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_discount_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_discount DROP CONSTRAINT makemyday_discount_write_uid_fkey;
ALTER TABLE public.makemyday_discount ADD CONSTRAINT makemyday_discount_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_open_statement_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_open_statement DROP CONSTRAINT makemyday_open_statement_create_uid_fkey;
ALTER TABLE public.makemyday_open_statement ADD CONSTRAINT makemyday_open_statement_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_open_statement_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_open_statement DROP CONSTRAINT makemyday_open_statement_write_uid_fkey;
ALTER TABLE public.makemyday_open_statement ADD CONSTRAINT makemyday_open_statement_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_make_payment_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_make_payment DROP CONSTRAINT makemyday_make_payment_create_uid_fkey;
ALTER TABLE public.makemyday_make_payment ADD CONSTRAINT makemyday_make_payment_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_make_payment_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_make_payment DROP CONSTRAINT makemyday_make_payment_write_uid_fkey;
ALTER TABLE public.makemyday_make_payment ADD CONSTRAINT makemyday_make_payment_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_settings_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config_settings DROP CONSTRAINT makemyday_config_settings_write_uid_fkey;
ALTER TABLE public.makemyday_config_settings ADD CONSTRAINT makemyday_config_settings_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_settings_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config_settings DROP CONSTRAINT makemyday_config_settings_create_uid_fkey;
ALTER TABLE public.makemyday_config_settings ADD CONSTRAINT makemyday_config_settings_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_floor_makemyday_config_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_floor DROP CONSTRAINT makemyday_floor_makemyday_config_id_fkey;
ALTER TABLE public.makemyday_floor ADD CONSTRAINT makemyday_floor_makemyday_config_id_fkey FOREIGN KEY (makemyday_config_id)
REFERENCES public.makemyday_config (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_floor_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_floor DROP CONSTRAINT makemyday_floor_write_uid_fkey;
ALTER TABLE public.makemyday_floor ADD CONSTRAINT makemyday_floor_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_floor_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_floor DROP CONSTRAINT makemyday_floor_create_uid_fkey;
ALTER TABLE public.makemyday_floor ADD CONSTRAINT makemyday_floor_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_table_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_table DROP CONSTRAINT makemyday_table_create_uid_fkey;
ALTER TABLE public.makemyday_table ADD CONSTRAINT makemyday_table_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_table_floor_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_table DROP CONSTRAINT makemyday_table_floor_id_fkey;
ALTER TABLE public.makemyday_table ADD CONSTRAINT makemyday_table_floor_id_fkey FOREIGN KEY (floor_id)
REFERENCES public.makemyday_floor (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_table_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_table DROP CONSTRAINT makemyday_table_write_uid_fkey;
ALTER TABLE public.makemyday_table ADD CONSTRAINT makemyday_table_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_printer_create_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_printer DROP CONSTRAINT makemyday_printer_create_uid_fkey;
ALTER TABLE public.makemyday_printer ADD CONSTRAINT makemyday_printer_create_uid_fkey FOREIGN KEY (create_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_printer_write_uid_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_printer DROP CONSTRAINT makemyday_printer_write_uid_fkey;
ALTER TABLE public.makemyday_printer ADD CONSTRAINT makemyday_printer_write_uid_fkey FOREIGN KEY (write_uid)
REFERENCES public.res_users (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_printer_rel_config_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config_printer_rel DROP CONSTRAINT makemyday_config_printer_rel_config_id_fkey;
ALTER TABLE public.makemyday_config_printer_rel ADD CONSTRAINT makemyday_config_printer_rel_config_id_fkey FOREIGN KEY (config_id)
REFERENCES public.makemyday_config (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: makemyday_config_printer_rel_printer_id_fkey | type: CONSTRAINT --
-- ALTER TABLE public.makemyday_config_printer_rel DROP CONSTRAINT makemyday_config_printer_rel_printer_id_fkey;
ALTER TABLE public.makemyday_config_printer_rel ADD CONSTRAINT makemyday_config_printer_rel_printer_id_fkey FOREIGN KEY (printer_id)
REFERENCES public.makemyday_printer (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --



