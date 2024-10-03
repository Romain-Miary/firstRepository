CREATE TABLE activity_year ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	start_year           int      ,
	end_year             int      ,
	note                 text      ,
	deleted_at           date      
 );


CREATE TABLE education_field ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	note                 varchar(600)      ,
	deleted_at           date      ,
	name                 varchar(100)      
 );

CREATE TABLE hierarchy ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	note                 varchar(600)      ,
	deleted_at           date      ,
	level                varchar(100)      
 );

CREATE TABLE member ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	last_name            varchar(100)      ,
	first_name           varchar(100)      ,
	contact              varchar(20)      ,
	birthdate            date      ,
	birth_place          varchar(100)      ,
	address              varchar(100)      ,
	church               varchar(255)      ,
	entry_date           date      ,
	promise_date         date      ,
	picture              varchar(255)      ,
	talent               varchar(255)      ,
	religion             varchar(200)      ,
	deleted_at           date      
 );

CREATE TABLE member_role ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	note                 varchar(600)      ,
	deleted_at           date      ,
	level                varchar(100)      
 );

CREATE TABLE payment_type ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	note                 varchar(600)      ,
	deleted_at           date      
 );

CREATE TABLE process_type ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	note                 varchar(600)      ,
	deleted_at           date      
 );

CREATE TABLE sacrement ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	note                 varchar(600)      ,
	deleted_at           date      
 );

CREATE TABLE section ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	code                 varchar(50)      ,
	color                varchar(100)      ,
	min_age              int      ,
	max_age              int      ,
	section_name         varchar(100)      ,
	group_name           varchar(100)      ,
	motto                varchar(600)      ,
	activity_name        varchar(100)      ,
	outfit_color         varchar(600)      ,
	council              varchar(200)      ,
	patron_saint         varchar(255)      ,
	base                 varchar(255)      ,
	engagement           varchar(255)      ,
	deleted_at           date      
 );

CREATE TABLE section_steps ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	section_id           int  NOT NULL    ,
	level                varchar(200)      ,
	name                 varchar(100)      ,
	deleted_at           date      ,
	CONSTRAINT fk_section_steps_section FOREIGN KEY ( section_id ) REFERENCES section( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_section_steps_section ON section_steps ( section_id );

CREATE TABLE talent_category ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	color                varchar(100)      ,
	deleted_at           date      
 );

CREATE TABLE `user` ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	username             varchar(100)      ,
	password             varchar(255)      ,
	member_id            int  NOT NULL    ,
	deleted_at           date      ,
	email                varchar(250)      ,
	is_active            boolean      ,
	CONSTRAINT fk_user_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_user_member ON `user` ( member_id );

CREATE TABLE youth_info ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	father_name          varchar(100)      ,
	father_contact       varchar(100)      ,
	father_mail          varchar(100)      ,
	mother_name          varchar(100)      ,
	mother_contact       varchar(100)      ,
	mother_mail          varchar(100)      ,
	member_id            int  NOT NULL    ,
	school_name          varchar(100)      ,
	level                varchar(100)      ,
	note                 varchar(600)      ,
	siblings             int      ,
	siblings_rank        int      ,
	hobby                varchar(255)      ,
	language             varchar(255)      ,
	health_condition     varchar(255)      ,
	allergy              varchar(255)      ,
	deleted_at           date      ,
	CONSTRAINT fk_youth_info_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_youth_info_member ON youth_info ( member_id );

CREATE TABLE youth_section_step ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	section_steps_id     int  NOT NULL    ,
	youth_info_id        int  NOT NULL    ,
	`date`               date      ,
	status               boolean      ,
	deleted_at           date      ,
	CONSTRAINT fk_youth_section_step_section_steps FOREIGN KEY ( section_steps_id ) REFERENCES section_steps( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_youth_section_step_youth_info FOREIGN KEY ( youth_info_id ) REFERENCES youth_info( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_youth_section_step_section_steps ON youth_section_step ( section_steps_id );

CREATE INDEX fk_youth_section_step_youth_info ON youth_section_step ( youth_info_id );

CREATE TABLE activity_field ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	number               varchar(20)      ,
	name                 varchar(100)      ,
	superior_field       int      ,
	place                varchar(200)      ,
	entity               varchar(100)      ,
	hierarchy_id         int  NOT NULL    ,
	deleted_at           date      ,
	CONSTRAINT fk_activity_field_activity_field FOREIGN KEY ( superior_field ) REFERENCES activity_field( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_activity_field_hierarchy FOREIGN KEY ( hierarchy_id ) REFERENCES hierarchy( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_activity_field_activity_field ON activity_field ( superior_field );

CREATE INDEX fk_activity_field_hierarchy ON activity_field ( hierarchy_id );

CREATE TABLE activity_field_section ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	activity_field_id    int  NOT NULL    ,
	section_id           int  NOT NULL    ,
	deleted_at           date      ,
	CONSTRAINT fk_activity_field_section_activity_field FOREIGN KEY ( activity_field_id ) REFERENCES activity_field( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_activity_field_section_section FOREIGN KEY ( section_id ) REFERENCES section( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_activity_field_section_activity_field ON activity_field_section ( activity_field_id );

CREATE INDEX fk_activity_field_section_section ON activity_field_section ( section_id );

CREATE TABLE activity_plan ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	activity_year_id     int  NOT NULL    ,
	activity_field_section_id int      ,
	start_month          int      ,
	end_month            int      ,
	status               char(1)      ,
	note                 varchar(600)      ,
	purpose              text      ,
	deleted_at           date      ,
	activity_field_id    int      ,
	CONSTRAINT fk_activity_plan_activity_field FOREIGN KEY ( activity_field_id ) REFERENCES activity_field( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_activity_plan_activity_field_section FOREIGN KEY ( activity_field_section_id ) REFERENCES activity_field_section( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_activity_plan_activity_year FOREIGN KEY ( activity_year_id ) REFERENCES activity_year( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_activity_plan_activity_field ON activity_plan ( activity_field_id );

CREATE INDEX fk_activity_plan_activity_field_section ON activity_plan ( activity_field_section_id );

CREATE INDEX fk_activity_plan_activity_year ON activity_plan ( activity_year_id );

CREATE TABLE adult_info ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	member_id            int  NOT NULL    ,
	marital_status       char(1)      ,
	child_number         int      ,
	profession           varchar(100)      ,
	company_name         varchar(100)      ,
	school_name          varchar(100)      ,
	school_level         varchar(100)      ,
	mail                 varchar(255)      ,
	facebook             varchar(255)      ,
	church_activities    varchar(200)      ,
	church_association   varchar(255)      ,
	deleted_at           date      ,
	CONSTRAINT fk_adult_info_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_adult_info_member ON adult_info ( member_id );

CREATE TABLE detail_activity_plan ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	participants         varchar(255)      ,
	activity_plan_id     int  NOT NULL    ,
	ressource_persons    text      ,
	ressource_tools      text      ,
	ressource_money      text      ,
	place                varchar(200)      ,
	success_rate         text      ,
	blocking             text      ,
	`date`               date      ,
	deleted_at           date      ,
	activity_name        varchar(100)      ,
	other_goals          text      ,
	CONSTRAINT fk_detail_activity_plan_activity_plan FOREIGN KEY ( activity_plan_id ) REFERENCES activity_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_detail_activity_plan_activity_plan ON detail_activity_plan ( activity_plan_id );

CREATE TABLE detail_activity_plan_responsible ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	detail_activity_plan_id int  NOT NULL    ,
	adult_info_id        int      ,
	deleted_at           date      ,
	CONSTRAINT fk_detail_activity_plan_responsible_adult_info FOREIGN KEY ( adult_info_id ) REFERENCES adult_info( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_detail_activity_plan_responsible_detail_activity_plan FOREIGN KEY ( detail_activity_plan_id ) REFERENCES detail_activity_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_detail_activity_plan_responsible_adult_info ON detail_activity_plan_responsible ( adult_info_id );

CREATE INDEX fk_detail_activity_plan_responsible_detail_activity_plan ON detail_activity_plan_responsible ( detail_activity_plan_id );

CREATE TABLE education_goal ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	section_steps_id     int  NOT NULL    ,
	education_field_id   int  NOT NULL    ,
	education_goal       varchar(255)      ,
	deleted_at           date      ,
	CONSTRAINT fk_education_goal_eduction_field FOREIGN KEY ( education_field_id ) REFERENCES education_field( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_education_goal_section_steps FOREIGN KEY ( section_steps_id ) REFERENCES section_steps( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_education_goal_eduction_field ON education_goal ( education_field_id );

CREATE INDEX fk_education_goal_section_steps ON education_goal ( section_steps_id );

CREATE TABLE fee_type ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	note                 varchar(600)      ,
	deleted_at           date      ,
	activity_field_id    int      ,
	CONSTRAINT fk_fee_type_activity_field FOREIGN KEY ( activity_field_id ) REFERENCES activity_field( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_fee_type_activity_field ON fee_type ( activity_field_id );

CREATE TABLE group_section ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	note                 varchar(600)      ,
	activity_field_section_id int  NOT NULL    ,
	deleted_at           date      ,
	CONSTRAINT fk_group_section_activity_field_section FOREIGN KEY ( activity_field_section_id ) REFERENCES activity_field_section( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_group_section_activity_field_section ON group_section ( activity_field_section_id );

CREATE TABLE member_activity ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	member_id            int  NOT NULL    ,
	activity_field_id    int  NOT NULL    ,
	activity_year_id     int  NOT NULL    ,
	member_role_id       int  NOT NULL    ,
	section_id           int      ,
	note_role            varchar(600)      ,
	level                varchar(10)      ,
	deleted_at           date      ,
	CONSTRAINT fk_member_activity_activity_field FOREIGN KEY ( activity_field_id ) REFERENCES activity_field( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_member_activity_activity_year FOREIGN KEY ( activity_year_id ) REFERENCES activity_year( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_member_activity_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_member_activity_member_role FOREIGN KEY ( member_role_id ) REFERENCES member_role( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_member_activity_section FOREIGN KEY ( section_id ) REFERENCES section( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_member_activity_activity_field ON member_activity ( activity_field_id );

CREATE INDEX fk_member_activity_activity_year ON member_activity ( activity_year_id );

CREATE INDEX fk_member_activity_member ON member_activity ( member_id );

CREATE INDEX fk_member_activity_member_role ON member_activity ( member_role_id );

CREATE INDEX fk_member_activity_section ON member_activity ( section_id );

CREATE TABLE member_group_name ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	group_section_id     int  NOT NULL    ,
	member_activity_id   int  NOT NULL    ,
	deleted_at           date      ,
	CONSTRAINT fk_member_group_name_group_section FOREIGN KEY ( group_section_id ) REFERENCES group_section( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_member_group_name_member_activity FOREIGN KEY ( member_activity_id ) REFERENCES member_activity( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_member_group_name_group_section ON member_group_name ( group_section_id );

CREATE INDEX fk_member_group_name_member_activity ON member_group_name ( member_activity_id );

CREATE TABLE member_sacrement ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	sacrement_id         int  NOT NULL    ,
	member_id            int  NOT NULL    ,
	`date`               date      ,
	place                varchar(250)      ,
	deleted_at           date      ,
	CONSTRAINT fk_member_sacrement_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_member_sacrement_sacrement FOREIGN KEY ( sacrement_id ) REFERENCES sacrement( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_member_sacrement_member ON member_sacrement ( member_id );

CREATE INDEX fk_member_sacrement_sacrement ON member_sacrement ( sacrement_id );

CREATE TABLE membership_fee ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	hierarchy_id         int      ,
	member_role_id       int  NOT NULL    ,
	activity_year_id     int  NOT NULL    ,
	fee_type_id          int  NOT NULL    ,
	amount               int      ,
	status               char(1)      ,
	deleted_at           date      ,
	CONSTRAINT membership_fee_ibfk_1 FOREIGN KEY ( activity_year_id ) REFERENCES activity_year( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT membership_fee_ibfk_2 FOREIGN KEY ( fee_type_id ) REFERENCES fee_type( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT membership_fee_ibfk_3 FOREIGN KEY ( hierarchy_id ) REFERENCES hierarchy( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT membership_fee_ibfk_4 FOREIGN KEY ( member_role_id ) REFERENCES member_role( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX activity_year_id ON membership_fee ( activity_year_id );

CREATE INDEX fee_type_id ON membership_fee ( fee_type_id );

CREATE INDEX hierarchy_id ON membership_fee ( hierarchy_id );

CREATE INDEX member_role_id ON membership_fee ( member_role_id );

CREATE TABLE payment_draft ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	payer                varchar(250)  NOT NULL    ,
	`date`               date  NOT NULL    ,
	amount               decimal(10,0)      ,
	note                 text      ,
	deleted_at           date      ,
	payment_type_id      int  NOT NULL    ,
	CONSTRAINT fk_payment_draft_payment_type FOREIGN KEY ( payment_type_id ) REFERENCES payment_type( id ) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) engine=InnoDB;

CREATE INDEX unq_payment_draft_payment_type ON payment_draft ( payment_type_id );

CREATE TABLE payment_draft_detail ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	last_name            varchar(100)      ,
	first_name           varchar(250)      ,
	phone_number         varchar(50)      ,
	email                varchar(100)      ,
	activity_year_id     int  NOT NULL    ,
	member_role_id       int  NOT NULL    ,
	fee_type_id          int  NOT NULL    ,
	payment_draft_id     int  NOT NULL    ,
	member_id            int      ,
	hierarchy_id         int      ,
	amount               decimal(10,0)  NOT NULL    ,
	deleted_at           date      ,
	birthdate            date      ,
	promise_date         date      ,
	training_one         boolean      ,
	training_two         boolean      ,
	training_three       boolean      ,
	training_four        boolean      ,
	training_five        boolean      ,
	CONSTRAINT fk_payment_draft_detail_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_payment_draft_detail_member_role FOREIGN KEY ( member_role_id ) REFERENCES member_role( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_payment_draft_detail_fee_type FOREIGN KEY ( fee_type_id ) REFERENCES fee_type( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_payment_draft_detail_activity_year FOREIGN KEY ( activity_year_id ) REFERENCES activity_year( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_payment_draft_detail_hierarchy FOREIGN KEY ( hierarchy_id ) REFERENCES hierarchy( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_payment_draft_detail_payment_draft FOREIGN KEY ( payment_draft_id ) REFERENCES payment_draft( id ) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) engine=InnoDB;

CREATE INDEX unq_payment_draft_detail_payment_draft_id ON payment_draft_detail ( payment_draft_id );

CREATE INDEX fk_payment_draft_detail_activity_year ON payment_draft_detail ( activity_year_id );

CREATE INDEX fk_payment_draft_detail_fee_type ON payment_draft_detail ( fee_type_id );

CREATE INDEX fk_payment_draft_detail_hierarchy ON payment_draft_detail ( hierarchy_id );

CREATE INDEX fk_payment_draft_detail_member ON payment_draft_detail ( member_id );

CREATE INDEX fk_payment_draft_detail_member_role ON payment_draft_detail ( member_role_id );

CREATE TABLE payment_draft_detail_activity_field ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	activity_field_id    int  NOT NULL    ,
	payment_draft_detail_id int  NOT NULL    ,
	CONSTRAINT fk_payment_draft_detai_activity_field_activity_field FOREIGN KEY ( activity_field_id ) REFERENCES activity_field( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_payment_draft_detail_activity_field_payment_draft_detail FOREIGN KEY ( payment_draft_detail_id ) REFERENCES payment_draft_detail( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 ) engine=InnoDB;

CREATE INDEX fk_payment_draft_detail_activity_field_activity_field ON payment_draft_detail_activity_field ( activity_field_id );

CREATE INDEX fk_payment_draft_detail_activity_field_payment_draft_detail ON payment_draft_detail_activity_field ( payment_draft_detail_id );

CREATE TABLE talent ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	talent_category_id   int  NOT NULL    ,
	name                 varchar(100)      ,
	image                varchar(255)      ,
	note                 varchar(600)      ,
	deleted_at           date      ,
	CONSTRAINT fk_talent_talent_category FOREIGN KEY ( talent_category_id ) REFERENCES talent_category( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_talent_talent_category ON talent ( talent_category_id );

CREATE TABLE talent_goal ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	talent_id            int  NOT NULL    ,
	section_id           int  NOT NULL    ,
	talent_goal          varchar(255)      ,
	deleted_at           date      ,
	CONSTRAINT fk_talent_goal_section FOREIGN KEY ( section_id ) REFERENCES section( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_talent_goal_talent FOREIGN KEY ( talent_id ) REFERENCES talent( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_talent_goal_section ON talent_goal ( section_id );

CREATE INDEX fk_talent_goal_talent ON talent_goal ( talent_id );

CREATE TABLE action_plan ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	detail_activity_plan_id int      ,
	participants         varchar(255)      ,
	topic                text      ,
	place                varchar(200)      ,
	stage                text      ,
	rules                text      ,
	duration             int      ,
	deleted_at           date      ,
	activity_field_id    int      ,
	activity_field_section_id int      ,
	other_goals          text      ,
	CONSTRAINT fk_action_plan_activity_field FOREIGN KEY ( activity_field_id ) REFERENCES activity_field( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_action_plan_activity_field_section FOREIGN KEY ( detail_activity_plan_id ) REFERENCES activity_field_section( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_action_plan_detail_activity_plan FOREIGN KEY ( detail_activity_plan_id ) REFERENCES detail_activity_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_action_plan_activity_field ON action_plan ( activity_field_id );

CREATE INDEX fk_action_plan_detail_activity_plan ON action_plan ( detail_activity_plan_id );

CREATE TABLE action_plan_goal ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	action_plan_id       int  NOT NULL    ,
	education_goal_id    int  NOT NULL    ,
	deleted_at           date      ,
	CONSTRAINT fk_action_plan_goal_action_plan FOREIGN KEY ( action_plan_id ) REFERENCES action_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_action_plan_goal_education_goal FOREIGN KEY ( education_goal_id ) REFERENCES education_goal( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_action_plan_goal_action_plan ON action_plan_goal ( action_plan_id );

CREATE INDEX fk_action_plan_goal_education_goal ON action_plan_goal ( education_goal_id );

CREATE TABLE action_plan_talent_goal ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	action_plan_id       int  NOT NULL    ,
	talent_goal_id       int  NOT NULL    ,
	deleted_at           date      ,
	CONSTRAINT fk_action_plan_talent_goal_action_plan FOREIGN KEY ( action_plan_id ) REFERENCES action_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_action_plan_talent_goal_talent_goal FOREIGN KEY ( talent_goal_id ) REFERENCES talent_goal( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_action_plan_talent_goal_action_plan ON action_plan_talent_goal ( action_plan_id );

CREATE INDEX fk_action_plan_talent_goal_talent_goal ON action_plan_talent_goal ( talent_goal_id );

CREATE TABLE activity_attendance ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	member_id            int  NOT NULL    ,
	action_plan_id       int  NOT NULL    ,
	note                 varchar(600)      ,
	deleted_at           date      ,
	CONSTRAINT fk_activity_attendance_action_plan FOREIGN KEY ( action_plan_id ) REFERENCES action_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_activity_attendance_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_activity_attendance_action_plan ON activity_attendance ( action_plan_id );

CREATE INDEX fk_activity_attendance_member ON activity_attendance ( member_id );

CREATE TABLE activity_process ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	process_type_id      int  NOT NULL    ,
	action_plan_id       int  NOT NULL    ,
	duration             int      ,
	deleted_at           date      ,
	note                 varchar(600)      ,
	CONSTRAINT fk_activity_process_action_plan FOREIGN KEY ( action_plan_id ) REFERENCES action_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_activity_process_process_type FOREIGN KEY ( process_type_id ) REFERENCES process_type( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_activity_process_action_plan ON activity_process ( action_plan_id );

CREATE INDEX fk_activity_process_process_type ON activity_process ( process_type_id );

CREATE TABLE activity_process_detail ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	activity_process_id  int  NOT NULL    ,
	process              text      ,
	deleted_at           date      ,
	CONSTRAINT fk_activity_process_detail_activity_process FOREIGN KEY ( activity_process_id ) REFERENCES activity_process( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_activity_process_detail_activity_process ON activity_process_detail ( activity_process_id );

CREATE TABLE detail_activity_plan_goal ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	detail_activity_plan_id int  NOT NULL    ,
	education_goal_id    int  NOT NULL    ,
	CONSTRAINT fk_detail_activity_plan_goal_detail_activity_plan FOREIGN KEY ( detail_activity_plan_id ) REFERENCES detail_activity_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_detail_activity_plan_goal_education_goal FOREIGN KEY ( education_goal_id ) REFERENCES education_goal( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_detail_activity_plan_goal_detail_activity_plan ON detail_activity_plan_goal ( detail_activity_plan_id );

CREATE INDEX fk_detail_activity_plan_goal_education_goal ON detail_activity_plan_goal ( education_goal_id );

CREATE TABLE detail_activity_plan_talent_goal ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	detail_activity_plan_id int  NOT NULL    ,
	talent_goal_id       int  NOT NULL    ,
	CONSTRAINT fk_detail_activity_plan_talent_goal_detail_activity_plan FOREIGN KEY ( detail_activity_plan_id ) REFERENCES detail_activity_plan( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_detail_activity_plan_talent_goal_talent_goal FOREIGN KEY ( talent_goal_id ) REFERENCES talent_goal( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_detail_activity_plan_talent_goal_detail_activity_plan ON detail_activity_plan_talent_goal ( detail_activity_plan_id );

CREATE INDEX fk_detail_activity_plan_talent_goal_talent_goal ON detail_activity_plan_talent_goal ( talent_goal_id );

CREATE TABLE payment ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	`date`               date      ,
	deleted_at           date      ,
	note                 text      ,
	payment_draft_id     int  NOT NULL    ,
	CONSTRAINT fk_payment_payment_draft FOREIGN KEY ( payment_draft_id ) REFERENCES payment_draft( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX unq_payment_payment_draft_id ON payment ( payment_draft_id );

CREATE TABLE payment_detail ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	payment_id           int  NOT NULL    ,
	member_id            int  NOT NULL    ,
	deleted_at           date      ,
	payment_draft_detail_id int  NOT NULL    ,
	CONSTRAINT fk_payment_detail_payment FOREIGN KEY ( payment_id ) REFERENCES payment( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_payment_detail_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_payment_detail_payment_draft_detail FOREIGN KEY ( payment_draft_detail_id ) REFERENCES payment_draft_detail( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_payment_detail_member_activity ON payment_detail ( member_id );

CREATE INDEX fk_payment_detail_payment ON payment_detail ( payment_id );

CREATE INDEX fk_payment_detail_payment_draft_detail ON payment_detail ( payment_draft_detail_id );

CREATE TABLE member_card ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	payment_detail_id    int  NOT NULL    ,
	note                 varchar(600)      ,
	deleted_at           date      ,
	CONSTRAINT fk_member_card_payment_detail FOREIGN KEY ( payment_detail_id ) REFERENCES payment_detail( id ) ON DELETE RESTRICT ON UPDATE RESTRICT
 );

CREATE INDEX fk_member_card_payment_detail ON member_card ( payment_detail_id );

CREATE TABLE project_target ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)      ,
	other                boolean   DEFAULT false   ,
	deleted_at           date      
 );

CREATE TABLE project ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	title                varchar(255)      ,
	summary              text      ,
	target_name          varchar(255)      ,
	responsible_name     varchar(255)      ,
	responsible_contact  varchar(100)      ,
	responsible_mail     varchar(255)      ,
	project_target_id    int  NOT NULL    ,
	context              text      ,
	problematics         text      ,
	group_profit         text      ,
	others_profit        text      ,
	direct_benefactor    int      ,
	indirect_benefactor  int      ,
	scout_benefactor     int      ,
	non_scout_benefactor int      ,
	durability_plan      text      ,
	total_finances       decimal(10,0)      ,
	start_date           date      ,
	end_date             date      ,
	responsible_number   int      ,
	participants_number  int      ,
	other_participants_number int      ,
	deleted_at           date      
 );

CREATE INDEX fk_project_project_target ON project ( project_target_id );

ALTER TABLE project MODIFY summary text     COMMENT 'Fintina';

ALTER TABLE project MODIFY target_name varchar(255)     COMMENT 'Anaran''ny fileovana/fokonolona/fivondronana';

ALTER TABLE project MODIFY responsible_name varchar(255)     COMMENT 'Tompon''andraikitra voalohany';

ALTER TABLE project MODIFY project_target_id int  NOT NULL   COMMENT 'Toerana anatanterahana ny vadibainga';

ALTER TABLE project MODIFY context text     COMMENT 'Zava-misy';

ALTER TABLE project MODIFY problematics text     COMMENT 'Olana tokony ho vahana';

CREATE TABLE project_activity ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	project_id           int  NOT NULL    ,
	name                 varchar(255)      ,
	detail               text      ,
	deleted_at           date      
 );

CREATE INDEX fk_project_activity_project ON project_activity ( project_id );

CREATE TABLE project_goal ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(255)      ,
	project_id           int  NOT NULL    ,
	deleted_at           date      
 );

CREATE INDEX fk_project_goal_project ON project_goal ( project_id );

CREATE TABLE project_manager ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	project_id           int  NOT NULL    ,
	name                 varchar(255)      ,
	role                 varchar(255)      ,
	activity             varchar(255)      ,
	member_id            int      ,
	deleted_at           date      
 );

CREATE INDEX fk_project_manager_member ON project_manager ( member_id );

CREATE INDEX fk_project_manager_project ON project_manager ( project_id );

CREATE TABLE project_partner ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(255)      ,
	partnership_purpose  text      ,
	project_id           int  NOT NULL    ,
	deleted_at           date      
 );

CREATE INDEX fk_project_partner_project ON project_partner ( project_id );

CREATE TABLE project_result ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(255)      ,
	project_id           int  NOT NULL    ,
	deleted_at           date      
 );

CREATE INDEX fk_project_result_project ON project_result ( project_id );

CREATE TABLE project_tool ( 
	id                   int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	project_activity_id  int  NOT NULL    ,
	name                 varchar(255)      ,
	amount               decimal(10,0)      ,
	deleted_at           date      
 );

CREATE INDEX fk_project_tool_project_activity ON project_tool ( project_activity_id );

ALTER TABLE project ADD CONSTRAINT fk_project_project_target FOREIGN KEY ( project_target_id ) REFERENCES project_target( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE project_activity ADD CONSTRAINT fk_project_activity_project FOREIGN KEY ( project_id ) REFERENCES project( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE project_goal ADD CONSTRAINT fk_project_goal_project FOREIGN KEY ( project_id ) REFERENCES project( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE project_manager ADD CONSTRAINT fk_project_manager_project FOREIGN KEY ( project_id ) REFERENCES project( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE project_partner ADD CONSTRAINT fk_project_partner_project FOREIGN KEY ( project_id ) REFERENCES project( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE project_result ADD CONSTRAINT fk_project_result_project FOREIGN KEY ( project_id ) REFERENCES project( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE project_tool ADD CONSTRAINT fk_project_tool_project_activity FOREIGN KEY ( project_activity_id ) REFERENCES project_activity( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE project_user (
	id 					int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name 				varchar(255)	,
	mail 				varchar(255)	,
	phone_number 		varchar(255)	,
	password 			varchar(255)	,
	member_id 			int	,
	deleted_at 			date
);

 ALTER TABLE membership_fee ADD section_id int ;

 ALTER TABLE membership_fee ADD CONSTRAINT fk_membership_fee_section FOREIGN KEY ( section_id ) REFERENCES section( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

 ALTER TABLE payment_draft_detail ADD section_id int ;

 ALTER TABLE payment_draft_detail ADD CONSTRAINT fk_payment_draft_detail FOREIGN KEY ( section_id ) REFERENCES section( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

 ALTER TABLE payment_draft_detail ADD sacrement text ;

 ALTER TABLE payment_draft_detail ADD number_card varchar(250) ;

 ALTER TABLE payment_draft_detail ADD step varchar(250) ;

 ALTER TABLE payment_draft_detail DROP COLUMN training_two;

 ALTER TABLE payment_draft_detail DROP COLUMN training_three;

 ALTER TABLE payment_draft_detail DROP COLUMN training_four;

 ALTER TABLE payment_draft_detail DROP COLUMN training_five;

ALTER TABLE payment_draft_detail CHANGE training_one training text NULL ;

ALTER TABLE payment_draft_detail_activity_field ADD column deleted_at date;


CREATE INDEX fk_project_user_member ON project_user ( member_id );

ALTER TABLE project_user ADD CONSTRAINT fk_project_user_member FOREIGN KEY ( member_id ) REFERENCES member( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE project ADD COLUMN project_user_id INT;

CREATE INDEX fk_project_project_user ON project ( project_user_id );

ALTER TABLE project ADD CONSTRAINT fk_project_project_user FOREIGN KEY ( project_user_id ) REFERENCES project_user( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE detail_activity_plan_goal ADD column deleted_at date;

ALTER TABLE detail_activity_plan_talent_goal ADD column deleted_at date;

-- update script 20/09
create table member_transfer_request(
	id int PRIMARY KEY AUTO_INCREMENT,
	member_id int,
	activity_field_id int,
	activity_year_id int,
	member_role_id int,
	section_id int,
	`level` varchar(10),
	status int,
	note text,
	deleted_at date,
	FOREIGN KEY (member_id) REFERENCES member(id),
	FOREIGN KEY (section_id) REFERENCES section (id),
	FOREIGN KEY (member_role_id) REFERENCES member_role(id),
	FOREIGN KEY (activity_year_id) REFERENCES activity_year(id),
	FOREIGN KEY (activity_field_id) REFERENCES activity_field(id)
);

-- 26/09/2022 update
CREATE TABLE project_image (
	id 					int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name 				varchar(255)	,
	deleted_at 			date,
	project_id          int  NOT NULL
);

CREATE INDEX fk_project_image_project ON project_image ( project_id );

ALTER TABLE project_image ADD CONSTRAINT fk_project_image_project FOREIGN KEY ( project_id ) REFERENCES project( id ) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- end update

-- insertion
-- activity_year
insert into activity_year values(null, 2021,2022,null,null);
insert into activity_year values(null, 2020,2021,null,null);
insert into activity_year values(null, 2022,2023,null,null);
insert into activity_year values(null, 2019,2020,null,null);
insert into activity_year values(null, 2018,2019,null,null);
insert into activity_year values(null, 2017,2018,null,null);
insert into activity_year values(null, 2016,2017,null,null);

-- hierarchy
insert into hierarchy values (null,'Nationaly',null,null,'1');
insert into hierarchy values (null,'Diosezy',null,null,'2');
insert into hierarchy values (null,'Faritra',null,null,'3');
insert into hierarchy values (null,'Fivondronana',null,null,'4');

-- section
insert into section values (null, 'Lovitao', 'LVT', 'Mavo', 6, 10, 'Andia', 'Enina', 'Izay tratry ny aina no atao', 'Haza', 'Bleu ciel, bleu marine', 'Vato fihaonana', "St Francois d'Assise", 'Base LVT', 'Fanomezan-toky', null);
insert into section values (null, 'Mpianjoria', 'MPJ', 'Manga', 11, 15, 'Antoko', 'Sokajy', 'Antili MPJ na mora na mafy ny dia vonona fo MPJ', 'Anjoria', 'Kaki', 'Tafasiry', "St Georges Don Bosco", 'Base MPJ', 'Fanekena', null);
insert into section values (null, 'Mpamakilay', 'MPK', 'Maitso', 16, 18, 'Rodona', 'Tarika', "Dinan'ny MPK vonona mandrakizay", 'Vakilay', 'Kaki, bleu marine', 'Donkafo', "St Jean-Baptiste", 'Base MPK', 'Famehezan-tena', null);
insert into section values (null, 'Mpiandalana', 'MPD', 'Mena', 18, 25, 'Fileovana', 'Fokonolona', 'Andry iankinana vonona tsara MPD mifampizara', 'Vady bainga', 'Kaki, marron', 'Dinika', "Mpaminany Moizy", 'Base MPD', 'Velirano', null);

-- activity_field
insert into activity_field values(null,'I','Madagasikara',null,'Madagasikara',null,1,null);

insert into activity_field values(null,'II','Antananarivo',2,'Antananarivo','diosezy',3,null);
insert into activity_field values(null,'III','Toamasina',2,'Toamasina','diosezy',3,null);
insert into activity_field values(null,'IV','Moramanga',2,'Moramanga','diosezy',3,null);
insert into activity_field values(null,'V','Toliara',2,'Toliara','diosezy',3,null);
insert into activity_field values(null,'VI','Miarinarivo',2,'Miarinarivo','diosezy',3,null);
insert into activity_field values(null,'VII','Ihosy',2,'Ihosy','diosezy',3,null);
insert into activity_field values(null,'VIII','Mahajanga',2,'Mahajanga','diosezy',3,null);

insert into activity_field values(null,'IX','Analamanga',5,'Analamanga','faritra',2,null);
insert into activity_field values(null,'X','Atsimon-drano',5,'Atsimon-drano','faritra',2,null);
insert into activity_field values(null,'XI','Avaradrano',5,'Avaradrano','faritra',2,null);
insert into activity_field values(null,'XII','Toamasina I',6,'Toamasina I','faritra',2,null);
insert into activity_field values(null,'XIII','Toamasina II',6,'Toamasina II','faritra',2,null);
insert into activity_field values(null,'XIV','Toamasina III',6,'Toamasina III','faritra',2,null);

insert into activity_field values(null,'XV','St Michel',12,'Amparibe','Fianarana',1,null);
insert into activity_field values(null,'XVI','St Joseph',12,'Mahamasina','Fiangonana',1,null);
insert into activity_field values(null,'XVII','Providence',12,'Amparibe','Fianarana',1,null);
insert into activity_field values(null,'XVIII','EKAR Ambohimamory',13,'Ambohimamory','Fiangonana',1,null);
insert into activity_field values(null,'XIX','St Michel Itaosy',13,'Itaosy','Fianarana',1,null);
 
-- fee_type
insert into fee_type values(null,'cotisation',null,null,null);
insert into fee_type values(null,'fitsangatsanganana',null,null,18);

-- payment_type
insert into payment_type values(null,'MVola',null,null);
insert into payment_type values(null,'Espèce',null,null);
insert into payment_type values(null,'Orange Money',null,null);
insert into payment_type values(null,'Airtle Money',null,null);

insert into payment_draft values(null, 'payer 1','2022-06-12',)

-- member
insert into member values(null,'RANDRIA','Misaina','0346712345','2000-06-09','Hopital Befelatanana','Amparibe LOT 34 VX','Chapelle St Michel','2010-09-09','2010-12-12',null,null,'katolika',null);

-- project_target
insert into project_target values (null, 'Fokontany', 0, null);
insert into project_target values (null, 'Commune', 0, null);
insert into project_target values (null, 'Distrika', 0, null);
insert into project_target values (null, 'Faritra', 0, null);
insert into project_target values (null, 'Firenena', 0, null);
