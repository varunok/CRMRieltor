-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_arendator" ----------------------
CREATE TABLE `arendator_arendator` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`commission` VarChar( 10 ) NULL,
	`name` VarChar( 250 ) NOT NULL,
	`type_state_id` Int( 11 ) NULL,
	`type_client_id` Int( 11 ) NULL,
	`phone_first` Int( 11 ) NULL,
	`phone_second` Int( 11 ) NULL,
	`comment` LongText NULL,
	`email` VarChar( 254 ) NULL,
	`rooms_from` Int( 11 ) NULL,
	`rooms_to` Int( 11 ) NULL,
	`area_from` Int( 11 ) NULL,
	`area_to` Int( 11 ) NULL,
	`date_term` Date NULL,
	`floors_from` Int( 11 ) NULL,
	`floors_to` Int( 11 ) NULL,
	`price_from` Int( 11 ) NULL,
	`price_to` Int( 11 ) NULL,
	`number_of_persons_id` Int( 11 ) NULL,
	`type_stage_id` Int( 11 ) NULL,
	`call_date` Date NULL,
	`name_user_trash` VarChar( 100 ) NULL,
	`review_date` Date NULL,
	`time_trash` DateTime NULL,
	`trash` TinyInt( 1 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 29;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_arendator_district_obj" ---------
CREATE TABLE `arendator_arendator_district_obj` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`arendator_id` Int( 11 ) NOT NULL,
	`district_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `arendator_id` UNIQUE( `arendator_id`, `district_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_arendator_loyality" -------------
CREATE TABLE `arendator_arendator_loyality` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`arendator_id` Int( 11 ) NOT NULL,
	`userfullname_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `arendator_id` UNIQUE( `arendator_id`, `userfullname_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_arendator_repairs" --------------
CREATE TABLE `arendator_arendator_repairs` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`arendator_id` Int( 11 ) NOT NULL,
	`typerepairs_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `arendator_id` UNIQUE( `arendator_id`, `typerepairs_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_arendator_rieltor" --------------
CREATE TABLE `arendator_arendator_rieltor` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`arendator_id` Int( 11 ) NOT NULL,
	`userfullname_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `arendator_id` UNIQUE( `arendator_id`, `userfullname_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 15;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_arendator_room" -----------------
CREATE TABLE `arendator_arendator_room` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`arendator_id` Int( 11 ) NOT NULL,
	`typerooms_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `arendator_id` UNIQUE( `arendator_id`, `typerooms_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_arendator_type_building_data" ---
CREATE TABLE `arendator_arendator_type_building_data` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`arendator_id` Int( 11 ) NOT NULL,
	`typefacility_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `arendator_id` UNIQUE( `arendator_id`, `typefacility_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_typeclient" ---------------------
CREATE TABLE `arendator_typeclient` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`client` VarChar( 150 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_typestage" ----------------------
CREATE TABLE `arendator_typestage` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`stage` VarChar( 150 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "arendator_typestate" ----------------------
CREATE TABLE `arendator_typestate` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`state` VarChar( 150 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "auth_group" -------------------------------
CREATE TABLE `auth_group` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 80 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `name` UNIQUE( `name` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "auth_group_permissions" -------------------
CREATE TABLE `auth_group_permissions` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`group_id` Int( 11 ) NOT NULL,
	`permission_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `group_id` UNIQUE( `group_id`, `permission_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "auth_permission" --------------------------
CREATE TABLE `auth_permission` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) NOT NULL,
	`content_type_id` Int( 11 ) NOT NULL,
	`codename` VarChar( 100 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `content_type_id` UNIQUE( `content_type_id`, `codename` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 193;
-- ---------------------------------------------------------


-- CREATE TABLE "auth_user" --------------------------------
CREATE TABLE `auth_user` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`password` VarChar( 128 ) NOT NULL,
	`last_login` DateTime NULL,
	`is_superuser` TinyInt( 1 ) NOT NULL,
	`username` VarChar( 30 ) NOT NULL,
	`first_name` VarChar( 30 ) NOT NULL,
	`last_name` VarChar( 30 ) NOT NULL,
	`email` VarChar( 254 ) NOT NULL,
	`is_staff` TinyInt( 1 ) NOT NULL,
	`is_active` TinyInt( 1 ) NOT NULL,
	`date_joined` DateTime NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `username` UNIQUE( `username` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- CREATE TABLE "auth_user_groups" -------------------------
CREATE TABLE `auth_user_groups` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	`group_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `user_id` UNIQUE( `user_id`, `group_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "auth_user_user_permissions" ---------------
CREATE TABLE `auth_user_user_permissions` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	`permission_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `user_id` UNIQUE( `user_id`, `permission_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "buyer_buyer" ------------------------------
CREATE TABLE `buyer_buyer` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`commission` VarChar( 10 ) NULL,
	`name` VarChar( 250 ) NOT NULL,
	`phone_first` Int( 11 ) NULL,
	`phone_second` Int( 11 ) NULL,
	`comment` LongText NULL,
	`email` VarChar( 254 ) NULL,
	`rooms_from` Int( 11 ) NULL,
	`rooms_to` Int( 11 ) NULL,
	`floors_from` Int( 11 ) NULL,
	`floors_to` Int( 11 ) NULL,
	`area_from` Int( 11 ) NULL,
	`area_to` Int( 11 ) NULL,
	`price_from` Int( 11 ) NULL,
	`price_to` Int( 11 ) NULL,
	`date_term` Date NULL,
	`review_date` Date NULL,
	`call_date` Date NULL,
	`time_trash` DateTime NULL,
	`name_user_trash` VarChar( 100 ) NULL,
	`trash` TinyInt( 1 ) NOT NULL,
	`number_of_persons_id` Int( 11 ) NULL,
	`type_client_id` Int( 11 ) NULL,
	`type_stage_id` Int( 11 ) NULL,
	`type_state_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "buyer_buyer_district_obj" -----------------
CREATE TABLE `buyer_buyer_district_obj` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`buyer_id` Int( 11 ) NOT NULL,
	`district_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `buyer_id` UNIQUE( `buyer_id`, `district_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "buyer_buyer_loyality" ---------------------
CREATE TABLE `buyer_buyer_loyality` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`buyer_id` Int( 11 ) NOT NULL,
	`userfullname_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `buyer_id` UNIQUE( `buyer_id`, `userfullname_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "buyer_buyer_repairs" ----------------------
CREATE TABLE `buyer_buyer_repairs` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`buyer_id` Int( 11 ) NOT NULL,
	`typerepairs_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `buyer_id` UNIQUE( `buyer_id`, `typerepairs_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "buyer_buyer_rieltor" ----------------------
CREATE TABLE `buyer_buyer_rieltor` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`buyer_id` Int( 11 ) NOT NULL,
	`userfullname_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `buyer_id` UNIQUE( `buyer_id`, `userfullname_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "buyer_buyer_room" -------------------------
CREATE TABLE `buyer_buyer_room` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`buyer_id` Int( 11 ) NOT NULL,
	`typerooms_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `buyer_id` UNIQUE( `buyer_id`, `typerooms_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "buyer_buyer_type_building_data" -----------
CREATE TABLE `buyer_buyer_type_building_data` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`buyer_id` Int( 11 ) NOT NULL,
	`typefacility_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `buyer_id` UNIQUE( `buyer_id`, `typefacility_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "django_admin_log" -------------------------
CREATE TABLE `django_admin_log` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`action_time` DateTime NOT NULL,
	`object_id` LongText NULL,
	`object_repr` VarChar( 200 ) NOT NULL,
	`action_flag` Smallint( 5 ) UNSIGNED NOT NULL,
	`change_message` LongText NOT NULL,
	`content_type_id` Int( 11 ) NULL,
	`user_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 119;
-- ---------------------------------------------------------


-- CREATE TABLE "django_content_type" ----------------------
CREATE TABLE `django_content_type` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`app_label` VarChar( 100 ) NOT NULL,
	`model` VarChar( 100 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `django_content_type_app_label_3ec8c61c_uniq` UNIQUE( `app_label`, `model` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 67;
-- ---------------------------------------------------------


-- CREATE TABLE "django_migrations" ------------------------
CREATE TABLE `django_migrations` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`app` VarChar( 255 ) NOT NULL,
	`name` VarChar( 255 ) NOT NULL,
	`applied` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 116;
-- ---------------------------------------------------------


-- CREATE TABLE "django_session" ---------------------------
CREATE TABLE `django_session` ( 
	`session_key` VarChar( 40 ) NOT NULL,
	`session_data` LongText NOT NULL,
	`expire_date` DateTime NOT NULL,
	PRIMARY KEY ( `session_key` ) )
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "extuser_myuser" ---------------------------
CREATE TABLE `extuser_myuser` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`image` VarChar( 255 ) NOT NULL,
	`type_user_id` Int( 11 ) NULL,
	`user_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `user_id` UNIQUE( `user_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- CREATE TABLE "extuser_usersgroupextuser" ----------------
CREATE TABLE `extuser_usersgroupextuser` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_user` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_addressfacilitydata" -------------
CREATE TABLE `facility_addressfacilitydata` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`number_home` Int( 11 ) NULL,
	`number_apartment` VarChar( 10 ) NULL,
	`price_bay` Int( 11 ) NOT NULL,
	`price_month` Int( 11 ) NOT NULL,
	`landmark` VarChar( 500 ) NULL,
	`number_of_floors` Int( 11 ) NULL,
	`floors_up` Int( 11 ) NULL,
	`first_floor` TinyInt( 1 ) NOT NULL,
	`last_floor` TinyInt( 1 ) NOT NULL,
	`floor` Int( 11 ) NULL,
	`area_badroom` VarChar( 10 ) NULL,
	`area_kitchen` Int( 11 ) NULL,
	`area_living_room` VarChar( 10 ) NULL,
	`area_extra_room` VarChar( 10 ) NULL,
	`total_area` Int( 11 ) NULL,
	`payments` VarChar( 100 ) NULL,
	`rooms` Int( 11 ) NULL,
	`comment` LongText NULL,
	`commission` VarChar( 10 ) NULL,
	`images_count` Int( 11 ) NOT NULL,
	`title` VarChar( 250 ) NULL,
	`youtube` VarChar( 250 ) NULL,
	`panorama` VarChar( 250 ) NULL,
	`lot` Int( 11 ) NULL,
	`sleeps` Int( 11 ) NULL,
	`date_of_renovation` DateTime NOT NULL,
	`date_added` DateTime NOT NULL,
	`public` TinyInt( 1 ) NOT NULL,
	`actuality_id` Int( 11 ) NULL,
	`condition_id` Int( 11 ) NULL,
	`currency_id` Int( 11 ) NULL,
	`district_obj_id` VarChar( 50 ) NULL,
	`furniture_id` Int( 11 ) NULL,
	`heating_id` Int( 11 ) NULL,
	`lavatory_id` Int( 11 ) NULL,
	`prepayment_id` Int( 11 ) NULL,
	`repairs_id` VarChar( 50 ) NULL,
	`room_id` Int( 11 ) NULL,
	`street_obj_id` VarChar( 80 ) NULL,
	`subway_obj_id` VarChar( 50 ) NULL,
	`the_presence_of_hot_water_id` Int( 11 ) NULL,
	`type_building_data_id` VarChar( 50 ) NULL,
	`type_facilit_id` VarChar( 50 ) NULL,
	`windows_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 51;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_addressfacilitydata_equipment" ---
CREATE TABLE `facility_addressfacilitydata_equipment` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`addressfacilitydata_id` Int( 11 ) NOT NULL,
	`typeequipment_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `addressfacilitydata_id` UNIQUE( `addressfacilitydata_id`, `typeequipment_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_addressfacilitydata_list_operations" 
CREATE TABLE `facility_addressfacilitydata_list_operations` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`addressfacilitydata_id` Int( 11 ) NOT NULL,
	`typeoperations_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `addressfacilitydata_id` UNIQUE( `addressfacilitydata_id`, `typeoperations_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 53;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_addressfacilitydata_loyality" ----
CREATE TABLE `facility_addressfacilitydata_loyality` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`addressfacilitydata_id` Int( 11 ) NOT NULL,
	`userfullname_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `addressfacilitydata_id` UNIQUE( `addressfacilitydata_id`, `userfullname_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_addressfacilitydata_number_of_persons" 
CREATE TABLE `facility_addressfacilitydata_number_of_persons` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`addressfacilitydata_id` Int( 11 ) NOT NULL,
	`typenumberofperson_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `addressfacilitydata_id` UNIQUE( `addressfacilitydata_id`, `typenumberofperson_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_addressfacilitydata_rieltor" -----
CREATE TABLE `facility_addressfacilitydata_rieltor` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`addressfacilitydata_id` Int( 11 ) NOT NULL,
	`userfullname_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `addressfacilitydata_id` UNIQUE( `addressfacilitydata_id`, `userfullname_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_addressfacilitydata_where_to_stay" 
CREATE TABLE `facility_addressfacilitydata_where_to_stay` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`addressfacilitydata_id` Int( 11 ) NOT NULL,
	`typewheretostay_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `addressfacilitydata_id` UNIQUE( `addressfacilitydata_id`, `typewheretostay_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_contactowner" --------------------
CREATE TABLE `facility_contactowner` ( 
	`addressfacilitydata_ptr_id` Int( 11 ) NOT NULL,
	`agency` VarChar( 250 ) NOT NULL,
	`name_owner` VarChar( 250 ) NOT NULL,
	`review_date` Date NULL,
	`review_time` Time NULL,
	`call_date` Date NULL,
	`call_time` Time NULL,
	`email_owner` VarChar( 150 ) NULL,
	`vip_owner` TinyInt( 1 ) NOT NULL,
	`phone_owner` VarChar( 16 ) NULL,
	`phone_owner_plus` VarChar( 16 ) NULL,
	`trash` TinyInt( 1 ) NOT NULL,
	`time_trash` DateTime NULL,
	`name_user_trash` VarChar( 100 ) NULL,
	`contact_owner_id` Int( 11 ) NULL,
	PRIMARY KEY ( `addressfacilitydata_ptr_id` ) )
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_databasephoneowner" --------------
CREATE TABLE `facility_databasephoneowner` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`db_id_owner` VarChar( 16 ) NULL,
	`db_phone_owner` VarChar( 16 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 103;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_imagesfacility" ------------------
CREATE TABLE `facility_imagesfacility` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`image` VarChar( 100 ) NOT NULL,
	`cover` TinyInt( 1 ) NOT NULL,
	`album_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 95;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_phoneowner" ----------------------
CREATE TABLE `facility_phoneowner` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`phone_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 51;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typeactuality" -------------------
CREATE TABLE `facility_typeactuality` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_actuality` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_actuality` UNIQUE( `type_actuality` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typebuilding" --------------------
CREATE TABLE `facility_typebuilding` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_building` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_building` UNIQUE( `type_building` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 10;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typecondition" -------------------
CREATE TABLE `facility_typecondition` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_condition` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_condition` UNIQUE( `type_condition` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typecontactowner" ----------------
CREATE TABLE `facility_typecontactowner` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_contact_owner` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_contact_owner` UNIQUE( `type_contact_owner` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typeequipment" -------------------
CREATE TABLE `facility_typeequipment` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_equipment` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_equipment` UNIQUE( `type_equipment` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typefacility" --------------------
CREATE TABLE `facility_typefacility` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_facility` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_facility` UNIQUE( `type_facility` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typefurniture" -------------------
CREATE TABLE `facility_typefurniture` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_furniture` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_furniture` UNIQUE( `type_furniture` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typeheating" ---------------------
CREATE TABLE `facility_typeheating` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_heating` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_heating` UNIQUE( `type_heating` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typelavatory" --------------------
CREATE TABLE `facility_typelavatory` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_lavatory` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_lavatory` UNIQUE( `type_lavatory` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typenumberofperson" --------------
CREATE TABLE `facility_typenumberofperson` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_number_of_persons` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_number_of_persons` UNIQUE( `type_number_of_persons` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typeoperations" ------------------
CREATE TABLE `facility_typeoperations` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_operations` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_operations` UNIQUE( `type_operations` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typeprepayment" ------------------
CREATE TABLE `facility_typeprepayment` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_prepayment` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_prepayment` UNIQUE( `type_prepayment` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 8;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typerepairs" ---------------------
CREATE TABLE `facility_typerepairs` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_repairs` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_repairs` UNIQUE( `type_repairs` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typerooms" -----------------------
CREATE TABLE `facility_typerooms` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_rooms` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_rooms` UNIQUE( `type_rooms` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typethepresenceofhotwater" -------
CREATE TABLE `facility_typethepresenceofhotwater` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_the_presence_of_hot_water` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_the_presence_of_hot_water` UNIQUE( `type_the_presence_of_hot_water` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typewheretostay" -----------------
CREATE TABLE `facility_typewheretostay` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_where_to_stay` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_where_to_stay` UNIQUE( `type_where_to_stay` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "facility_typewindows" ---------------------
CREATE TABLE `facility_typewindows` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_windows` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_windows` UNIQUE( `type_windows` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "makler_makler" ----------------------------
CREATE TABLE `makler_makler` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 30 ) NULL,
	`agency` VarChar( 30 ) NULL,
	`white_black_id` Int( 11 ) NOT NULL,
	`phone` Int( 11 ) NULL,
	`site` VarChar( 200 ) NULL,
	`email` VarChar( 254 ) NULL,
	`cooperation_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 25;
-- ---------------------------------------------------------


-- CREATE TABLE "makler_typecooperations" ------------------
CREATE TABLE `makler_typecooperations` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_cooperation` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "makler_typewhiteblack" --------------------
CREATE TABLE `makler_typewhiteblack` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_white_black` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "notes_notes" ------------------------------
CREATE TABLE `notes_notes` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`text` LongText NOT NULL,
	`name` VarChar( 50 ) NOT NULL,
	`date` DateTime NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- ---------------------------------------------------------


-- CREATE TABLE "send_messege_user_usermessage" ------------
CREATE TABLE `send_messege_user_usermessage` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`message` LongText NOT NULL,
	`time_message` DateTime NOT NULL,
	`read` TinyInt( 1 ) NOT NULL,
	`from_user_id` Int( 11 ) NOT NULL,
	`user_message_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 48;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_globall_franshise" ----------------
CREATE TABLE `setting_globall_franshise` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`franshise` VarChar( 100 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_globall_franshisesity" ------------
CREATE TABLE `setting_globall_franshisesity` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`sity` VarChar( 100 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_globall_listnationalcarrency" -----
CREATE TABLE `setting_globall_listnationalcarrency` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`currency_glob` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_globall_nationalcarrency" ---------
CREATE TABLE `setting_globall_nationalcarrency` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`currency` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_street_district" ------------------
CREATE TABLE `setting_street_district` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`district` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `district` UNIQUE( `district` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_street_street" --------------------
CREATE TABLE `setting_street_street` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`street` VarChar( 50 ) NOT NULL,
	`full_street` VarChar( 80 ) NULL,
	`type_street_group_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `full_street` UNIQUE( `full_street` ),
	CONSTRAINT `street` UNIQUE( `street` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_street_subway" --------------------
CREATE TABLE `setting_street_subway` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`subway` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `subway` UNIQUE( `subway` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_street_typesstreet" ---------------
CREATE TABLE `setting_street_typesstreet` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_street` VarChar( 30 ) NOT NULL,
	`short_name` VarChar( 30 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 12;
-- ---------------------------------------------------------


-- CREATE TABLE "setting_superadmin_alltocall" -------------
CREATE TABLE `setting_superadmin_alltocall` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`phone` Int( 11 ) NULL,
	`email` VarChar( 254 ) NULL,
	`skype` VarChar( 100 ) NULL,
	`group_vk` VarChar( 200 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "single_object_showsarendator" -------------
CREATE TABLE `single_object_showsarendator` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`array_arendator_id` Int( 11 ) NULL,
	`type_shows_arendator_id` Int( 11 ) NULL,
	`array_cont_ower_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 18;
-- ---------------------------------------------------------


-- CREATE TABLE "single_object_showsbuyer" -----------------
CREATE TABLE `single_object_showsbuyer` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`array_buyer_id` Int( 11 ) NULL,
	`array_cont_ower_id` Int( 11 ) NULL,
	`type_shows_buyer_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "single_object_singleobjcomments" ----------
CREATE TABLE `single_object_singleobjcomments` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`comment` LongText NOT NULL,
	`date_comment` DateTime NOT NULL,
	`author_comment` VarChar( 100 ) NOT NULL,
	`image` VarChar( 100 ) NOT NULL,
	`obj_comments_id` Int( 11 ) NOT NULL,
	`type_tabs` VarChar( 20 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 68;
-- ---------------------------------------------------------


-- CREATE TABLE "single_object_tie" ------------------------
CREATE TABLE `single_object_tie` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`tie_cont_owner_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `tie_cont_owner_id` UNIQUE( `tie_cont_owner_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "single_object_tie_tie_arenda" -------------
CREATE TABLE `single_object_tie_tie_arenda` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`tie_id` Int( 11 ) NOT NULL,
	`arendator_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `tie_id` UNIQUE( `tie_id`, `arendator_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1752;
-- ---------------------------------------------------------


-- CREATE TABLE "single_object_tiebuyer" -------------------
CREATE TABLE `single_object_tiebuyer` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`tie_cont_owner_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `tie_cont_owner_id` UNIQUE( `tie_cont_owner_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "single_object_tiebuyer_tie_buye" ----------
CREATE TABLE `single_object_tiebuyer_tie_buye` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`tiebuyer_id` Int( 11 ) NOT NULL,
	`buyer_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `tiebuyer_id` UNIQUE( `tiebuyer_id`, `buyer_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "single_object_typeshows" ------------------
CREATE TABLE `single_object_typeshows` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`type_shows` VarChar( 50 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `type_shows` UNIQUE( `type_shows` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- Dump data of "arendator_arendator" ----------------------
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '1', NULL, '', NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Андрій Варунок', '2016-07-28', '2016-07-28 02:25:59.152013', '1' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '2', NULL, '', NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2014-07-09', NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-08', NULL, '2016-07-26', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '3', NULL, '', NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-08', NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-24', NULL, '2016-07-26', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '6', '23232', 'fefef', '3', NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Андрій Варунок', '2016-07-28', '2016-07-28 02:39:29.364910', '1' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '7', '432', 'DFCZ', '2', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '8', '233', 'dsadsdfsdfssdsf', '2', '3', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '9', '122', 'wqeqwewwqe', '2', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '10', '34', 'werwer', '4', '3', '1', '1', 'fbfgfgbgfggsfgbfgb', 'dfdfdfdf@fsdfdsf.sdfdf', NULL, NULL, NULL, NULL, '2016-07-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '11', '', '', NULL, NULL, '1', '1', '', '', '2', NULL, NULL, NULL, '2016-07-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '12', '567', 'fgdfgdfgdg', '4', '2', '1', '1', 'hujfjfjf', 'efsf@sfsef.rgdr', '1', '2', '6', '7', '2016-07-27', '4', '5', '8', '9', NULL, NULL, NULL, 'Андрій Варунок', '2016-07-28', '2016-07-28 02:44:45.844056', '1' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '13', '677', 'Вася', '1', '2', '1', '1', 'erwerwerwerweresrewrwerwerwer werwerwerwerwerwerwer werwerwerwerwerwer werwerwerwerwer werwerwrwerwe werwerwerwerwe werwerwerwerwe werwerwerwerwer werwerwerwer werwerwerwer werwerwerwer werwer wewe', 'sdsd@dfd.ghg', '1', '2', '5', '6', '2016-07-31', '3', '4', '7', '8', '1', '1', NULL, NULL, NULL, NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '14', '433', 'sadsadasd', '2', '2', '1', '1', 'dgdfgdfgdfgdfg rdrdrfrdfgrd rtrtrdtr', 'fds@dfdf.hjhj', '1', '2', '5', '6', '2016-07-31', '3', '4', '7', '8', '5', '4', '2016-07-24', NULL, '2016-07-26', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '15', '', '', NULL, NULL, '1', '1', '', '', NULL, NULL, NULL, NULL, '2016-07-31', NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-29', NULL, '2016-07-26', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '16', '', '', NULL, NULL, '1', '1', '', '', NULL, NULL, NULL, NULL, '2016-07-07', NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-14', NULL, '2016-07-26', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '17', '', '', NULL, NULL, '1', '1', '', '', NULL, NULL, NULL, NULL, '2016-07-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-26', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '18', '', '', NULL, NULL, '1', '1', '', '', NULL, NULL, NULL, NULL, '2016-07-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-26', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '19', '', '', NULL, NULL, '1', '1', '', '', NULL, NULL, NULL, NULL, '2016-07-28', NULL, NULL, '23', '67', NULL, NULL, NULL, NULL, '2016-07-27', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '20', '', '', NULL, NULL, '1', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-27', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '21', '', '', NULL, NULL, '23', '24', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-27', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '22', '', '', NULL, NULL, '2323', '2323', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-03', NULL, '2016-07-31', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '23', '', '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-28', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '24', '', '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', NULL, NULL, '2016-07-28', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '25', '', '', NULL, NULL, NULL, NULL, '', 'ddd@rrr.ttt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-28', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '26', '', 'Вася', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-30', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '27', '350', 'SNOW', '1', '2', '123123123', '234234234', 'sdfsdfsf sdfdsfdsfd sdfdsfd sdfsdfd dfdsfdsf dfdsf dsf dfsdfsdf', 'sdf@sdf.sdf', '1', '3', '45', '50', '2016-08-07', '1', '10', '300', '700', '2', '1', '2016-08-01', NULL, '2016-08-01', NULL, '0' );
INSERT INTO `arendator_arendator`(`id`,`commission`,`name`,`type_state_id`,`type_client_id`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`area_from`,`area_to`,`date_term`,`floors_from`,`floors_to`,`price_from`,`price_to`,`number_of_persons_id`,`type_stage_id`,`call_date`,`name_user_trash`,`review_date`,`time_trash`,`trash`) VALUES ( '28', '', '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-01', NULL, '0' );
-- ---------------------------------------------------------


-- Dump data of "arendator_arendator_district_obj" ---------
INSERT INTO `arendator_arendator_district_obj`(`id`,`arendator_id`,`district_id`) VALUES ( '1', '12', '1' );
INSERT INTO `arendator_arendator_district_obj`(`id`,`arendator_id`,`district_id`) VALUES ( '2', '13', '1' );
INSERT INTO `arendator_arendator_district_obj`(`id`,`arendator_id`,`district_id`) VALUES ( '3', '14', '1' );
INSERT INTO `arendator_arendator_district_obj`(`id`,`arendator_id`,`district_id`) VALUES ( '4', '20', '2' );
INSERT INTO `arendator_arendator_district_obj`(`id`,`arendator_id`,`district_id`) VALUES ( '5', '27', '1' );
-- ---------------------------------------------------------


-- Dump data of "arendator_arendator_loyality" -------------
INSERT INTO `arendator_arendator_loyality`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '1', '17', '1' );
INSERT INTO `arendator_arendator_loyality`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '2', '18', '2' );
-- ---------------------------------------------------------


-- Dump data of "arendator_arendator_repairs" --------------
INSERT INTO `arendator_arendator_repairs`(`id`,`arendator_id`,`typerepairs_id`) VALUES ( '1', '12', '2' );
INSERT INTO `arendator_arendator_repairs`(`id`,`arendator_id`,`typerepairs_id`) VALUES ( '2', '13', '2' );
INSERT INTO `arendator_arendator_repairs`(`id`,`arendator_id`,`typerepairs_id`) VALUES ( '3', '14', '2' );
INSERT INTO `arendator_arendator_repairs`(`id`,`arendator_id`,`typerepairs_id`) VALUES ( '4', '27', '2' );
INSERT INTO `arendator_arendator_repairs`(`id`,`arendator_id`,`typerepairs_id`) VALUES ( '5', '28', '1' );
INSERT INTO `arendator_arendator_repairs`(`id`,`arendator_id`,`typerepairs_id`) VALUES ( '6', '28', '2' );
-- ---------------------------------------------------------


-- Dump data of "arendator_arendator_rieltor" --------------
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '1', '1', '3' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '2', '2', '3' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '3', '3', '2' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '6', '6', '2' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '7', '7', '2' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '8', '8', '2' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '9', '9', '2' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '10', '10', '2' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '11', '12', '2' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '12', '13', '1' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '13', '14', '1' );
INSERT INTO `arendator_arendator_rieltor`(`id`,`arendator_id`,`userfullname_id`) VALUES ( '14', '27', '1' );
-- ---------------------------------------------------------


-- Dump data of "arendator_arendator_room" -----------------
INSERT INTO `arendator_arendator_room`(`id`,`arendator_id`,`typerooms_id`) VALUES ( '1', '12', '1' );
INSERT INTO `arendator_arendator_room`(`id`,`arendator_id`,`typerooms_id`) VALUES ( '2', '13', '3' );
INSERT INTO `arendator_arendator_room`(`id`,`arendator_id`,`typerooms_id`) VALUES ( '3', '14', '1' );
INSERT INTO `arendator_arendator_room`(`id`,`arendator_id`,`typerooms_id`) VALUES ( '4', '23', '3' );
INSERT INTO `arendator_arendator_room`(`id`,`arendator_id`,`typerooms_id`) VALUES ( '5', '27', '1' );
-- ---------------------------------------------------------


-- Dump data of "arendator_arendator_type_building_data" ---
INSERT INTO `arendator_arendator_type_building_data`(`id`,`arendator_id`,`typefacility_id`) VALUES ( '1', '12', '1' );
INSERT INTO `arendator_arendator_type_building_data`(`id`,`arendator_id`,`typefacility_id`) VALUES ( '2', '13', '1' );
INSERT INTO `arendator_arendator_type_building_data`(`id`,`arendator_id`,`typefacility_id`) VALUES ( '3', '13', '2' );
INSERT INTO `arendator_arendator_type_building_data`(`id`,`arendator_id`,`typefacility_id`) VALUES ( '4', '14', '1' );
INSERT INTO `arendator_arendator_type_building_data`(`id`,`arendator_id`,`typefacility_id`) VALUES ( '5', '22', '4' );
INSERT INTO `arendator_arendator_type_building_data`(`id`,`arendator_id`,`typefacility_id`) VALUES ( '6', '27', '2' );
-- ---------------------------------------------------------


-- Dump data of "arendator_typeclient" ---------------------
INSERT INTO `arendator_typeclient`(`id`,`client`) VALUES ( '1', 'Постоянный' );
INSERT INTO `arendator_typeclient`(`id`,`client`) VALUES ( '2', 'Средний' );
INSERT INTO `arendator_typeclient`(`id`,`client`) VALUES ( '3', 'Разовый' );
-- ---------------------------------------------------------


-- Dump data of "arendator_typestage" ----------------------
INSERT INTO `arendator_typestage`(`id`,`stage`) VALUES ( '1', 'Подбор объектов' );
INSERT INTO `arendator_typestage`(`id`,`stage`) VALUES ( '2', 'Показы' );
INSERT INTO `arendator_typestage`(`id`,`stage`) VALUES ( '3', 'Ждем нового' );
INSERT INTO `arendator_typestage`(`id`,`stage`) VALUES ( '4', 'Завершение сделки' );
-- ---------------------------------------------------------


-- Dump data of "arendator_typestate" ----------------------
INSERT INTO `arendator_typestate`(`id`,`state`) VALUES ( '1', 'Горячий' );
INSERT INTO `arendator_typestate`(`id`,`state`) VALUES ( '2', 'Активний' );
INSERT INTO `arendator_typestate`(`id`,`state`) VALUES ( '3', 'Нужно узнать' );
INSERT INTO `arendator_typestate`(`id`,`state`) VALUES ( '4', 'Уже нашли' );
-- ---------------------------------------------------------


-- Dump data of "auth_group" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_group_permissions" -------------------
-- ---------------------------------------------------------


-- Dump data of "auth_permission" --------------------------
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '1', 'Can add log entry', '1', 'add_logentry' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '2', 'Can change log entry', '1', 'change_logentry' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '3', 'Can delete log entry', '1', 'delete_logentry' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '4', 'Can add permission', '2', 'add_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '5', 'Can change permission', '2', 'change_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '6', 'Can delete permission', '2', 'delete_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '7', 'Can add group', '3', 'add_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '8', 'Can change group', '3', 'change_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '9', 'Can delete group', '3', 'delete_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '10', 'Can add user', '4', 'add_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '11', 'Can change user', '4', 'change_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '12', 'Can delete user', '4', 'delete_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '13', 'Can add content type', '5', 'add_contenttype' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '14', 'Can change content type', '5', 'change_contenttype' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '15', 'Can delete content type', '5', 'delete_contenttype' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '16', 'Can add session', '6', 'add_session' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '17', 'Can change session', '6', 'change_session' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '18', 'Can delete session', '6', 'delete_session' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '19', 'Can add Нотатка', '7', 'add_notes' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '20', 'Can change Нотатка', '7', 'change_notes' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '21', 'Can delete Нотатка', '7', 'delete_notes' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '22', 'Can add Тип улицы', '8', 'add_typesstreet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '23', 'Can change Тип улицы', '8', 'change_typesstreet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '24', 'Can delete Тип улицы', '8', 'delete_typesstreet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '25', 'Can add Улица', '9', 'add_street' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '26', 'Can change Улица', '9', 'change_street' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '27', 'Can delete Улица', '9', 'delete_street' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '28', 'Can add Район', '10', 'add_district' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '29', 'Can change Район', '10', 'change_district' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '30', 'Can delete Район', '10', 'delete_district' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '31', 'Can add Метро', '11', 'add_subway' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '32', 'Can change Метро', '11', 'change_subway' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '33', 'Can delete Метро', '11', 'delete_subway' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '34', 'Can add my user', '12', 'add_myuser' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '35', 'Can change my user', '12', 'change_myuser' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '36', 'Can delete my user', '12', 'delete_myuser' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '37', 'Can add Тип пользователя', '13', 'add_usersgroupextuser' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '38', 'Can change Тип пользователя', '13', 'change_usersgroupextuser' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '39', 'Can delete Тип пользователя', '13', 'delete_usersgroupextuser' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '40', 'Can add user full name', '4', 'add_userfullname' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '41', 'Can change user full name', '4', 'change_userfullname' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '42', 'Can delete user full name', '4', 'delete_userfullname' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '43', 'Can add Фото обекта', '14', 'add_imagesfacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '44', 'Can change Фото обекта', '14', 'change_imagesfacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '45', 'Can delete Фото обекта', '14', 'delete_imagesfacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '46', 'Can add Тип обекта', '15', 'add_typefacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '47', 'Can change Тип обекта', '15', 'change_typefacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '48', 'Can delete Тип обекта', '15', 'delete_typefacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '49', 'Can add Тип операции', '16', 'add_typeoperations' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '50', 'Can change Тип операции', '16', 'change_typeoperations' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '51', 'Can delete Тип операции', '16', 'delete_typeoperations' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '52', 'Can add Тип контакта владельца', '17', 'add_typecontactowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '53', 'Can change Тип контакта владельца', '17', 'change_typecontactowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '54', 'Can delete Тип контакта владельца', '17', 'delete_typecontactowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '55', 'Can add Тип строения', '18', 'add_typebuilding' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '56', 'Can change Тип строения', '18', 'change_typebuilding' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '57', 'Can delete Тип строения', '18', 'delete_typebuilding' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '58', 'Can add Тип ремонта', '19', 'add_typerepairs' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '59', 'Can change Тип ремонта', '19', 'change_typerepairs' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '60', 'Can delete Тип ремонта', '19', 'delete_typerepairs' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '61', 'Can add Тип актуальности', '20', 'add_typeactuality' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '62', 'Can change Тип актуальности', '20', 'change_typeactuality' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '63', 'Can delete Тип актуальности', '20', 'delete_typeactuality' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '64', 'Can add Тип состояния', '21', 'add_typecondition' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '65', 'Can change Тип состояния', '21', 'change_typecondition' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '66', 'Can delete Тип состояния', '21', 'delete_typecondition' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '67', 'Can add Адресс обекта', '22', 'add_addressfacilitydata' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '68', 'Can change Адресс обекта', '22', 'change_addressfacilitydata' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '69', 'Can delete Адресс обекта', '22', 'delete_addressfacilitydata' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '70', 'Can add Контакты владельца', '23', 'add_contactowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '71', 'Can change Контакты владельца', '23', 'change_contactowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '72', 'Can delete Контакты владельца', '23', 'delete_contactowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '73', 'Can add Телефони владельца', '24', 'add_phoneowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '74', 'Can change Телефони владельца', '24', 'change_phoneowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '75', 'Can delete Телефони владельца', '24', 'delete_phoneowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '76', 'Can add Телефони владельца', '25', 'add_databasephoneowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '77', 'Can change Телефони владельца', '25', 'change_databasephoneowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '78', 'Can delete Телефони владельца', '25', 'delete_databasephoneowner' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '79', 'Can add Тип национальной валюты', '27', 'add_nationalcarrency' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '80', 'Can change Тип национальной валюты', '27', 'change_nationalcarrency' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '81', 'Can delete Тип национальной валюты', '27', 'delete_nationalcarrency' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '82', 'Can add Тип Окна', '27', 'add_typewindows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '83', 'Can change Тип Окна', '27', 'change_typewindows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '84', 'Can delete Тип Окна', '27', 'delete_typewindows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '85', 'Can add Фото обекта', '29', 'add_imagesfacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '86', 'Can change Фото обекта', '29', 'change_imagesfacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '87', 'Can delete Фото обекта', '29', 'delete_imagesfacility' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '88', 'Can add Тип количество человек', '30', 'add_typenumberofperson' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '89', 'Can change Тип количество человек', '30', 'change_typenumberofperson' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '90', 'Can delete Тип количество человек', '30', 'delete_typenumberofperson' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '91', 'Can add Тип техники', '31', 'add_typeequipment' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '92', 'Can change Тип техники', '31', 'change_typeequipment' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '93', 'Can delete Тип техники', '31', 'delete_typeequipment' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '94', 'Can add Тип Где спать?', '32', 'add_typewheretostay' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '95', 'Can change Тип Где спать?', '32', 'change_typewheretostay' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '96', 'Can delete Тип Где спать?', '32', 'delete_typewheretostay' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '97', 'Can add Тип Наличие горячей воды', '33', 'add_typethepresenceofhotwater' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '98', 'Can change Тип Наличие горячей воды', '33', 'change_typethepresenceofhotwater' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '99', 'Can delete Тип Наличие горячей воды', '33', 'delete_typethepresenceofhotwater' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '100', 'Can add Тип Предоплаты', '34', 'add_typeprepayment' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '101', 'Can change Тип Предоплаты', '34', 'change_typeprepayment' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '102', 'Can delete Тип Предоплаты', '34', 'delete_typeprepayment' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '103', 'Can add Тип Окна', '35', 'add_typewindows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '104', 'Can change Тип Окна', '35', 'change_typewindows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '105', 'Can delete Тип Окна', '35', 'delete_typewindows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '106', 'Can add Тип Отопления', '36', 'add_typeheating' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '107', 'Can change Тип Отопления', '36', 'change_typeheating' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '108', 'Can delete Тип Отопления', '36', 'delete_typeheating' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '109', 'Can add Тип Санузла', '37', 'add_typelavatory' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '110', 'Can change Тип Санузла', '37', 'change_typelavatory' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '111', 'Can delete Тип Санузла', '37', 'delete_typelavatory' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '112', 'Can add Тип Мебели', '38', 'add_typefurniture' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '113', 'Can change Тип Мебели', '38', 'change_typefurniture' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '114', 'Can delete Тип Мебели', '38', 'delete_typefurniture' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '115', 'Can add Список национальной валюты', '39', 'add_listnationalcarrency' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '116', 'Can change Список национальной валюты', '39', 'change_listnationalcarrency' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '117', 'Can delete Список национальной валюты', '39', 'delete_listnationalcarrency' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '118', 'Can add Тип Комнаты', '40', 'add_typerooms' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '119', 'Can change Тип Комнаты', '40', 'change_typerooms' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '120', 'Can delete Тип Комнаты', '40', 'delete_typerooms' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '124', 'Can add Сообщение пользователя', '42', 'add_usermessage' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '125', 'Can change Сообщение пользователя', '42', 'change_usermessage' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '126', 'Can delete Сообщение пользователя', '42', 'delete_usermessage' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '127', 'Can add Арендатор', '43', 'add_arendator' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '128', 'Can change Арендатор', '43', 'change_arendator' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '129', 'Can delete Арендатор', '43', 'delete_arendator' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '130', 'Can add Тип состояния', '45', 'add_typestate' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '131', 'Can change Тип состояния', '45', 'change_typestate' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '132', 'Can delete Тип состояния', '45', 'delete_typestate' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '133', 'Can add Тип клиента', '46', 'add_typeclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '134', 'Can change Тип клиента', '46', 'change_typeclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '135', 'Can delete Тип клиента', '46', 'delete_typeclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '136', 'Can add Тип Этапа', '47', 'add_typestage' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '137', 'Can change Тип Этапа', '47', 'change_typestage' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '138', 'Can delete Тип Этапа', '47', 'delete_typestage' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '148', 'Can add Коментарий обекта', '51', 'add_singleobjcomments' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '149', 'Can change Коментарий обекта', '51', 'change_singleobjcomments' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '150', 'Can delete Коментарий обекта', '51', 'delete_singleobjcomments' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '154', 'Can add Тип показа', '53', 'add_typeshows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '155', 'Can change Тип показа', '53', 'change_typeshows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '156', 'Can delete Тип показа', '53', 'delete_typeshows' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '157', 'Can add Связка', '54', 'add_tie' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '158', 'Can change Связка', '54', 'change_tie' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '159', 'Can delete Связка', '54', 'delete_tie' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '163', 'Can add Показ арендаторам', '56', 'add_showsarendator' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '164', 'Can change Показ арендаторам', '56', 'change_showsarendator' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '165', 'Can delete Показ арендаторам', '56', 'delete_showsarendator' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '166', 'Can add Покупатель', '57', 'add_buyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '167', 'Can change Покупатель', '57', 'change_buyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '168', 'Can delete Покупатель', '57', 'delete_buyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '169', 'Can add Показ покупателю', '59', 'add_showsbuyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '170', 'Can change Показ покупателю', '59', 'change_showsbuyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '171', 'Can delete Показ покупателю', '59', 'delete_showsbuyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '172', 'Can add Связка с покупателем', '60', 'add_tiebuyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '173', 'Can change Связка с покупателем', '60', 'change_tiebuyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '174', 'Can delete Связка с покупателем', '60', 'delete_tiebuyer' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '175', 'Can add Тип сотрудничества', '61', 'add_typecooperations' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '176', 'Can change Тип сотрудничества', '61', 'change_typecooperations' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '177', 'Can delete Тип сотрудничества', '61', 'delete_typecooperations' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '178', 'Can add Маклер', '62', 'add_makler' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '179', 'Can change Маклер', '62', 'change_makler' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '180', 'Can delete Маклер', '62', 'delete_makler' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '181', 'Can add Тип маклера', '63', 'add_typewhiteblack' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '182', 'Can change Тип маклера', '63', 'change_typewhiteblack' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '183', 'Can delete Тип маклера', '63', 'delete_typewhiteblack' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '184', 'Can add Всегда на связи', '64', 'add_alltocall' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '185', 'Can change Всегда на связи', '64', 'change_alltocall' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '186', 'Can delete Всегда на связи', '64', 'delete_alltocall' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '187', 'Can add Город франшизи', '65', 'add_franshisesity' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '188', 'Can change Город франшизи', '65', 'change_franshisesity' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '189', 'Can delete Город франшизи', '65', 'delete_franshisesity' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '190', 'Can add Франшиза', '66', 'add_franshise' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '191', 'Can change Франшиза', '66', 'change_franshise' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '192', 'Can delete Франшиза', '66', 'delete_franshise' );
-- ---------------------------------------------------------


-- Dump data of "auth_user" --------------------------------
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '1', 'pbkdf2_sha256$20000$YVP3laAIineZ$T2wvDArOEI2jEN3sV14ZtycfNhLq1kNs9viMBFcUq9M=', '2016-08-05 05:34:44.000000', '1', 'varunok', 'Андрій', 'Варунок', 'varunok13@gmail.com', '1', '1', '2016-07-09 01:27:31.000000' );
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '2', 'pbkdf2_sha256$20000$Ub1vrYSd9fTx$NzHAvwcDHNdTu2buhOQBoAmxPEM13Tmcnlwa0Nsd92c=', '2016-08-04 22:10:56.000000', '0', 'test@test.test', 'test', 'test', 'test@test.test', '0', '1', '2016-07-09 16:35:31.000000' );
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '3', 'pbkdf2_sha256$20000$Qmzuno0oB1iQ$gHeBNwa/yvYesq2h5X+U9sOHhmjD2EiP7nMQfNCWIXU=', '2016-06-20 19:21:53.714434', '0', 'test2@test2.test2', 'test2', 'test2', 'test2@test2.test2', '0', '1', '2016-07-22 18:45:54.738161' );
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '4', 'pbkdf2_sha256$20000$QLhoPaIco6yy$L+v4064lGb61zjEZ/Z6AvQCe0el/uxe2wYs0d0LglLw=', '2016-07-21 19:21:53.714434', '0', 'test3@test3.test3', 'test3', 'test3', 'test3@test3.test3', '0', '1', '2016-07-22 19:21:53.714504' );
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '5', 'pbkdf2_sha256$20000$K83R6WjqQw1D$YNKLBc3WK0HqysBqBAqXaXQb+6mvsH0RLOCi4fEbanE=', '2016-08-04 22:00:36.513602', '0', 'test4@test4.test4', 'test4', 'test4', 'test4@test4.test4', '0', '1', '2016-08-04 22:00:36.513674' );
-- ---------------------------------------------------------


-- Dump data of "auth_user_groups" -------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_user_user_permissions" ---------------
-- ---------------------------------------------------------


-- Dump data of "buyer_buyer" ------------------------------
INSERT INTO `buyer_buyer`(`id`,`commission`,`name`,`phone_first`,`phone_second`,`comment`,`email`,`rooms_from`,`rooms_to`,`floors_from`,`floors_to`,`area_from`,`area_to`,`price_from`,`price_to`,`date_term`,`review_date`,`call_date`,`time_trash`,`name_user_trash`,`trash`,`number_of_persons_id`,`type_client_id`,`type_stage_id`,`type_state_id`) VALUES ( '2', '240', 'FAKA', '21321313', '1221313', 'dsfsddfsdffdfdfs dsfsd sd sdf sdfd f', 'fdggd@sdfdsf.sdfs', '1', '5', '1', '5', '23', '23', '3000', '7000', '2016-08-28', '2016-08-02', '2016-08-21', NULL, NULL, '0', '2', '1', '1', '1' );
-- ---------------------------------------------------------


-- Dump data of "buyer_buyer_district_obj" -----------------
INSERT INTO `buyer_buyer_district_obj`(`id`,`buyer_id`,`district_id`) VALUES ( '1', '2', '1' );
-- ---------------------------------------------------------


-- Dump data of "buyer_buyer_loyality" ---------------------
-- ---------------------------------------------------------


-- Dump data of "buyer_buyer_repairs" ----------------------
INSERT INTO `buyer_buyer_repairs`(`id`,`buyer_id`,`typerepairs_id`) VALUES ( '1', '2', '2' );
-- ---------------------------------------------------------


-- Dump data of "buyer_buyer_rieltor" ----------------------
INSERT INTO `buyer_buyer_rieltor`(`id`,`buyer_id`,`userfullname_id`) VALUES ( '2', '2', '1' );
-- ---------------------------------------------------------


-- Dump data of "buyer_buyer_room" -------------------------
INSERT INTO `buyer_buyer_room`(`id`,`buyer_id`,`typerooms_id`) VALUES ( '1', '2', '3' );
-- ---------------------------------------------------------


-- Dump data of "buyer_buyer_type_building_data" -----------
INSERT INTO `buyer_buyer_type_building_data`(`id`,`buyer_id`,`typefacility_id`) VALUES ( '1', '2', '2' );
-- ---------------------------------------------------------


-- Dump data of "django_admin_log" -------------------------
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '1', '2016-07-09 01:28:18.841704', '1', 'Активно сдаем', '1', '', '20', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '2', '2016-07-09 01:28:22.414549', '2', 'не интересно', '1', '', '20', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '3', '2016-07-09 01:28:25.499461', '3', 'Уточнить данные', '1', '', '20', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '4', '2016-07-09 01:28:35.164869', '1', 'Посредник', '1', '', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '5', '2016-07-09 01:28:38.791311', '2', 'Хозяин', '1', '', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '6', '2016-07-09 01:28:52.264903', '1', 'Комната', '1', '', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '7', '2016-07-09 01:28:56.398138', '2', 'Квартира', '1', '', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '8', '2016-07-09 01:28:59.589121', '3', 'Дом', '1', '', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '9', '2016-07-09 01:29:02.974798', '4', 'Участок', '1', '', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '10', '2016-07-09 01:29:13.700407', '1', 'Обмен', '1', '', '16', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '11', '2016-07-09 01:29:16.792284', '2', 'Аренда', '1', '', '16', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '12', '2016-07-09 01:29:20.229088', '3', 'Посуточна', '1', '', '16', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '13', '2016-07-09 01:29:23.462965', '4', 'Продажа', '1', '', '16', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '14', '2016-07-09 01:29:32.578883', '1', 'Евро', '1', '', '19', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '15', '2016-07-09 01:29:35.680254', '2', 'Жилое', '1', '', '19', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '16', '2016-07-09 01:29:38.963121', '3', 'Под ремонт', '1', '', '19', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '17', '2016-07-09 01:29:48.604685', '1', 'Занят арендатором', '1', '', '21', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '18', '2016-07-09 01:29:52.527070', '2', 'Ищем', '1', '', '21', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '19', '2016-07-09 01:29:55.583742', '3', 'не звонить', '1', '', '21', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '20', '2016-07-09 01:29:59.131551', '4', 'Нужно узнать', '1', '', '21', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '21', '2016-07-09 01:30:08.982315', '1', 'Сталинка', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '22', '2016-07-09 01:30:11.882501', '2', 'VIP- новострой', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '23', '2016-07-09 01:30:14.791133', '3', 'Гостинка', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '24', '2016-07-09 01:30:17.954441', '4', 'Малосемейка', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '25', '2016-07-09 01:30:21.089905', '5', 'Новострой', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '26', '2016-07-09 01:30:24.730003', '6', 'Панельный', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '27', '2016-07-09 01:30:29.794163', '7', 'Сотовая', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '28', '2016-07-09 01:30:33.363665', '8', 'Хрущевка', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '29', '2016-07-09 01:30:37.128790', '9', 'Чешка', '1', '', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '30', '2016-07-09 01:30:52.593754', '1', 'Админ', '1', '', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '31', '2016-07-09 01:30:55.765115', '2', 'Суперадмин', '1', '', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '32', '2016-07-09 01:30:58.842970', '3', 'Суперадмин', '1', '', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '33', '2016-07-09 01:32:19.094430', '3', 'Суперадмин', '3', '', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '34', '2016-07-09 01:32:31.229477', '4', 'Модератор', '1', '', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '35', '2016-07-09 01:32:52.928358', '1', 'грн', '1', '', '27', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '36', '2016-07-09 01:33:23.075617', '1', 'ул.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '37', '2016-07-09 01:33:28.663194', '2', 'бул.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '38', '2016-07-09 01:33:43.596203', '3', 'наб.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '39', '2016-07-09 01:33:51.215057', '4', 'аллея.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '40', '2016-07-09 01:33:57.633100', '5', 'просп.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '41', '2016-07-09 01:34:03.946953', '6', 'туп.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '42', '2016-07-09 01:34:13.650024', '7', 'дор.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '43', '2016-07-09 01:34:22.921373', '8', 'маг.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '44', '2016-07-09 01:34:32.477304', '9', 'пер.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '45', '2016-07-09 01:34:57.132528', '10', 'пл.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '46', '2016-07-09 01:35:07.559745', '11', 'ш.', '1', '', '8', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '47', '2016-07-10 01:22:48.494912', '1', 'Пара', '1', '', '30', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '48', '2016-07-10 01:22:58.438943', '2', '1 человек', '1', '', '30', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '49', '2016-07-10 01:23:08.438175', '3', 'Семьям с детьми', '1', '', '30', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '50', '2016-07-10 01:23:18.225740', '4', 'Не русские', '1', '', '30', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '51', '2016-07-10 01:23:28.172226', '5', 'более 4 человека', '1', '', '30', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '52', '2016-07-10 01:23:52.812812', '1', 'Холодильик', '1', '', '31', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '53', '2016-07-10 01:24:16.123259', '2', 'Телевизор', '1', '', '31', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '54', '2016-07-10 01:24:26.183431', '3', 'Плазма ТВ', '1', '', '31', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '55', '2016-07-10 01:24:35.001664', '4', 'Стиральная машина(АВТО)', '1', '', '31', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '56', '2016-07-10 01:24:44.617535', '5', 'Стиральная машина полуавтомат', '1', '', '31', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '57', '2016-07-10 01:25:15.352742', '1', 'становлен бак или колонка', '1', '', '33', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '58', '2016-07-10 01:25:23.038661', '2', 'Центральное', '1', '', '33', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '59', '2016-07-10 01:25:32.449960', '3', 'нет', '1', '', '33', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '60', '2016-07-10 01:25:52.767746', '1', 'Кровать', '1', '', '32', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '61', '2016-07-10 01:26:00.170389', '2', 'Кровать двухспалка', '1', '', '32', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '62', '2016-07-10 01:26:07.453455', '3', 'Диван', '1', '', '32', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '63', '2016-07-10 01:26:21.490302', '4', 'Диван расклад.', '1', '', '32', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '64', '2016-07-10 01:26:46.200833', '1', 'нет', '1', '', '34', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '65', '2016-07-10 01:26:56.158301', '2', '1 мес', '1', '', '34', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '66', '2016-07-10 01:27:02.063347', '3', '2 мес', '1', '', '34', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '67', '2016-07-10 01:27:07.969445', '4', '3 мес', '1', '', '34', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '68', '2016-07-10 01:27:12.933145', '5', '4 мес', '1', '', '34', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '69', '2016-07-10 01:27:18.402042', '6', '5 мес', '1', '', '34', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '70', '2016-07-10 01:27:24.316802', '7', '6 мес', '1', '', '34', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '71', '2016-07-10 01:27:49.926260', '1', 'пластиковые', '1', '', '35', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '72', '2016-07-10 01:27:59.831471', '2', 'деревянные', '1', '', '35', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '73', '2016-07-10 01:28:16.003741', '3', 'Частично', '1', '', '35', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '74', '2016-07-10 01:28:24.229803', '4', 'Не установлены', '1', '', '35', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '75', '2016-07-10 01:28:44.324003', '1', 'Котел', '1', '', '36', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '76', '2016-07-10 01:28:55.590584', '2', 'Центральное', '1', '', '36', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '77', '2016-07-10 01:29:03.316967', '3', 'электрическое', '1', '', '36', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '78', '2016-07-10 01:29:15.598395', '4', 'Несколько отоплений', '1', '', '36', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '79', '2016-07-10 01:29:34.662359', '1', 'В доме', '1', '', '37', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '80', '2016-07-10 01:29:41.767860', '2', 'на улице', '1', '', '37', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '81', '2016-07-10 01:29:50.627310', '3', 'в доме и улице', '1', '', '37', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '82', '2016-07-10 01:30:09.029790', '1', 'есть', '1', '', '38', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '83', '2016-07-10 01:30:16.338269', '2', 'нет', '1', '', '38', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '84', '2016-07-10 01:30:23.948376', '3', 'частично', '1', '', '38', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '85', '2016-07-10 01:30:33.572579', '4', 'новая мебель', '1', '', '38', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '86', '2016-07-11 16:38:37.221172', '1', 'грн', '1', '', '39', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '87', '2016-07-11 16:38:45.350785', '2', 'тнг', '1', '', '39', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '88', '2016-07-11 16:38:50.414220', '3', 'руб', '1', '', '39', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '89', '2016-07-14 13:49:21.479025', '1', 'Смежные', '1', '', '40', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '90', '2016-07-14 13:49:45.175206', '2', 'Раздельные', '1', '', '40', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '91', '2016-07-14 13:50:03.280098', '3', 'Смежно-раздельные', '1', '', '40', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '92', '2016-07-21 00:59:14.082895', '1', 'varunok', '2', 'Змінено first_name та last_name. Додано my user "MyUser object".', '4', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '93', '2016-07-25 02:26:40.814672', '1', 'Горячий', '1', '', '45', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '94', '2016-07-25 02:26:54.632145', '2', 'Активний', '1', '', '45', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '95', '2016-07-25 02:27:04.220507', '3', 'Нужно узнать', '1', '', '45', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '96', '2016-07-25 02:27:19.376138', '4', 'Уже нашли', '1', '', '45', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '97', '2016-07-25 16:18:46.959995', '1', 'Постоянный', '1', '', '46', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '98', '2016-07-25 16:18:55.888143', '2', 'Средний', '1', '', '46', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '99', '2016-07-25 16:19:10.173743', '3', 'Разовый', '1', '', '46', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '100', '2016-07-25 18:59:45.036183', '1', 'Подбор объектов', '1', '', '47', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '101', '2016-07-25 18:59:56.441685', '2', 'Показы', '1', '', '47', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '102', '2016-07-25 19:00:08.489105', '3', 'Ждем нового', '1', '', '47', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '103', '2016-07-25 19:00:22.232389', '4', 'Завершение сделки', '1', '', '47', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '107', '2016-07-30 00:10:55.121474', '1', 'Не предлагали', '1', '', '53', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '108', '2016-07-30 00:10:58.509723', '2', 'Ок', '1', '', '53', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '109', '2016-07-30 00:11:01.777955', '3', 'Предлагали', '1', '', '53', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '110', '2016-07-30 21:00:57.998360', '1', 'Не предлагали', '1', '', '53', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '111', '2016-07-30 21:01:01.943768', '2', 'Предлагали', '1', '', '53', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '112', '2016-07-30 21:01:05.350232', '3', 'Ок', '1', '', '53', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '113', '2016-08-02 22:37:21.965341', '1', 'Постоянно', '1', '', '61', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '114', '2016-08-02 22:37:31.333805', '2', 'Иногда', '1', '', '61', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '115', '2016-08-02 22:37:39.290199', '3', 'Редко ', '1', '', '61', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '116', '2016-08-03 05:16:03.941529', '1', 'Белый', '1', '', '63', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '117', '2016-08-03 05:16:13.461983', '2', 'Черный', '1', '', '63', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '118', '2016-08-04 22:06:53.974681', '2', 'test@test.test', '2', 'Змінено type_user для my user "MyUser object".', '4', '1' );
-- ---------------------------------------------------------


-- Dump data of "django_content_type" ----------------------
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '1', 'admin', 'logentry' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '43', 'arendator', 'arendator' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '46', 'arendator', 'typeclient' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '47', 'arendator', 'typestage' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '45', 'arendator', 'typestate' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '44', 'arendator', 'userfullname' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '3', 'auth', 'group' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '2', 'auth', 'permission' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '4', 'auth', 'user' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '57', 'buyer', 'buyer' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '58', 'buyer', 'userfullname' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '5', 'contenttypes', 'contenttype' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '12', 'extuser', 'myuser' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '13', 'extuser', 'usersgroupextuser' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '22', 'facility', 'addressfacilitydata' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '23', 'facility', 'contactowner' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '25', 'facility', 'databasephoneowner' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '29', 'facility', 'imagesfacility' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '24', 'facility', 'phoneowner' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '20', 'facility', 'typeactuality' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '18', 'facility', 'typebuilding' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '21', 'facility', 'typecondition' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '17', 'facility', 'typecontactowner' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '31', 'facility', 'typeequipment' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '15', 'facility', 'typefacility' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '38', 'facility', 'typefurniture' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '36', 'facility', 'typeheating' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '37', 'facility', 'typelavatory' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '30', 'facility', 'typenumberofperson' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '16', 'facility', 'typeoperations' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '34', 'facility', 'typeprepayment' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '19', 'facility', 'typerepairs' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '40', 'facility', 'typerooms' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '33', 'facility', 'typethepresenceofhotwater' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '32', 'facility', 'typewheretostay' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '35', 'facility', 'typewindows' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '26', 'facility', 'userfullname' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '62', 'makler', 'makler' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '61', 'makler', 'typecooperations' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '63', 'makler', 'typewhiteblack' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '7', 'notes', 'notes' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '42', 'send_messege_user', 'usermessage' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '6', 'sessions', 'session' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '66', 'setting_globall', 'franshise' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '65', 'setting_globall', 'franshisesity' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '39', 'setting_globall', 'listnationalcarrency' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '27', 'setting_globall', 'nationalcarrency' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '10', 'setting_street', 'district' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '9', 'setting_street', 'street' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '11', 'setting_street', 'subway' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '8', 'setting_street', 'typesstreet' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '64', 'setting_superadmin', 'alltocall' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '56', 'single_object', 'showsarendator' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '59', 'single_object', 'showsbuyer' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '51', 'single_object', 'singleobjcomments' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '54', 'single_object', 'tie' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '60', 'single_object', 'tiebuyer' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '53', 'single_object', 'typeshows' );
-- ---------------------------------------------------------


-- Dump data of "django_migrations" ------------------------
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '1', 'contenttypes', '0001_initial', '2016-07-09 01:20:52.242160' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '2', 'auth', '0001_initial', '2016-07-09 01:20:58.880506' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '3', 'admin', '0001_initial', '2016-07-09 01:21:00.565074' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '4', 'contenttypes', '0002_remove_content_type_name', '2016-07-09 01:21:01.520604' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '5', 'auth', '0002_alter_permission_name_max_length', '2016-07-09 01:21:02.107034' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '6', 'auth', '0003_alter_user_email_max_length', '2016-07-09 01:21:02.786025' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '7', 'auth', '0004_alter_user_username_opts', '2016-07-09 01:21:02.850688' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '8', 'auth', '0005_alter_user_last_login_null', '2016-07-09 01:21:03.325765' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '9', 'auth', '0006_require_contenttypes_0002', '2016-07-09 01:21:03.646491' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '10', 'extuser', '0001_initial', '2016-07-09 01:21:07.676775' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '11', 'setting_street', '0001_initial', '2016-07-09 01:21:10.040890' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '12', 'setting_globall', '0001_initial', '2016-07-09 01:21:10.309000' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '13', 'facility', '0001_initial', '2016-07-09 01:21:36.260784' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '14', 'notes', '0001_initial', '2016-07-09 01:21:36.822051' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '15', 'sessions', '0001_initial', '2016-07-09 01:21:37.335455' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '16', 'facility', '0002_remove_addressfacilitydata_image', '2016-07-09 03:08:27.241159' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '17', 'facility', '0003_delete_imagesalbum', '2016-07-09 03:08:49.175004' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '18', 'facility', '0004_imagesalbum', '2016-07-09 03:17:29.737767' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '19', 'facility', '0005_addressfacilitydata_image', '2016-07-09 03:17:52.032084' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '20', 'facility', '0006_remove_addressfacilitydata_image', '2016-07-09 03:41:03.545826' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '21', 'facility', '0007_delete_imagesalbum', '2016-07-09 03:41:28.149673' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '22', 'facility', '0008_imagesfacility', '2016-07-09 04:49:26.951103' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '23', 'facility', '0009_addressfacilitydata_images_count', '2016-07-09 05:54:10.281132' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '24', 'facility', '0010_auto_20160709_0555', '2016-07-09 05:55:29.778027' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '25', 'facility', '0011_imagesfacility_cover', '2016-07-09 15:43:48.142452' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '26', 'facility', '0012_auto_20160710_0024', '2016-07-10 00:24:29.364453' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '27', 'facility', '0013_typeequipment_typefurniture_typeheating_typelavatory_typenumberofperson_typeprepayment_typethepresen', '2016-07-10 00:56:08.208420' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '28', 'facility', '0014_addressfacilitydata_number_of_persons', '2016-07-10 01:18:04.314327' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '29', 'facility', '0015_auto_20160710_0137', '2016-07-10 01:37:17.839155' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '30', 'facility', '0016_auto_20160710_0147', '2016-07-10 01:48:04.256242' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '31', 'facility', '0017_auto_20160710_0154', '2016-07-10 01:54:38.635935' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '32', 'facility', '0018_addressfacilitydata_date_of_renovation', '2016-07-10 02:27:34.237902' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '33', 'facility', '0019_addressfacilitydata_date_added', '2016-07-10 02:33:58.126068' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '34', 'facility', '0020_addressfacilitydata_public', '2016-07-10 02:36:51.563421' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '35', 'facility', '0021_auto_20160710_0240', '2016-07-10 02:40:08.059056' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '36', 'facility', '0022_auto_20160710_0342', '2016-07-10 03:42:05.252231' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '37', 'facility', '0023_auto_20160710_0342', '2016-07-10 03:42:26.242302' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '38', 'facility', '0024_auto_20160710_0352', '2016-07-10 03:53:04.635125' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '39', 'facility', '0025_auto_20160710_0353', '2016-07-10 03:53:25.908752' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '40', 'facility', '0026_auto_20160710_0354', '2016-07-10 03:54:10.115058' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '41', 'setting_globall', '0002_listnationalcarrency', '2016-07-11 16:37:17.606658' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '42', 'facility', '0027_auto_20160713_0039', '2016-07-13 00:42:27.581601' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '43', 'facility', '0028_auto_20160714_1156', '2016-07-14 11:57:13.224363' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '44', 'facility', '0029_typerooms', '2016-07-14 13:47:17.722369' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '45', 'facility', '0030_addressfacilitydata_room', '2016-07-14 13:54:10.213231' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '46', 'facility', '0031_auto_20160714_1844', '2016-07-14 18:46:09.176959' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '47', 'facility', '0032_auto_20160714_1929', '2016-07-14 19:29:54.738096' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '48', 'facility', '0033_auto_20160714_1943', '2016-07-14 19:44:51.875253' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '49', 'facility', '0034_auto_20160715_1635', '2016-07-15 16:35:32.251340' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '50', 'facility', '0035_auto_20160715_1817', '2016-07-15 18:18:51.911658' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '51', 'facility', '0036_auto_20160716_2009', '2016-07-16 20:09:47.236707' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '55', 'send_messege_user', '0001_initial', '2016-07-23 01:38:53.012713' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '57', 'send_messege_user', '0002_usermessage_from_user', '2016-07-23 01:50:21.783232' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '58', 'send_messege_user', '0003_usermessage_time_message', '2016-07-23 02:39:17.047848' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '59', 'send_messege_user', '0004_auto_20160723_0257', '2016-07-23 02:57:42.300416' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '60', 'send_messege_user', '0005_auto_20160723_0312', '2016-07-23 03:13:03.382622' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '61', 'send_messege_user', '0006_auto_20160723_0319', '2016-07-23 03:20:03.105681' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '62', 'arendator', '0001_initial', '2016-07-25 01:44:48.445075' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '63', 'facility', '0002_auto_20160725_0144', '2016-07-25 01:44:48.705281' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '64', 'arendator', '0002_auto_20160725_0222', '2016-07-25 02:22:47.106112' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '65', 'arendator', '0003_arendator_type_state', '2016-07-25 02:23:07.856066' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '66', 'arendator', '0004_auto_20160725_0307', '2016-07-25 03:07:06.997074' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '67', 'arendator', '0005_typeclient', '2016-07-25 16:11:55.027996' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '68', 'arendator', '0006_arendator_type_client', '2016-07-25 16:21:10.077027' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '69', 'arendator', '0007_auto_20160725_1643', '2016-07-25 16:43:48.386175' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '70', 'arendator', '0008_auto_20160725_1715', '2016-07-25 17:15:25.837219' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '71', 'arendator', '0009_auto_20160725_1730', '2016-07-25 17:30:50.752103' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '72', 'arendator', '0010_auto_20160725_1732', '2016-07-25 17:32:52.510292' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '73', 'arendator', '0011_auto_20160725_1732', '2016-07-25 17:32:54.070264' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '74', 'arendator', '0012_auto_20160725_1744', '2016-07-25 17:44:34.022821' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '75', 'arendator', '0013_auto_20160725_1748', '2016-07-25 17:48:40.196260' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '76', 'arendator', '0014_auto_20160725_1858', '2016-07-25 18:58:17.969237' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '77', 'arendator', '0015_auto_20160725_1858', '2016-07-25 18:58:36.699797' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '78', 'arendator', '0016_auto_20160725_1923', '2016-07-25 19:23:23.703522' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '79', 'arendator', '0017_auto_20160725_2024', '2016-07-25 20:24:25.145956' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '80', 'arendator', '0018_auto_20160727_2339', '2016-07-27 23:42:05.569845' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '92', 'single_object', '0001_initial', '2016-07-30 20:00:12.533347' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '93', 'single_object', '0002_tie_typeshows', '2016-07-30 20:00:15.289016' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '94', 'single_object', '0003_showsarendator', '2016-07-30 20:01:25.173836' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '95', 'single_object', '0004_tie_shows_arendator', '2016-07-30 20:02:13.648522' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '96', 'single_object', '0005_remove_tie_shows_arendator', '2016-07-30 20:54:05.668464' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '97', 'single_object', '0006_auto_20160730_2058', '2016-07-30 20:58:22.263129' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '98', 'arendator', '0019_auto_20160802_0053', '2016-08-02 00:54:11.212509' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '99', 'facility', '0003_auto_20160802_0053', '2016-08-02 00:54:11.816325' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '100', 'single_object', '0007_auto_20160802_0053', '2016-08-02 00:54:14.067431' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '101', 'arendator', '0020_auto_20160802_0233', '2016-08-02 02:34:52.684939' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '102', 'buyer', '0001_initial', '2016-08-02 02:37:00.972644' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '103', 'single_object', '0008_auto_20160802_0412', '2016-08-02 04:13:04.087319' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '104', 'makler', '0001_initial', '2016-08-02 18:04:06.541585' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '105', 'makler', '0002_makler', '2016-08-02 22:33:10.756592' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '106', 'makler', '0003_makler_cooperation', '2016-08-02 22:36:30.742790' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '107', 'makler', '0004_auto_20160803_0347', '2016-08-03 03:47:06.659387' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '108', 'makler', '0005_typewhiteblack', '2016-08-03 05:12:50.560289' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '109', 'makler', '0006_auto_20160803_0514', '2016-08-03 05:14:09.212048' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '110', 'makler', '0007_auto_20160803_0523', '2016-08-03 05:23:34.515260' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '111', 'setting_superadmin', '0001_initial', '2016-08-05 01:25:12.682429' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '112', 'setting_globall', '0002_franshisesity', '2016-08-05 03:42:19.401569' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '113', 'setting_globall', '0003_auto_20160805_0342', '2016-08-05 03:42:20.172120' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '114', 'setting_superadmin', '0002_auto_20160805_0341', '2016-08-05 03:42:22.634314' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '115', 'setting_globall', '0004_franshise', '2016-08-05 04:50:08.331005' );
-- ---------------------------------------------------------


-- Dump data of "django_session" ---------------------------
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '02599rwr5qusdymu9pwpsv384wybciat', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 15:06:08.472605' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '0b2k78qcrfm2abhnchpu7s0c3z4fsn65', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-28 10:49:17.929557' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '161477jn8h2wtozauoehvy2xykundm58', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-08-17 22:14:36.625205' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '1zj25qhe5wif41xp9i888rxh95458qrq', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-21 04:21:59.749568' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '2sgph2ren8khixc5ffiggj1ajnm1yf59', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-21 01:47:21.490774' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '3rchfodlf6wj3x605b9amketuz39tg08', 'MjJkMTBkZTI5NTFjN2Q4NzdiZDkzYmQ2ZTAxZGNkYjk5ZjMxMmM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3YjcwYmRjMjMzMzM3ODA1ZTU2ZDY1MGVkZTgxM2MwMDMyNDk3ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2016-08-09 01:48:06.566918' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '3x38hbc6eb0lootzjjuqumdx79s9ndio', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-23 05:20:43.928929' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '4jkxfa4u1mmaag1uo3wivxuuv9uwk9ua', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-23 05:51:22.699576' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '53juleze5xrhvb2gec21x93jl9aqrnye', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 19:51:02.974682' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '6mopvxi7czxjd5yzeph3rdv06gi3jnll', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 21:24:56.617419' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '8wbr4hgu3j3clivihf06xwcxca3dpep0', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 17:49:22.099420' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '94enbjj8scdulnh0a3amhm2099vtsyge', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-08-18 22:11:00.665130' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'b29szn92vi7zztk5qvr3umlizlpzcpy3', 'MjJkMTBkZTI5NTFjN2Q4NzdiZDkzYmQ2ZTAxZGNkYjk5ZjMxMmM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3YjcwYmRjMjMzMzM3ODA1ZTU2ZDY1MGVkZTgxM2MwMDMyNDk3ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2016-07-22 15:10:48.058019' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'b744qzgrmbrm6ozkhcij9ad8fjc7tnk1', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-26 02:36:37.198126' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'by1snh3z6gw4uwzcpmwg9s78ncagozfn', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-27 18:55:15.270681' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'dojeht1ustowpeaum1r92xe6x3gwsyja', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-23 03:12:53.588116' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'dwxr387rffpthfa93bgn8udvlj7lzfg4', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 15:43:51.784882' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'dz79m0i4oc9il310paywnp66dxxj7tj1', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 14:35:26.100354' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'ekc622tjma9xoi4c3a5tzzw0lbakzzyo', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 20:38:01.720371' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'et7ura7xwxjrrffginsxa1tkbeuplf6v', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-26 02:47:03.884905' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'ew0mcixstv3l7c3k6x6l4dos7jabh5zx', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-23 01:53:49.275682' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'f116cwx3a1xu48wlz83b9xpg1pfwkkj8', 'MjJkMTBkZTI5NTFjN2Q4NzdiZDkzYmQ2ZTAxZGNkYjk5ZjMxMmM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3YjcwYmRjMjMzMzM3ODA1ZTU2ZDY1MGVkZTgxM2MwMDMyNDk3ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2016-07-21 02:40:06.683905' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'fepfgyso4hcwt9x94ukqqvo2qfpl60kt', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-23 04:19:10.891928' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'ftgr53rh2e68iizb6vbty5sh3wqzxyu0', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-25 17:43:54.902459' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'g33733ar2pnah9yjc5qz2iic0pmn2a45', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-26 05:43:59.169255' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'hehi510d08wcnmuvbz66z1ridqx61gn5', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-25 02:15:02.092549' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'hi2et71wdypapbl2pjuf68nx6vo4nviy', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-23 02:27:11.263927' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'ij28125gergkjqio76131npa82ivrx97', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-25 01:42:56.698335' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'jkjjw82t1z4hofktciu8wswrrlbcb0zj', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-23 04:50:11.118385' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'kcsga9241mj2bzfspb2y26vr8r2ydxt4', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-21 01:47:47.973182' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'kog4ve8qvw0zlnhwaul1j2tfnzom61w6', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 16:14:04.103121' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'l3j1ti0aqe3idwlznllg1oditv2zk8x2', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-25 02:53:58.280592' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'lduai3mg58wgxq9u92zxdkcsfdbmfyfr', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-21 02:03:58.641561' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'lpgcco22l60co3eyqanaieuzhikkccr2', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 22:09:01.313769' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'nq55xx4amwbrdreq517lbb9r64p4btdb', 'MjJkMTBkZTI5NTFjN2Q4NzdiZDkzYmQ2ZTAxZGNkYjk5ZjMxMmM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3YjcwYmRjMjMzMzM3ODA1ZTU2ZDY1MGVkZTgxM2MwMDMyNDk3ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2016-07-21 04:48:31.802652' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'nz9ksgjemqlswfm5tjfh6eyo0w6anv40', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-24 18:43:58.963610' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'ob6ruyo6bowftlti3evn3ly466gvcaiw', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 22:39:19.721532' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'pc3r3wk2un8f5kh6mxu0qhhhc4hloybl', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-21 03:45:12.722792' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 's4xj3xmac1gjwwxl2qktcfsw3a0dwl64', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-23 03:44:12.856974' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'sgy3ce1u2fobwqbdjc3cbf0qrswajxl1', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 16:53:24.979125' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'sj4sjiw21yqri4dccxykk9waka8aetni', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 19:08:44.855093' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 't2pxrc2r50ecy9sf398foaqfql3unpdl', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-25 16:27:52.408455' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'vreqvurz3o898u1etp8j49zwnm0cqx8q', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-25 03:27:39.955753' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'vyicynsid05rnko3qh5o18p7f2w5lppf', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-21 03:11:41.360223' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'wus1xyrr4ojtrjit166ji3mhmb3yqc9u', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-08-04 00:58:24.346897' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'zncifc8a6go62iscz3o103poeqe8yy21', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-22 18:30:18.599808' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'zsx0z3w7gga9k5xgm95vuntbajpck5by', 'ZWU3NmQxNTZhY2ZkZmZkODMwYWM5YmU2YmY0YjQ3ZmY0NWU2NTFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5NTAyMmFhZGVmMDhmMWNjM2YzMmMyMzVmZTdkY2QwZTMyNDI0NjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-25 00:51:12.629833' );
-- ---------------------------------------------------------


-- Dump data of "extuser_myuser" ---------------------------
INSERT INTO `extuser_myuser`(`id`,`image`,`type_user_id`,`user_id`) VALUES ( '1', 'avatar/cihVr5A3LfI.jpg', '1', '2' );
INSERT INTO `extuser_myuser`(`id`,`image`,`type_user_id`,`user_id`) VALUES ( '2', 'avatar/DMDaJEvsMnw.jpg', '2', '1' );
INSERT INTO `extuser_myuser`(`id`,`image`,`type_user_id`,`user_id`) VALUES ( '3', 'avatar/qXO_zDLtdts_4RADg4B.jpg', '4', '3' );
INSERT INTO `extuser_myuser`(`id`,`image`,`type_user_id`,`user_id`) VALUES ( '4', 'avatar/fg-HjB2Zefk.jpg', '4', '4' );
INSERT INTO `extuser_myuser`(`id`,`image`,`type_user_id`,`user_id`) VALUES ( '5', 'avatar/uyyjMbgAoVE.jpg', '2', '5' );
-- ---------------------------------------------------------


-- Dump data of "extuser_usersgroupextuser" ----------------
INSERT INTO `extuser_usersgroupextuser`(`id`,`type_user`) VALUES ( '1', 'Админ' );
INSERT INTO `extuser_usersgroupextuser`(`id`,`type_user`) VALUES ( '2', 'Суперадмин' );
INSERT INTO `extuser_usersgroupextuser`(`id`,`type_user`) VALUES ( '4', 'Модератор' );
-- ---------------------------------------------------------


-- Dump data of "facility_addressfacilitydata" -------------
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '1', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sdgsdsf', '', '1', NULL, NULL, NULL, '0', '0', '2016-07-24 18:14:48.256530', '2016-07-10 02:33:51.887866', '0', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '2', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', '45', '', NULL, 'sdgsdsf', '', '1', NULL, NULL, NULL, '0', '0', '2016-07-20 19:03:27.529225', '2016-07-10 02:33:51.887866', '0', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '3', '3', NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'fgsgsfsfef', '', '7', NULL, NULL, NULL, '0', '0', '2016-07-28 03:02:05.508387', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Участок', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '4', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', '2', '', NULL, 'thfhtfhfhfthfhf', '', '0', NULL, NULL, NULL, '0', '0', '2016-07-16 22:36:26.599097', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '5', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'thfhtfhfhfthfhf', '', '4', NULL, NULL, NULL, '0', '0', '2016-08-02 05:30:52.347968', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '6', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', '77', '', NULL, 'sfsffefsfse', '', '4', NULL, NULL, NULL, '0', '0', '2016-07-18 20:59:23.184276', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '7', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'ggdrgdsg', '', '6', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '8', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', '877', '', NULL, 'fgdgdgr', '', '0', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '9', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', '34', '', NULL, 'fgdgdgr', '', '7', NULL, NULL, NULL, '0', '0', '2016-07-18 21:01:02.228324', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '10', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'fgdgdgr', '', '7', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '11', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'fgdgdgr', '', '7', NULL, NULL, NULL, '0', '0', '2016-07-19 00:42:59.399133', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '12', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'rgrgrgegegege', '', '0', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '13', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'rgrgrgegegege', '', '5', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '14', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'efsfesfesf', '', '6', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '15', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sfsfsfse', '', '5', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '16', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sefesfsfs', '', '0', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '17', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sefesfsfs', '', '8', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '18', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'dfsfsf', '', '0', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '19', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'dfsfsf', '', '9', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '20', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'dfgfdgdfg', '', '9', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '21', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'drfrfrdfgd', '', '0', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '22', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'drfrfrdfgd', '', '0', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '23', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sfgseffsf', '', '1', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '24', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sdfsdfdsdf', '', '0', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '25', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sdfsdfdsdf', '', '1', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '26', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'wdwdewd', '', '1', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '27', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sdsd', '', '1', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '28', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'grtgtr', '', '2', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '29', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'rtgdgdrgdgd', '', '2', NULL, NULL, NULL, '0', '0', '2016-07-10 02:27:26.786251', '2016-07-10 02:33:51.887866', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '30', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'rgregeeeeeeeeeeeeee', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-10 03:54:14.475697', '2016-07-10 03:54:13.665721', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '31', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'srgsrgsfesf', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-10 04:04:34.273640', '2016-07-10 04:04:33.142382', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '32', NULL, NULL, '30000', '600', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'апвпвапавпвп', '45', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-11 01:40:54.156481', '2016-07-11 01:40:53.477485', '0', '3', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '33', NULL, NULL, '30000', '600', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'апвпвапавпвп', '45', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-11 01:55:23.763358', '2016-07-11 01:55:23.559406', '0', '3', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '34', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'ergrg', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-11 02:04:01.556115', '2016-07-11 02:04:01.316826', '0', '2', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '35', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'ergrg', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-11 02:09:53.506486', '2016-07-11 02:09:53.231240', '0', '1', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '36', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'аіуаааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааа', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-11 15:24:36.611266', '2016-07-11 15:24:35.764369', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '37', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', '15', 'werweer', '', '5', NULL, NULL, NULL, NULL, NULL, '2016-07-12 04:18:51.421072', '2016-07-12 04:18:50.350228', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Участок', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '38', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sfsfsfssese', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-12 23:55:57.113406', '2016-07-12 23:55:56.855786', '0', NULL, NULL, '2', 'Галицький', NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Участок', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '39', '89', NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'sfsfsfsfsfsf', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-13 00:51:21.690371', '2016-07-13 00:51:21.194940', '0', NULL, '4', '2', 'Винники', NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '40', '78', NULL, '0', '0', '', '11', '45', '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'adadadwdwawd', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-14 11:58:41.978492', '2016-07-14 11:58:40.888115', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '41', '67', NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', '1', 'fghfghhfhgf', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-14 17:03:20.140277', '2016-07-14 17:03:19.561142', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, '2', 'ул.Коцюбинского', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '42', '56', NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'dsfvsdfsdfsfvsfsf efwefwfw wefwef wef', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-14 17:11:37.673551', '2016-07-14 17:11:37.121623', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, '1', 'ул.Коцюбинского', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '43', '45', NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', NULL, '', '', NULL, '', NULL, 'фвфвфцв', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-18 20:55:08.580118', '2016-07-14 18:07:25.260632', '1', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Шевченка', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '44', '34', NULL, '0', '0', '', NULL, NULL, '0', '0', '22', '', '2', '', '', NULL, '', '4', 'asdcadda', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-14 18:19:16.542466', '2016-07-14 18:19:16.238686', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Шевченка', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '46', '12', NULL, '0', '0', '', '1', '100', '0', '0', '34', '', '12', '', '', NULL, '', NULL, 'adadadadd', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-14 19:11:31.936967', '2016-07-14 19:11:31.663563', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Шевченка', NULL, NULL, NULL, 'Квартира', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '47', NULL, NULL, '0', '0', '', NULL, NULL, '0', '0', NULL, '', '23', '', '', NULL, '', '10', 'sfsfsef', '', '0', NULL, NULL, NULL, NULL, NULL, '2016-07-14 19:29:09.065324', '2016-07-14 19:29:08.681177', '0', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ул.Шевченка', NULL, NULL, NULL, 'Комната', NULL );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '49', '34', '23', '40000', '400', '', '1', '10', '0', '0', '5', '34', '45', '56', '67', '88', '', '55', 'DFEFdsfisgdgdpjfger gjrgipregergpijerg ergjergpergpjregjp erfgjrepgergporjegf ergpojerpgergpjoerg ergrepgoergpojerg ergpoergpoergpojeg ergpoergpoergpoer erpgokerpgoergpokje erpogerpogerpog erpgokergporgkoerg eogerpogkerpogker erpogkerpogkerpgoke ergpoergpoerpogker erpgoergpoergpoke rgpoergkpergk erpgokerpogkergok ergpokergokergokergpoergpoergk erpogkerpgokergk eoprgkergpko ergpokergpkergopk ergpokregkerpokgger erpogkerpgkergok erogkerpgkergk erpoergpoergok ergopkergokergopk ergokergokergopk ergpokergokrgok ergpokergokergok ergpokerpgokerogk ergpookergpokerpogk ergpoerpgkerpogk ergpokergpokergpoker eprokgerpogkerg erpgokrepgokergopkrgopkergpo erpogkergpokergpok ergpokerpgokerpgok erpgkerpogerpogk erpgoergpkergpok ergpokergpokergpok ergpokergpokerpgok ergpokerpgoerpokg poerkgpoerkgperkgpo erogkerpgkerpgok perogkeprgokerpgok erpgoerpgokerpgok erpogkerpogkergok ', '450', '0', NULL, NULL, NULL, '4', NULL, '2016-07-25 21:02:03.596407', '2016-07-19 22:11:27.737489', '0', '1', '2', '2', 'Галицький', '2', '4', '2', '3', 'Жилое', '2', 'ул.Шевченка', NULL, '2', 'Гостинка', 'Квартира', '4' );
INSERT INTO `facility_addressfacilitydata`(`id`,`number_home`,`number_apartment`,`price_bay`,`price_month`,`landmark`,`number_of_floors`,`floors_up`,`first_floor`,`last_floor`,`floor`,`area_badroom`,`area_kitchen`,`area_living_room`,`area_extra_room`,`total_area`,`payments`,`rooms`,`comment`,`commission`,`images_count`,`title`,`youtube`,`panorama`,`lot`,`sleeps`,`date_of_renovation`,`date_added`,`public`,`actuality_id`,`condition_id`,`currency_id`,`district_obj_id`,`furniture_id`,`heating_id`,`lavatory_id`,`prepayment_id`,`repairs_id`,`room_id`,`street_obj_id`,`subway_obj_id`,`the_presence_of_hot_water_id`,`type_building_data_id`,`type_facilit_id`,`windows_id`) VALUES ( '50', '34', '45', '20000', '600', '', '1', '100', '0', '0', '4', '34', '45', '23', '12', '46', '', '2', 'sdfdsfsfssd  sdfdsfdsf dsfdsfds  sdfds', '450', '0', NULL, NULL, NULL, NULL, '1', '2016-08-01 02:44:37.145201', '2016-08-01 02:44:36.439948', '0', '1', '2', '2', 'Галицький', '2', '2', '3', '2', 'Евро', '2', 'ул.Шевченка', NULL, '3', 'Новострой', 'Квартира', '2' );
-- ---------------------------------------------------------


-- Dump data of "facility_addressfacilitydata_equipment" ---
INSERT INTO `facility_addressfacilitydata_equipment`(`id`,`addressfacilitydata_id`,`typeequipment_id`) VALUES ( '1', '49', '5' );
INSERT INTO `facility_addressfacilitydata_equipment`(`id`,`addressfacilitydata_id`,`typeequipment_id`) VALUES ( '2', '50', '5' );
-- ---------------------------------------------------------


-- Dump data of "facility_addressfacilitydata_list_operations" 
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '1', '1', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '2', '2', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '3', '3', '2' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '4', '4', '2' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '5', '5', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '6', '6', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '7', '7', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '8', '8', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '9', '9', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '10', '10', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '11', '11', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '12', '12', '4' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '13', '13', '4' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '14', '14', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '15', '15', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '16', '16', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '17', '17', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '18', '18', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '19', '19', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '20', '20', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '21', '21', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '22', '22', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '23', '23', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '24', '24', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '25', '25', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '26', '26', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '27', '27', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '28', '28', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '29', '29', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '30', '30', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '31', '31', '2' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '32', '32', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '33', '33', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '34', '34', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '35', '35', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '36', '36', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '37', '37', '4' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '38', '38', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '39', '38', '2' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '40', '38', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '41', '39', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '42', '40', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '43', '41', '1' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '44', '42', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '45', '43', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '46', '44', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '48', '46', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '49', '47', '3' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '51', '49', '4' );
INSERT INTO `facility_addressfacilitydata_list_operations`(`id`,`addressfacilitydata_id`,`typeoperations_id`) VALUES ( '52', '50', '3' );
-- ---------------------------------------------------------


-- Dump data of "facility_addressfacilitydata_loyality" ----
-- ---------------------------------------------------------


-- Dump data of "facility_addressfacilitydata_number_of_persons" 
INSERT INTO `facility_addressfacilitydata_number_of_persons`(`id`,`addressfacilitydata_id`,`typenumberofperson_id`) VALUES ( '1', '49', '5' );
INSERT INTO `facility_addressfacilitydata_number_of_persons`(`id`,`addressfacilitydata_id`,`typenumberofperson_id`) VALUES ( '2', '50', '2' );
-- ---------------------------------------------------------


-- Dump data of "facility_addressfacilitydata_rieltor" -----
INSERT INTO `facility_addressfacilitydata_rieltor`(`id`,`addressfacilitydata_id`,`userfullname_id`) VALUES ( '1', '39', '2' );
INSERT INTO `facility_addressfacilitydata_rieltor`(`id`,`addressfacilitydata_id`,`userfullname_id`) VALUES ( '2', '49', '2' );
INSERT INTO `facility_addressfacilitydata_rieltor`(`id`,`addressfacilitydata_id`,`userfullname_id`) VALUES ( '3', '50', '1' );
-- ---------------------------------------------------------


-- Dump data of "facility_addressfacilitydata_where_to_stay" 
INSERT INTO `facility_addressfacilitydata_where_to_stay`(`id`,`addressfacilitydata_id`,`typewheretostay_id`) VALUES ( '1', '50', '1' );
-- ---------------------------------------------------------


-- Dump data of "facility_contactowner" --------------------
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '1', '', '', NULL, '04:48:23.263952', NULL, '04:48:23.264019', '', '0', '4535355', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '2', '', '', '2016-07-23', '04:49:33.745361', '2016-07-20', '04:49:33.745442', '', '0', '4535355', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '3', '', '', '2016-07-30', '05:55:46.493663', '2016-07-29', '05:55:46.493729', '', '0', '34534535', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '4', '', '', NULL, '15:48:39.593568', NULL, '15:48:39.593632', '', '0', '34324234234', '', '1', '2016-07-16 22:36:26.598323', 'test test', NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '5', '', '', '2016-08-31', '15:49:25.796320', '2016-08-02', '15:49:25.796387', '', '0', '34324234234', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '6', '', '', NULL, '15:51:34.009536', NULL, '15:51:34.009597', '', '0', '342424', '', '1', '2016-07-18 20:59:23.183498', 'test test', NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '7', '', '', NULL, '15:58:39.093971', NULL, '15:58:39.094043', '', '0', '23424234', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '8', '', '', NULL, '16:45:37.759174', NULL, '16:45:37.759232', '', '0', '3242', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '9', '', '', NULL, '16:46:04.669839', NULL, '16:46:04.669901', '', '0', '3242', '', '1', '2016-07-18 21:01:02.227639', 'test test', NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '10', '', '', NULL, '16:46:29.115670', NULL, '16:46:29.115735', '', '0', '3242', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '11', '', '', NULL, '16:48:01.545743', NULL, '16:48:01.545804', '', '0', '3242', '', '1', '2016-07-19 00:42:59.398323', 'test test', NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '12', '', '', NULL, '16:52:45.517754', NULL, '16:52:45.517815', '', '0', '232332', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '13', '', '', NULL, '16:53:18.122414', NULL, '16:53:18.122475', '', '0', '232332', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '14', '', '', NULL, '16:53:56.759321', NULL, '16:53:56.759378', '', '0', '343243', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '15', '', '', NULL, '16:55:40.926082', NULL, '16:55:40.926146', '', '0', '342342343', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '16', '', '', NULL, '17:01:59.276109', NULL, '17:01:59.276176', '', '0', '343535435', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '17', '', '', NULL, '17:15:24.103227', NULL, '17:15:24.103285', '', '0', '343535435', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '18', '', '', NULL, '18:07:49.223639', NULL, '18:07:49.223712', '', '0', '345355', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '19', '', '', NULL, '18:09:17.160745', NULL, '18:09:17.160812', '', '0', '345355', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '20', '', '', NULL, '18:10:02.578314', NULL, '18:10:02.578381', '', '0', '2342344', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '21', '', '', NULL, '18:12:34.523994', NULL, '18:12:34.524056', '', '0', '234243', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '22', '', '', NULL, '18:12:49.917813', NULL, '18:12:49.917876', '', '0', '234243', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '23', '', '', NULL, '18:13:34.728855', NULL, '18:13:34.728920', '', '0', '342424', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '24', '', '', NULL, '18:17:05.938373', NULL, '18:17:05.938437', '', '0', '123123', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '25', '', '', NULL, '18:18:19.590698', NULL, '18:18:19.590769', '', '0', '123123', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '26', '', '', NULL, '18:19:22.354703', NULL, '18:19:22.354761', '', '0', '1231232', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '27', '', '', NULL, '18:22:53.283254', NULL, '18:22:53.283316', '', '0', '213131', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '28', '', '', NULL, '18:24:49.011483', NULL, '18:24:49.011542', '', '0', '3423423', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '29', '', '', NULL, '18:39:52.615345', NULL, '18:39:52.615406', '', '0', '34534563656', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '30', '', '', NULL, '03:54:13.794220', NULL, '03:54:13.794282', '', '0', '3454353535', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '31', '', '', NULL, '04:04:33.343287', NULL, '04:04:33.343347', '', '0', '34535435', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '32', '', '', NULL, '01:40:53.642036', NULL, '01:40:53.642097', '', '0', '54353535', '', '0', NULL, NULL, '1' );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '33', '', '', NULL, '01:55:23.575727', NULL, '01:55:23.575787', '', '0', '54353535', '', '0', NULL, NULL, '1' );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '34', '', '', '2016-08-30', '02:04:01.338575', NULL, '02:04:01.338635', '', '0', '43535', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '35', '', '', '2016-08-03', '02:09:53.243480', NULL, '02:09:53.243561', '', '0', '43535', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '36', '', '', NULL, '15:24:36.054507', NULL, '15:24:36.054575', '', '0', '23424234', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '37', '', '', NULL, '04:18:50.615774', NULL, '04:18:50.615828', '', '0', '231321123', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '38', '', '', NULL, '23:55:56.918626', NULL, '23:55:56.918693', '', '1', '342344', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '39', '', '', NULL, '00:51:21.340158', NULL, '00:51:21.340210', '', '0', '2342342342', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '40', '', '', NULL, '11:58:41.420125', NULL, '11:58:41.420189', '', '0', '345356356', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '41', '', '', NULL, '17:03:19.704703', NULL, '17:03:19.704764', '', '0', '345645645', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '42', '', '', NULL, '17:11:37.197420', NULL, '17:11:37.197483', '', '0', '23332424', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '43', '', '', NULL, '18:07:25.286690', NULL, '18:07:25.286742', '', '0', '123123131', '23123123', '1', '2016-07-18 20:55:08.579345', 'test test', NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '44', '', '', NULL, '18:19:16.242870', NULL, '18:19:16.242930', '', '0', '222', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '46', '', '', NULL, '19:11:31.667954', NULL, '19:11:31.668016', '', '0', '21312312313', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '47', '', '', NULL, '19:29:08.684968', NULL, '19:29:08.685020', '', '0', '23424', '', '0', NULL, NULL, NULL );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '49', 'sfsdf', 'FARA ertyop', '2017-01-31', '22:11:27.955462', '2016-10-14', '22:11:27.955522', 'varere@dsfdsf.df', '1', '234242342343424', '234343434', '0', NULL, NULL, '1' );
INSERT INTO `facility_contactowner`(`addressfacilitydata_ptr_id`,`agency`,`name_owner`,`review_date`,`review_time`,`call_date`,`call_time`,`email_owner`,`vip_owner`,`phone_owner`,`phone_owner_plus`,`trash`,`time_trash`,`name_user_trash`,`contact_owner_id`) VALUES ( '50', '', 'Ferw', '2017-02-28', '02:44:36.658423', '2016-08-01', '02:44:36.658484', 'esffsf@fref.hgrh', '0', '213123131', '2131231', '0', NULL, NULL, '2' );
-- ---------------------------------------------------------


-- Dump data of "facility_databasephoneowner" --------------
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '1', '1', '4535355' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '2', '1', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '3', '2', '4535355' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '4', '2', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '5', '3', '34534535' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '6', '3', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '7', '4', '34324234234' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '8', '4', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '9', '5', '34324234234' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '10', '5', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '11', '6', '342424' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '12', '6', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '13', '7', '23424234' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '14', '7', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '15', '8', '3242' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '16', '8', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '17', '9', '3242' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '18', '9', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '19', '10', '3242' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '20', '10', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '21', '11', '3242' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '22', '11', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '23', '12', '232332' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '24', '12', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '25', '13', '232332' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '26', '13', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '27', '14', '343243' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '28', '14', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '29', '15', '342342343' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '30', '15', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '31', '16', '343535435' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '32', '16', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '33', '17', '343535435' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '34', '17', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '35', '18', '345355' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '36', '18', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '37', '19', '345355' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '38', '19', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '39', '20', '2342344' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '40', '20', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '41', '21', '234243' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '42', '21', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '43', '22', '234243' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '44', '22', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '45', '23', '342424' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '46', '23', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '47', '24', '123123' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '48', '24', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '49', '25', '123123' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '50', '25', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '51', '26', '1231232' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '52', '26', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '53', '27', '213131' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '54', '27', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '55', '28', '3423423' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '56', '28', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '57', '29', '34534563656' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '58', '29', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '59', '30', '3454353535' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '60', '30', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '61', '31', '34535435' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '62', '31', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '63', '32', '54353535' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '64', '32', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '65', '33', '54353535' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '66', '33', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '67', '34', '43535' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '68', '34', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '69', '35', '43535' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '70', '35', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '71', '36', '23424234' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '72', '36', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '73', '37', '231321123' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '74', '37', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '75', '38', '342344' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '76', '38', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '77', '39', '2342342342' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '78', '39', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '79', '40', '345356356' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '80', '40', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '81', '41', '345645645' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '82', '41', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '83', '42', '23332424' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '84', '42', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '85', '43', '123123131' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '86', '43', '23123123' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '87', '44', '222' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '88', '44', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '89', '45', '675757' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '90', '45', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '91', '46', '21312312313' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '92', '46', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '93', '47', '23424' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '94', '47', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '95', '48', '2345444' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '96', '48', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '97', '49', '2123213' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '98', '49', '' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '99', '49', '234242342343424' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '100', '49', '234343434' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '101', '50', '213123131' );
INSERT INTO `facility_databasephoneowner`(`id`,`db_id_owner`,`db_phone_owner`) VALUES ( '102', '50', '2131231' );
-- ---------------------------------------------------------


-- Dump data of "facility_imagesfacility" ------------------
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '1', 'img_obj/YNIWGIlpySw_kPBzcJg.jpg', '1', '2' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '2', 'img_obj/Dia0gWZF8Y4.jpg', '0', '2' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '3', 'img_obj/B06EcW7Kw1w.jpg', '0', '2' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '4', 'img_obj/Dti7bY9W_3E.jpg', '0', '2' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '5', 'img_obj/uyyjMbgAoVE.jpg', '0', '2' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '6', 'img_obj/xUDQyYvjt8Y.jpg', '1', '3' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '7', 'img_obj/qXO_zDLtdts.jpg', '0', '3' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '8', 'img_obj/b7jOT5OAlEM.jpg', '0', '3' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '9', 'img_obj/eZmheAzpFmk.jpg', '0', '3' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '10', 'img_obj/JI1X0HXtrMI.jpg', '0', '3' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '11', 'img_obj/vfM5XS3nf1I.jpg', '0', '3' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '12', 'img_obj/fg-HjB2Zefk.jpg', '0', '3' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '13', 'img_obj/YNIWGIlpySw_gqYTIV5.jpg', '1', '5' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '14', 'img_obj/Dia0gWZF8Y4_HN9CzeM.jpg', '0', '5' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '15', 'img_obj/B06EcW7Kw1w_WXRzOW1.jpg', '0', '5' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '16', 'img_obj/Dti7bY9W_3E_SF3TPo7.jpg', '0', '5' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '17', 'img_obj/fg-HjB2Zefk_aN1Offy.jpg', '1', '6' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '18', 'img_obj/ki3C4dU5xkg.jpg', '0', '6' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '19', 'img_obj/UrUeZCOPl6M.jpg', '0', '6' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '20', 'img_obj/d8YYJydVOdw.jpg', '0', '6' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '21', 'img_obj/77pRo3QiDJA.jpg', '1', '7' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '22', 'img_obj/DMDaJEvsMnw.jpg', '0', '7' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '23', 'img_obj/Z6BwPi8C9g0.jpg', '0', '7' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '24', 'img_obj/DdnQepbXSS8.jpg', '0', '7' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '25', 'img_obj/_oUAQOeLs7E.jpg', '0', '7' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '26', 'img_obj/EiHPyvCp_ik.jpg', '0', '7' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '27', 'img_obj/YNIWGIlpySw_Nlh3Cah.jpg', '1', '9' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '28', 'img_obj/Dia0gWZF8Y4_Tg9tyRN.jpg', '0', '9' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '29', 'img_obj/B06EcW7Kw1w_GzwKON8.jpg', '0', '9' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '30', 'img_obj/Dti7bY9W_3E_yTlKZDY.jpg', '0', '9' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '31', 'img_obj/uyyjMbgAoVE_jkjgFuB.jpg', '0', '9' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '32', 'img_obj/kJbfF4Gr2C4.jpg', '0', '9' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '33', 'img_obj/8wA1hywm7P4.jpg', '0', '9' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '34', 'img_obj/YNIWGIlpySw_BW1F23u.jpg', '1', '10' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '35', 'img_obj/Dia0gWZF8Y4_4D3E8va.jpg', '0', '10' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '36', 'img_obj/B06EcW7Kw1w_yWXJNJ0.jpg', '0', '10' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '37', 'img_obj/Dti7bY9W_3E_xw7fPE6.jpg', '0', '10' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '38', 'img_obj/uyyjMbgAoVE_qOQ63aD.jpg', '0', '10' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '39', 'img_obj/kJbfF4Gr2C4_8rDcnft.jpg', '0', '10' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '40', 'img_obj/8wA1hywm7P4_IV4wEmj.jpg', '0', '10' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '41', 'img_obj/YNIWGIlpySw_mJD5tnL.jpg', '1', '11' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '42', 'img_obj/Dia0gWZF8Y4_ytlZOb9.jpg', '0', '11' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '43', 'img_obj/B06EcW7Kw1w_CK2ORNR.jpg', '0', '11' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '44', 'img_obj/Dti7bY9W_3E_9KkpXGf.jpg', '0', '11' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '45', 'img_obj/uyyjMbgAoVE_Ieo1wne.jpg', '0', '11' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '46', 'img_obj/kJbfF4Gr2C4_rhQMxdQ.jpg', '0', '11' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '47', 'img_obj/8wA1hywm7P4_mB4Sfxg.jpg', '0', '11' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '48', 'img_obj/eZmheAzpFmk_Omud4Zl.jpg', '1', '15' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '49', 'img_obj/JI1X0HXtrMI_eR8mey8.jpg', '0', '15' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '50', 'img_obj/vfM5XS3nf1I_VSfd3Ys.jpg', '0', '15' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '51', 'img_obj/fg-HjB2Zefk_CnnpLnd.jpg', '0', '15' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '52', 'img_obj/ki3C4dU5xkg_dULusH6.jpg', '0', '15' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '53', 'img_obj/1YWpxmEvTo4.jpg', '1', '16' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '54', 'img_obj/1YWpxmEvTo4_V6DgLYj.jpg', '1', '17' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '55', 'img_obj/KvYBQlDO6oc.jpg', '0', '17' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '56', 'img_obj/SCXvBjym6-A.jpg', '0', '17' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '57', 'img_obj/C9uTEDe03LI.jpg', '0', '17' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '58', 'img_obj/3P3yDpekBH4.jpg', '0', '17' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '59', 'img_obj/4CLshwCSYus.jpg', '0', '17' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '60', 'img_obj/cihVr5A3LfI.jpg', '0', '17' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '61', 'img_obj/xUDQyYvjt8Y_idghAZy.jpg', '0', '17' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '62', 'img_obj/YNIWGIlpySw_DptEXXB.jpg', '1', '18' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '63', 'img_obj/KvYBQlDO6oc_UQZ1b9p.jpg', '0', '19' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '64', 'img_obj/YNIWGIlpySw_V6JIHg6.jpg', '1', '20' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '65', 'img_obj/1YWpxmEvTo4_0kpFK17.jpg', '0', '20' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '66', 'img_obj/YNIWGIlpySw_eJC1RKL.jpg', '1', '21' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '67', 'img_obj/KvYBQlDO6oc_JQeW2Hm.jpg', '0', '21' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '68', 'img_obj/KvYBQlDO6oc_OvKcZsO.jpg', '0', '23' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '69', 'img_obj/C9uTEDe03LI_O3SM2Z7.jpg', '0', '23' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '70', 'img_obj/YNIWGIlpySw_YOyRh46.jpg', '1', '24' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '71', 'img_obj/YNIWGIlpySw_gcwFCOt.jpg', '1', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '72', 'img_obj/Dia0gWZF8Y4_2pAIHWr.jpg', '0', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '73', 'img_obj/B06EcW7Kw1w_Zhx21he.jpg', '0', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '74', 'img_obj/Dti7bY9W_3E_4stqf52.jpg', '0', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '75', 'img_obj/uyyjMbgAoVE_2JoPzvI.jpg', '0', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '76', 'img_obj/kJbfF4Gr2C4_fbmco6X.jpg', '0', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '77', 'img_obj/8wA1hywm7P4_yz1mHnA.jpg', '0', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '78', 'img_obj/1YWpxmEvTo4_YfXoMWU.jpg', '0', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '79', 'img_obj/KvYBQlDO6oc_llf7muF.jpg', '0', '25' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '80', 'img_obj/YNIWGIlpySw_6vmOBUa.jpg', '1', '26' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '81', 'img_obj/KvYBQlDO6oc_AmEWXpa.jpg', '0', '26' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '82', 'img_obj/SCXvBjym6-A_BU4HDD3.jpg', '0', '26' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '83', 'img_obj/YNIWGIlpySw_tTIHoLE.jpg', '1', '27' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '84', 'img_obj/Dia0gWZF8Y4_Ri97izt.jpg', '0', '27' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '85', 'img_obj/B06EcW7Kw1w_Vbr3zd6.jpg', '0', '27' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '86', 'img_obj/KvYBQlDO6oc_9zQ588A.jpg', '0', '28' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '87', 'img_obj/C9uTEDe03LI_zSEW4Vv.jpg', '0', '28' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '88', 'img_obj/KvYBQlDO6oc_KsMXcpi.jpg', '1', '29' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '89', 'img_obj/SCXvBjym6-A_78EKM11.jpg', '0', '29' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '90', 'img_obj/zc1fes6yoDU.jpg', '1', '37' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '91', 'img_obj/ZfVLHPMtJ68.jpg', '0', '37' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '92', 'img_obj/ZHtrqfkrRF4.jpg', '0', '37' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '93', 'img_obj/zRJZjJfweA0.jpg', '0', '37' );
INSERT INTO `facility_imagesfacility`(`id`,`image`,`cover`,`album_id`) VALUES ( '94', 'img_obj/zse2rq0aAdo.jpg', '0', '37' );
-- ---------------------------------------------------------


-- Dump data of "facility_phoneowner" ----------------------
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '1', '1' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '2', '2' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '3', '3' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '4', '4' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '5', '5' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '6', '6' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '7', '7' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '8', '8' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '9', '9' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '10', '10' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '11', '11' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '12', '12' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '13', '13' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '14', '14' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '15', '15' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '16', '16' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '17', '17' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '18', '18' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '19', '19' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '20', '20' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '21', '21' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '22', '22' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '23', '23' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '24', '24' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '25', '25' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '26', '26' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '27', '27' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '28', '28' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '29', '29' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '30', '30' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '31', '31' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '32', '32' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '33', '33' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '34', '34' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '35', '35' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '36', '36' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '37', '37' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '38', '38' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '39', '39' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '40', '40' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '41', '41' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '42', '42' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '43', '43' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '44', '44' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '46', '46' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '47', '47' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '49', '49' );
INSERT INTO `facility_phoneowner`(`id`,`phone_id`) VALUES ( '50', '50' );
-- ---------------------------------------------------------


-- Dump data of "facility_typeactuality" -------------------
INSERT INTO `facility_typeactuality`(`id`,`type_actuality`) VALUES ( '1', 'Активно сдаем' );
INSERT INTO `facility_typeactuality`(`id`,`type_actuality`) VALUES ( '2', 'не интересно' );
INSERT INTO `facility_typeactuality`(`id`,`type_actuality`) VALUES ( '3', 'Уточнить данные' );
-- ---------------------------------------------------------


-- Dump data of "facility_typebuilding" --------------------
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '2', 'VIP- новострой' );
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '3', 'Гостинка' );
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '4', 'Малосемейка' );
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '5', 'Новострой' );
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '6', 'Панельный' );
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '7', 'Сотовая' );
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '1', 'Сталинка' );
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '8', 'Хрущевка' );
INSERT INTO `facility_typebuilding`(`id`,`type_building`) VALUES ( '9', 'Чешка' );
-- ---------------------------------------------------------


-- Dump data of "facility_typecondition" -------------------
INSERT INTO `facility_typecondition`(`id`,`type_condition`) VALUES ( '1', 'Занят арендатором' );
INSERT INTO `facility_typecondition`(`id`,`type_condition`) VALUES ( '2', 'Ищем' );
INSERT INTO `facility_typecondition`(`id`,`type_condition`) VALUES ( '3', 'не звонить' );
INSERT INTO `facility_typecondition`(`id`,`type_condition`) VALUES ( '4', 'Нужно узнать' );
-- ---------------------------------------------------------


-- Dump data of "facility_typecontactowner" ----------------
INSERT INTO `facility_typecontactowner`(`id`,`type_contact_owner`) VALUES ( '1', 'Посредник' );
INSERT INTO `facility_typecontactowner`(`id`,`type_contact_owner`) VALUES ( '2', 'Хозяин' );
-- ---------------------------------------------------------


-- Dump data of "facility_typeequipment" -------------------
INSERT INTO `facility_typeequipment`(`id`,`type_equipment`) VALUES ( '3', 'Плазма ТВ' );
INSERT INTO `facility_typeequipment`(`id`,`type_equipment`) VALUES ( '5', 'Стиральная машина полуавтомат' );
INSERT INTO `facility_typeequipment`(`id`,`type_equipment`) VALUES ( '4', 'Стиральная машина(АВТО)' );
INSERT INTO `facility_typeequipment`(`id`,`type_equipment`) VALUES ( '2', 'Телевизор' );
INSERT INTO `facility_typeequipment`(`id`,`type_equipment`) VALUES ( '1', 'Холодильик' );
-- ---------------------------------------------------------


-- Dump data of "facility_typefacility" --------------------
INSERT INTO `facility_typefacility`(`id`,`type_facility`) VALUES ( '3', 'Дом' );
INSERT INTO `facility_typefacility`(`id`,`type_facility`) VALUES ( '2', 'Квартира' );
INSERT INTO `facility_typefacility`(`id`,`type_facility`) VALUES ( '1', 'Комната' );
INSERT INTO `facility_typefacility`(`id`,`type_facility`) VALUES ( '4', 'Участок' );
-- ---------------------------------------------------------


-- Dump data of "facility_typefurniture" -------------------
INSERT INTO `facility_typefurniture`(`id`,`type_furniture`) VALUES ( '1', 'есть' );
INSERT INTO `facility_typefurniture`(`id`,`type_furniture`) VALUES ( '2', 'нет' );
INSERT INTO `facility_typefurniture`(`id`,`type_furniture`) VALUES ( '4', 'новая мебель' );
INSERT INTO `facility_typefurniture`(`id`,`type_furniture`) VALUES ( '3', 'частично' );
-- ---------------------------------------------------------


-- Dump data of "facility_typeheating" ---------------------
INSERT INTO `facility_typeheating`(`id`,`type_heating`) VALUES ( '1', 'Котел' );
INSERT INTO `facility_typeheating`(`id`,`type_heating`) VALUES ( '4', 'Несколько отоплений' );
INSERT INTO `facility_typeheating`(`id`,`type_heating`) VALUES ( '2', 'Центральное' );
INSERT INTO `facility_typeheating`(`id`,`type_heating`) VALUES ( '3', 'электрическое' );
-- ---------------------------------------------------------


-- Dump data of "facility_typelavatory" --------------------
INSERT INTO `facility_typelavatory`(`id`,`type_lavatory`) VALUES ( '1', 'В доме' );
INSERT INTO `facility_typelavatory`(`id`,`type_lavatory`) VALUES ( '3', 'в доме и улице' );
INSERT INTO `facility_typelavatory`(`id`,`type_lavatory`) VALUES ( '2', 'на улице' );
-- ---------------------------------------------------------


-- Dump data of "facility_typenumberofperson" --------------
INSERT INTO `facility_typenumberofperson`(`id`,`type_number_of_persons`) VALUES ( '2', '1 человек' );
INSERT INTO `facility_typenumberofperson`(`id`,`type_number_of_persons`) VALUES ( '5', 'более 4 человека' );
INSERT INTO `facility_typenumberofperson`(`id`,`type_number_of_persons`) VALUES ( '4', 'Не русские' );
INSERT INTO `facility_typenumberofperson`(`id`,`type_number_of_persons`) VALUES ( '1', 'Пара' );
INSERT INTO `facility_typenumberofperson`(`id`,`type_number_of_persons`) VALUES ( '3', 'Семьям с детьми' );
-- ---------------------------------------------------------


-- Dump data of "facility_typeoperations" ------------------
INSERT INTO `facility_typeoperations`(`id`,`type_operations`) VALUES ( '2', 'Аренда' );
INSERT INTO `facility_typeoperations`(`id`,`type_operations`) VALUES ( '1', 'Обмен' );
INSERT INTO `facility_typeoperations`(`id`,`type_operations`) VALUES ( '3', 'Посуточна' );
INSERT INTO `facility_typeoperations`(`id`,`type_operations`) VALUES ( '4', 'Продажа' );
-- ---------------------------------------------------------


-- Dump data of "facility_typeprepayment" ------------------
INSERT INTO `facility_typeprepayment`(`id`,`type_prepayment`) VALUES ( '2', '1 мес' );
INSERT INTO `facility_typeprepayment`(`id`,`type_prepayment`) VALUES ( '3', '2 мес' );
INSERT INTO `facility_typeprepayment`(`id`,`type_prepayment`) VALUES ( '4', '3 мес' );
INSERT INTO `facility_typeprepayment`(`id`,`type_prepayment`) VALUES ( '5', '4 мес' );
INSERT INTO `facility_typeprepayment`(`id`,`type_prepayment`) VALUES ( '6', '5 мес' );
INSERT INTO `facility_typeprepayment`(`id`,`type_prepayment`) VALUES ( '7', '6 мес' );
INSERT INTO `facility_typeprepayment`(`id`,`type_prepayment`) VALUES ( '1', 'нет' );
-- ---------------------------------------------------------


-- Dump data of "facility_typerepairs" ---------------------
INSERT INTO `facility_typerepairs`(`id`,`type_repairs`) VALUES ( '1', 'Евро' );
INSERT INTO `facility_typerepairs`(`id`,`type_repairs`) VALUES ( '2', 'Жилое' );
INSERT INTO `facility_typerepairs`(`id`,`type_repairs`) VALUES ( '3', 'Под ремонт' );
-- ---------------------------------------------------------


-- Dump data of "facility_typerooms" -----------------------
INSERT INTO `facility_typerooms`(`id`,`type_rooms`) VALUES ( '2', 'Раздельные' );
INSERT INTO `facility_typerooms`(`id`,`type_rooms`) VALUES ( '3', 'Смежно-раздельные' );
INSERT INTO `facility_typerooms`(`id`,`type_rooms`) VALUES ( '1', 'Смежные' );
-- ---------------------------------------------------------


-- Dump data of "facility_typethepresenceofhotwater" -------
INSERT INTO `facility_typethepresenceofhotwater`(`id`,`type_the_presence_of_hot_water`) VALUES ( '3', 'нет' );
INSERT INTO `facility_typethepresenceofhotwater`(`id`,`type_the_presence_of_hot_water`) VALUES ( '1', 'становлен бак или колонка' );
INSERT INTO `facility_typethepresenceofhotwater`(`id`,`type_the_presence_of_hot_water`) VALUES ( '2', 'Центральное' );
-- ---------------------------------------------------------


-- Dump data of "facility_typewheretostay" -----------------
INSERT INTO `facility_typewheretostay`(`id`,`type_where_to_stay`) VALUES ( '3', 'Диван' );
INSERT INTO `facility_typewheretostay`(`id`,`type_where_to_stay`) VALUES ( '4', 'Диван расклад.' );
INSERT INTO `facility_typewheretostay`(`id`,`type_where_to_stay`) VALUES ( '1', 'Кровать' );
INSERT INTO `facility_typewheretostay`(`id`,`type_where_to_stay`) VALUES ( '2', 'Кровать двухспалка' );
-- ---------------------------------------------------------


-- Dump data of "facility_typewindows" ---------------------
INSERT INTO `facility_typewindows`(`id`,`type_windows`) VALUES ( '2', 'деревянные' );
INSERT INTO `facility_typewindows`(`id`,`type_windows`) VALUES ( '4', 'Не установлены' );
INSERT INTO `facility_typewindows`(`id`,`type_windows`) VALUES ( '1', 'пластиковые' );
INSERT INTO `facility_typewindows`(`id`,`type_windows`) VALUES ( '3', 'Частично' );
-- ---------------------------------------------------------


-- Dump data of "makler_makler" ----------------------------
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '10', '2222', 'awdwad', '2', '964874353', 'http://wda.com', 'awdw@sfdsfds.wqewq', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '11', 'dd', 'wadad', '2', '222', 'http://dsfsdf.jkjkj', 'dfsf@dsdfs.klk', '2' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '12', 'qewqeq', 'qweqeq', '1', '222222222', 'http://sdsf.tttrghtr', 'dfgfdg@fgdg.hukk', '3' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '13', '111', 'wadad', '2', '2122123', 'http://dsfsdf.jkjkj', 'dfsf@dsdfs.klk', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '14', 'asdasdsa', 'wadad', '1', '2122123', 'http://dsfsdf.jkjkj', 'dfsf@dsdfs.klk', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '15', 'awdwada', 'awdwad', '2', '964874353', 'http://wda.com', 'awdw@sfdsfds.wqewq', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '16', 'werewr', 'werewr', '2', '444', 'http://dfsfsd.gfg', 'werwer@lkl.fsef', '3' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '17', 'wewe', 'qwewqe', '2', '213131', 'http://dsffsd.jkjk', 'ertertrt@dgdr.rte', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '18', 'erwrwe', 'wewee', '2', '2313', 'http://sdffd.thth', 'rgdg@rterg.jt', '2' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '19', 'awdwad', 'awdwad', '2', '2313', 'http://dfsdfd.yyh', 'ryrt@rtrt.uku', '2' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '20', 'qweqe', 'wqeqwe', '1', '23123', 'http://efsf.hth', 'tyhhh@tgr.yttj', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '21', 'adawda', 'wdadw', '1', '2313', 'http://rgttrgrr.yhyth', 'thr@ertg.uj', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '22', 'awad', 'awdwd', '1', '23123', 'http://esfsefs.gjy', 'rgg@grg.yj', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '23', 'rtgtrg', 'rtgtrg', '1', '543453', 'http://tghtfh.tyjj', 'rtrh@grg.ytj', '1' );
INSERT INTO `makler_makler`(`id`,`name`,`agency`,`white_black_id`,`phone`,`site`,`email`,`cooperation_id`) VALUES ( '24', 'werewr', 'werewr', '1', '234234', 'http://erer.thyt', 'rtyryr@rgrgg.rtgrg', '1' );
-- ---------------------------------------------------------


-- Dump data of "makler_typecooperations" ------------------
INSERT INTO `makler_typecooperations`(`id`,`type_cooperation`) VALUES ( '1', 'Постоянно' );
INSERT INTO `makler_typecooperations`(`id`,`type_cooperation`) VALUES ( '2', 'Иногда' );
INSERT INTO `makler_typecooperations`(`id`,`type_cooperation`) VALUES ( '3', 'Редко ' );
-- ---------------------------------------------------------


-- Dump data of "makler_typewhiteblack" --------------------
INSERT INTO `makler_typewhiteblack`(`id`,`type_white_black`) VALUES ( '1', 'Белый' );
INSERT INTO `makler_typewhiteblack`(`id`,`type_white_black`) VALUES ( '2', 'Черный' );
-- ---------------------------------------------------------


-- Dump data of "notes_notes" ------------------------------
INSERT INTO `notes_notes`(`id`,`text`,`name`,`date`) VALUES ( '1', 'rtgegegertrtet', 'rtgegegert...', '2016-07-12 07:07:29.705827' );
INSERT INTO `notes_notes`(`id`,`text`,`name`,`date`) VALUES ( '2', 'rtetret', 'rtetret', '2016-07-12 07:07:42.704899' );
INSERT INTO `notes_notes`(`id`,`text`,`name`,`date`) VALUES ( '3', 'rtetretawdawd', 'rtetretawd...', '2016-07-12 07:07:50.819555' );
INSERT INTO `notes_notes`(`id`,`text`,`name`,`date`) VALUES ( '4', 'efesfsf', 'efesfsf', '2016-07-12 07:08:02.791359' );
INSERT INTO `notes_notes`(`id`,`text`,`name`,`date`) VALUES ( '5', 'jioijoi
', 'jioijoi
', '2016-07-22 14:09:07.722149' );
INSERT INTO `notes_notes`(`id`,`text`,`name`,`date`) VALUES ( '6', 'yukkk', 'yukkk', '2016-08-04 22:11:50.391661' );
-- ---------------------------------------------------------


-- Dump data of "send_messege_user_usermessage" ------------
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '1', 'awdwddsererererererer', '2016-07-23 02:39:11.104599', '0', '1', '2' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '2', 'awdwdwad', '2016-07-23 02:39:11.104599', '0', '1', '2' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '3', 'awdwdwad', '2016-07-23 02:39:11.104599', '0', '1', '3' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '4', 'awdawdwd', '2016-07-23 02:39:11.104599', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '5', 'awdwdwdgfgawdwdawdwd', '2016-07-23 02:39:11.104599', '0', '2', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '6', 'awdwdwdgfgawdwdawdwdsefsefesf', '2016-07-23 02:39:11.104599', '0', '1', '2' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '7', 'awdwadaawdwdwadawd', '2016-07-23 03:05:50.898821', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '8', 'awdwadd', '2016-07-23 03:20:25.662571', '0', '2', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '9', 'awdwaddawd', '2016-07-23 03:21:32.916818', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '10', 'awdwaddawdqsqS', '2016-07-23 03:21:45.190241', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '11', 'awdwaddawdqsqSawdawdwadddwdwdwdwdwdwda awdwadwdwdawdawwadwdwad awdawdwadawdwdwadwad awdawdawdadwadawdw awdawdwadawdawdawwd awdawdwdwdwad awdwadwadaddad awdawdadaad', '2016-07-23 03:36:37.364770', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '12', 'esfesfsef', '2016-07-23 04:13:25.202911', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '13', 'esfesfsef', '2016-07-23 04:13:25.241002', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '14', 'esfesfsef', '2016-07-23 04:13:25.295430', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '15', 'esfesfsef', '2016-07-23 04:13:25.325108', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '16', 'esfesfsef', '2016-07-23 04:15:12.085463', '0', '1', '3' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '17', 'esfesfsef', '2016-07-23 04:15:12.113862', '0', '1', '3' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '18', 'esfesfsef', '2016-07-23 04:15:12.158329', '0', '1', '3' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '19', 'esfesfsef', '2016-07-23 04:16:09.211258', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '20', 'esfesfsef', '2016-07-23 04:16:09.334371', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '21', 'esfesfsef', '2016-07-23 04:16:09.371144', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '22', 'esfesfsef', '2016-07-23 04:17:56.257328', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '23', 'esfesfsef', '2016-07-23 04:17:56.400421', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '24', 'esfesfsef', '2016-07-23 04:17:56.443616', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '25', 'esfesfsef', '2016-07-23 04:18:41.459704', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '26', 'esfesfsef', '2016-07-23 04:18:41.590137', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '27', 'esfesfsef', '2016-07-23 04:18:41.623711', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '28', 'wdwd', '2016-07-23 04:20:33.512531', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '29', 'wdwd', '2016-07-23 04:20:33.627542', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '30', 'wdwd', '2016-07-23 04:20:33.660184', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '31', 'wdwd', '2016-07-23 04:21:34.263315', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '32', 'wdwd', '2016-07-23 04:21:34.381973', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '33', 'wdwd', '2016-07-23 04:23:09.361261', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '34', 'wdwd', '2016-07-23 04:23:09.487425', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '35', 'wdwd', '2016-07-23 04:24:18.442872', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '36', 'wdwd', '2016-07-23 04:24:18.559191', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '37', 'wdwd', '2016-07-23 04:24:18.603639', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '38', 'wdwd', '2016-07-23 04:36:54.219655', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '39', 'wdwd', '2016-07-23 04:36:54.341250', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '40', 'wdwd', '2016-07-23 04:36:54.365998', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '41', 'wdwd', '2016-07-23 04:37:58.960838', '0', '1', '2' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '42', 'wdwd', '2016-07-23 04:37:59.073852', '0', '1', '2' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '43', 'awdawdw', '2016-07-25 01:13:30.495760', '0', '1', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '44', 'hello', '2016-07-26 01:48:53.850123', '0', '1', '2' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '45', 'как там?', '2016-07-26 01:49:24.357873', '0', '2', '1' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '46', 'ok', '2016-07-26 01:49:59.246316', '0', '1', '2' );
INSERT INTO `send_messege_user_usermessage`(`id`,`message`,`time_message`,`read`,`from_user_id`,`user_message_id`) VALUES ( '47', 'rere', '2016-08-04 22:10:53.169989', '0', '2', '1' );
-- ---------------------------------------------------------


-- Dump data of "setting_globall_franshise" ----------------
INSERT INTO `setting_globall_franshise`(`id`,`franshise`) VALUES ( '1', 'gek.od.ua' );
-- ---------------------------------------------------------


-- Dump data of "setting_globall_franshisesity" ------------
INSERT INTO `setting_globall_franshisesity`(`id`,`sity`) VALUES ( '1', 'Киев' );
-- ---------------------------------------------------------


-- Dump data of "setting_globall_listnationalcarrency" -----
INSERT INTO `setting_globall_listnationalcarrency`(`id`,`currency_glob`) VALUES ( '1', 'грн' );
INSERT INTO `setting_globall_listnationalcarrency`(`id`,`currency_glob`) VALUES ( '2', 'тнг' );
INSERT INTO `setting_globall_listnationalcarrency`(`id`,`currency_glob`) VALUES ( '3', 'руб' );
-- ---------------------------------------------------------


-- Dump data of "setting_globall_nationalcarrency" ---------
INSERT INTO `setting_globall_nationalcarrency`(`id`,`currency`) VALUES ( '1', 'грн' );
INSERT INTO `setting_globall_nationalcarrency`(`id`,`currency`) VALUES ( '2', '$' );
-- ---------------------------------------------------------


-- Dump data of "setting_street_district" ------------------
INSERT INTO `setting_street_district`(`id`,`district`) VALUES ( '2', 'Винники' );
INSERT INTO `setting_street_district`(`id`,`district`) VALUES ( '1', 'Галицький' );
-- ---------------------------------------------------------


-- Dump data of "setting_street_street" --------------------
INSERT INTO `setting_street_street`(`id`,`street`,`full_street`,`type_street_group_id`) VALUES ( '1', 'Коцюбинского', 'ул.Коцюбинского', '1' );
INSERT INTO `setting_street_street`(`id`,`street`,`full_street`,`type_street_group_id`) VALUES ( '2', 'Шевченка', 'ул.Шевченка', '1' );
-- ---------------------------------------------------------


-- Dump data of "setting_street_subway" --------------------
-- ---------------------------------------------------------


-- Dump data of "setting_street_typesstreet" ---------------
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '1', 'Улица', 'ул.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '2', 'Бульвар', 'бул.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '3', 'Набережная', 'наб.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '4', 'Аллея', 'аллея.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '5', 'Проспект', 'просп.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '6', 'Тупик', 'туп.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '7', 'Дорога', 'дор.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '8', 'Магистраль', 'маг.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '9', 'Переулок', 'пер.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '10', 'Площадь', 'пл.' );
INSERT INTO `setting_street_typesstreet`(`id`,`type_street`,`short_name`) VALUES ( '11', 'Шоссе', 'ш.' );
-- ---------------------------------------------------------


-- Dump data of "setting_superadmin_alltocall" -------------
INSERT INTO `setting_superadmin_alltocall`(`id`,`phone`,`email`,`skype`,`group_vk`) VALUES ( '1', '55555', 'eee@eee.eee', 'dsfsfsd32424', 'sdasads' );
INSERT INTO `setting_superadmin_alltocall`(`id`,`phone`,`email`,`skype`,`group_vk`) VALUES ( '2', '22222', 'qweqds@fdsf.sefsf', 'sefesf', 'sefesf' );
INSERT INTO `setting_superadmin_alltocall`(`id`,`phone`,`email`,`skype`,`group_vk`) VALUES ( '3', '2222', 'qweqds@fdsf.sefsf', 'sefesf', 'sefesf' );
-- ---------------------------------------------------------


-- Dump data of "single_object_showsarendator" -------------
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '5', '2', '2', '3' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '6', '2', '2', '7' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '7', '3', '3', '7' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '8', '7', '3', '3' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '9', '7', '2', '7' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '10', '22', '2', '3' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '11', '9', '2', '3' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '12', '3', '2', '3' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '13', '2', '2', '50' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '14', '13', '3', '50' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '15', '14', '2', '50' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '16', '27', '2', '50' );
INSERT INTO `single_object_showsarendator`(`id`,`array_arendator_id`,`type_shows_arendator_id`,`array_cont_ower_id`) VALUES ( '17', '2', '3', '5' );
-- ---------------------------------------------------------


-- Dump data of "single_object_showsbuyer" -----------------
INSERT INTO `single_object_showsbuyer`(`id`,`array_buyer_id`,`array_cont_ower_id`,`type_shows_buyer_id`) VALUES ( '1', '2', '5', '2' );
-- ---------------------------------------------------------


-- Dump data of "single_object_singleobjcomments" ----------
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '1', 'wqqeqewqe', '2016-07-31 01:11:14.218601', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '3', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '2', 'efwff', '2016-07-31 01:11:32.272043', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '3', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '41', '11111efsfawdadadefsfeawdwadawdawdwadwaddawdwdawdad', '2016-08-02 00:47:37.725684', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '42', '11111efsfawdadadefsfeawdwadawdawdwadwaddawdwdawdad', '2016-08-02 00:47:39.448801', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '43', '11111efsfawdadadefsfeawdwadawdawdwadwaddawdwdawdad', '2016-08-02 00:47:40.779929', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '44', '11111efsfawdadadefsfeawdwadawdawdwadwaddawdwdawdad', '2016-08-02 00:47:42.229507', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '45', '11', '2016-08-02 00:48:07.827934', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '46', 'awdwa', '2016-08-02 00:55:49.888693', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '47', 'awdwaawdwad', '2016-08-02 01:02:26.994992', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '48', 'qqq', '2016-08-02 01:05:28.881726', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'arendators' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '49', 'www', '2016-08-02 01:05:58.982835', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'arendators' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '50', 'dasdas', '2016-08-02 01:11:04.192902', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'arendators' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '52', '11asdasa', '2016-08-02 01:17:30.970525', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '53', 'awdwad', '2016-08-02 01:17:39.133670', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '50', 'arendators' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '54', 'yjtjt', '2016-08-02 01:19:09.620400', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '2', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '55', 'sefsfse', '2016-08-02 05:27:28.558335', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '5', 'bayers' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '56', 'sefsfsesefef', '2016-08-02 05:27:31.419643', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '5', 'bayers' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '57', 'sefsfsesefefseffe', '2016-08-02 05:27:33.873121', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '5', 'bayers' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '58', 'adawdwad', '2016-08-02 05:27:58.572103', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '5', 'bayers' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '60', 'awdwddw', '2016-08-02 05:28:43.581804', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '5', 'bayers' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '61', 'awdwddw', '2016-08-02 05:29:28.342097', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '5', 'bayers' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '62', 'awdawdwad', '2016-08-02 05:29:59.605034', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '5', 'buyers' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '64', 'regegg', '2016-08-02 05:31:00.223730', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '5', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '65', 'rdgrdzgg', '2016-08-02 05:31:48.079481', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '1', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '66', 'rdgrdzggdrgdr', '2016-08-02 05:31:51.116346', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '1', 'comments' );
INSERT INTO `single_object_singleobjcomments`(`id`,`comment`,`date_comment`,`author_comment`,`image`,`obj_comments_id`,`type_tabs`) VALUES ( '67', 'rdgrdzggdrgdrdrgrdggd', '2016-08-02 05:31:54.966470', 'Андрій Варунок', 'avatar/DMDaJEvsMnw.jpg', '1', 'comments' );
-- ---------------------------------------------------------


-- Dump data of "single_object_tie" ------------------------
INSERT INTO `single_object_tie`(`id`,`tie_cont_owner_id`) VALUES ( '1', '3' );
INSERT INTO `single_object_tie`(`id`,`tie_cont_owner_id`) VALUES ( '2', '7' );
INSERT INTO `single_object_tie`(`id`,`tie_cont_owner_id`) VALUES ( '3', '50' );
-- ---------------------------------------------------------


-- Dump data of "single_object_tie_tie_arenda" -------------
INSERT INTO `single_object_tie_tie_arenda`(`id`,`tie_id`,`arendator_id`) VALUES ( '56', '1', '3' );
INSERT INTO `single_object_tie_tie_arenda`(`id`,`tie_id`,`arendator_id`) VALUES ( '2', '2', '3' );
INSERT INTO `single_object_tie_tie_arenda`(`id`,`tie_id`,`arendator_id`) VALUES ( '4', '2', '7' );
INSERT INTO `single_object_tie_tie_arenda`(`id`,`tie_id`,`arendator_id`) VALUES ( '17', '2', '8' );
INSERT INTO `single_object_tie_tie_arenda`(`id`,`tie_id`,`arendator_id`) VALUES ( '1751', '3', '27' );
-- ---------------------------------------------------------


-- Dump data of "single_object_tiebuyer" -------------------
INSERT INTO `single_object_tiebuyer`(`id`,`tie_cont_owner_id`) VALUES ( '1', '5' );
-- ---------------------------------------------------------


-- Dump data of "single_object_tiebuyer_tie_buye" ----------
-- ---------------------------------------------------------


-- Dump data of "single_object_typeshows" ------------------
INSERT INTO `single_object_typeshows`(`id`,`type_shows`) VALUES ( '1', 'Не предлагали' );
INSERT INTO `single_object_typeshows`(`id`,`type_shows`) VALUES ( '3', 'Ок' );
INSERT INTO `single_object_typeshows`(`id`,`type_shows`) VALUES ( '2', 'Предлагали' );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_arendator_1424b023" -------------
CREATE INDEX `arendator_arendator_1424b023` USING BTREE ON `arendator_arendator`( `type_stage_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_arendator_30245de1" -------------
CREATE INDEX `arendator_arendator_30245de1` USING BTREE ON `arendator_arendator`( `number_of_persons_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_arendator_8aa1fa79" -------------
CREATE INDEX `arendator_arendator_8aa1fa79` USING BTREE ON `arendator_arendator`( `type_state_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_arendator_91f3a6d5" -------------
CREATE INDEX `arendator_arendator_91f3a6d5` USING BTREE ON `arendator_arendator`( `type_client_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_aren_district_id_def96cc_fk_setting_street_district_id" 
CREATE INDEX `arendator_aren_district_id_def96cc_fk_setting_street_district_id` USING BTREE ON `arendator_arendator_district_obj`( `district_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_arendator_loy_userfullname_id_71a5b16c_fk_auth_user_id" 
CREATE INDEX `arendator_arendator_loy_userfullname_id_71a5b16c_fk_auth_user_id` USING BTREE ON `arendator_arendator_loyality`( `userfullname_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_are_typerepairs_id_7ea0ed42_fk_facility_typerepairs_id" 
CREATE INDEX `arendator_are_typerepairs_id_7ea0ed42_fk_facility_typerepairs_id` USING BTREE ON `arendator_arendator_repairs`( `typerepairs_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_arendator_rie_userfullname_id_24eb85e7_fk_auth_user_id" 
CREATE INDEX `arendator_arendator_rie_userfullname_id_24eb85e7_fk_auth_user_id` USING BTREE ON `arendator_arendator_rieltor`( `userfullname_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_arendat_typerooms_id_212ff8c6_fk_facility_typerooms_id" 
CREATE INDEX `arendator_arendat_typerooms_id_212ff8c6_fk_facility_typerooms_id` USING BTREE ON `arendator_arendator_room`( `typerooms_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "arendator_a_typefacility_id_2166b9a7_fk_facility_typefacility_id" 
CREATE INDEX `arendator_a_typefacility_id_2166b9a7_fk_facility_typefacility_id` USING BTREE ON `arendator_arendator_type_building_data`( `typefacility_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "auth_group_permissi_permission_id_23962d04_fk_auth_permission_id" 
CREATE INDEX `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` USING BTREE ON `auth_group_permissions`( `permission_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "auth_user_groups_group_id_30a071c9_fk_auth_group_id" 
CREATE INDEX `auth_user_groups_group_id_30a071c9_fk_auth_group_id` USING BTREE ON `auth_user_groups`( `group_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id" 
CREATE INDEX `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` USING BTREE ON `auth_user_user_permissions`( `permission_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_1424b023" ---------------------
CREATE INDEX `buyer_buyer_1424b023` USING BTREE ON `buyer_buyer`( `type_stage_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_30245de1" ---------------------
CREATE INDEX `buyer_buyer_30245de1` USING BTREE ON `buyer_buyer`( `number_of_persons_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_8aa1fa79" ---------------------
CREATE INDEX `buyer_buyer_8aa1fa79` USING BTREE ON `buyer_buyer`( `type_state_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_91f3a6d5" ---------------------
CREATE INDEX `buyer_buyer_91f3a6d5` USING BTREE ON `buyer_buyer`( `type_client_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_dis_district_id_15afc0_fk_setting_street_district_id" 
CREATE INDEX `buyer_buyer_dis_district_id_15afc0_fk_setting_street_district_id` USING BTREE ON `buyer_buyer_district_obj`( `district_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_loyality_userfullname_id_6fdc4680_fk_auth_user_id" 
CREATE INDEX `buyer_buyer_loyality_userfullname_id_6fdc4680_fk_auth_user_id` USING BTREE ON `buyer_buyer_loyality`( `userfullname_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_r_typerepairs_id_3dd5ef6e_fk_facility_typerepairs_id" 
CREATE INDEX `buyer_buyer_r_typerepairs_id_3dd5ef6e_fk_facility_typerepairs_id` USING BTREE ON `buyer_buyer_repairs`( `typerepairs_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_rieltor_userfullname_id_7c374cf5_fk_auth_user_id" 
CREATE INDEX `buyer_buyer_rieltor_userfullname_id_7c374cf5_fk_auth_user_id` USING BTREE ON `buyer_buyer_rieltor`( `userfullname_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_room_typerooms_id_546a5ab6_fk_facility_typerooms_id" 
CREATE INDEX `buyer_buyer_room_typerooms_id_546a5ab6_fk_facility_typerooms_id` USING BTREE ON `buyer_buyer_room`( `typerooms_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "buyer_buyer_typefacility_id_59acec3d_fk_facility_typefacility_id" 
CREATE INDEX `buyer_buyer_typefacility_id_59acec3d_fk_facility_typefacility_id` USING BTREE ON `buyer_buyer_type_building_data`( `typefacility_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "django_admin_log_user_id_1c5f563_fk_auth_user_id" 
CREATE INDEX `django_admin_log_user_id_1c5f563_fk_auth_user_id` USING BTREE ON `django_admin_log`( `user_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "django_admin__content_type_id_5151027a_fk_django_content_type_id" 
CREATE INDEX `django_admin__content_type_id_5151027a_fk_django_content_type_id` USING BTREE ON `django_admin_log`( `content_type_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "django_session_de54fa62" ------------------
CREATE INDEX `django_session_de54fa62` USING BTREE ON `django_session`( `expire_date` );
-- ---------------------------------------------------------


-- CREATE INDEX "extuser_myuser_835f81f4" ------------------
CREATE INDEX `extuser_myuser_835f81f4` USING BTREE ON `extuser_myuser`( `type_user_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_08828ca1" ----
CREATE INDEX `facility_addressfacilitydata_08828ca1` USING BTREE ON `facility_addressfacilitydata`( `windows_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_0ecb3c0e" ----
CREATE INDEX `facility_addressfacilitydata_0ecb3c0e` USING BTREE ON `facility_addressfacilitydata`( `prepayment_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_111aa822" ----
CREATE INDEX `facility_addressfacilitydata_111aa822` USING BTREE ON `facility_addressfacilitydata`( `the_presence_of_hot_water_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_2c7d5721" ----
CREATE INDEX `facility_addressfacilitydata_2c7d5721` USING BTREE ON `facility_addressfacilitydata`( `currency_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_543cd5e7" ----
CREATE INDEX `facility_addressfacilitydata_543cd5e7` USING BTREE ON `facility_addressfacilitydata`( `heating_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_600bd00e" ----
CREATE INDEX `facility_addressfacilitydata_600bd00e` USING BTREE ON `facility_addressfacilitydata`( `lavatory_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_676c19ae" ----
CREATE INDEX `facility_addressfacilitydata_676c19ae` USING BTREE ON `facility_addressfacilitydata`( `type_building_data_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_81506161" ----
CREATE INDEX `facility_addressfacilitydata_81506161` USING BTREE ON `facility_addressfacilitydata`( `subway_obj_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_8273f993" ----
CREATE INDEX `facility_addressfacilitydata_8273f993` USING BTREE ON `facility_addressfacilitydata`( `room_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_a0e145f1" ----
CREATE INDEX `facility_addressfacilitydata_a0e145f1` USING BTREE ON `facility_addressfacilitydata`( `street_obj_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_a2d3ec93" ----
CREATE INDEX `facility_addressfacilitydata_a2d3ec93` USING BTREE ON `facility_addressfacilitydata`( `district_obj_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_bb531585" ----
CREATE INDEX `facility_addressfacilitydata_bb531585` USING BTREE ON `facility_addressfacilitydata`( `condition_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_c8fd6106" ----
CREATE INDEX `facility_addressfacilitydata_c8fd6106` USING BTREE ON `facility_addressfacilitydata`( `furniture_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_ddd1ae4a" ----
CREATE INDEX `facility_addressfacilitydata_ddd1ae4a` USING BTREE ON `facility_addressfacilitydata`( `type_facilit_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_e6309a71" ----
CREATE INDEX `facility_addressfacilitydata_e6309a71` USING BTREE ON `facility_addressfacilitydata`( `repairs_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilitydata_faa1605c" ----
CREATE INDEX `facility_addressfacilitydata_faa1605c` USING BTREE ON `facility_addressfacilitydata`( `actuality_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_a_typeequipment_id_78f3fa7_fk_facility_typeequipment_id" 
CREATE INDEX `facility_a_typeequipment_id_78f3fa7_fk_facility_typeequipment_id` USING BTREE ON `facility_addressfacilitydata_equipment`( `typeequipment_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facilit_typeoperations_id_2f116a57_fk_facility_typeoperations_id" 
CREATE INDEX `facilit_typeoperations_id_2f116a57_fk_facility_typeoperations_id` USING BTREE ON `facility_addressfacilitydata_list_operations`( `typeoperations_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilit_userfullname_id_171914c7_fk_auth_user_id" 
CREATE INDEX `facility_addressfacilit_userfullname_id_171914c7_fk_auth_user_id` USING BTREE ON `facility_addressfacilitydata_loyality`( `userfullname_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "D0b4dbbf1edee5b153e1d7edd3556971" ---------
CREATE INDEX `D0b4dbbf1edee5b153e1d7edd3556971` USING BTREE ON `facility_addressfacilitydata_number_of_persons`( `typenumberofperson_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_addressfacilit_userfullname_id_62adb38a_fk_auth_user_id" 
CREATE INDEX `facility_addressfacilit_userfullname_id_62adb38a_fk_auth_user_id` USING BTREE ON `facility_addressfacilitydata_rieltor`( `userfullname_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facil_typewheretostay_id_38dbda49_fk_facility_typewheretostay_id" 
CREATE INDEX `facil_typewheretostay_id_38dbda49_fk_facility_typewheretostay_id` USING BTREE ON `facility_addressfacilitydata_where_to_stay`( `typewheretostay_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facili_contact_owner_id_4c12ae9b_fk_facility_typecontactowner_id" 
CREATE INDEX `facili_contact_owner_id_4c12ae9b_fk_facility_typecontactowner_id` USING BTREE ON `facility_contactowner`( `contact_owner_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_imagesfacility_95c3b9df" ---------
CREATE INDEX `facility_imagesfacility_95c3b9df` USING BTREE ON `facility_imagesfacility`( `album_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "facility_phoneowner_83a29540" -------------
CREATE INDEX `facility_phoneowner_83a29540` USING BTREE ON `facility_phoneowner`( `phone_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "makler_makler_919b60c2" -------------------
CREATE INDEX `makler_makler_919b60c2` USING BTREE ON `makler_makler`( `cooperation_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "makler_makler_white_black_id_65fdd398_uniq" 
CREATE INDEX `makler_makler_white_black_id_65fdd398_uniq` USING BTREE ON `makler_makler`( `white_black_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "send_messege_user_userm_user_message_id_7d28ca11_fk_auth_user_id" 
CREATE INDEX `send_messege_user_userm_user_message_id_7d28ca11_fk_auth_user_id` USING BTREE ON `send_messege_user_usermessage`( `user_message_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "send_messege_use_from_user_id_44d5cd5d_fk_extuser_myuser_user_id" 
CREATE INDEX `send_messege_use_from_user_id_44d5cd5d_fk_extuser_myuser_user_id` USING BTREE ON `send_messege_user_usermessage`( `from_user_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "setting_street_street_4e5d5eb5" -----------
CREATE INDEX `setting_street_street_4e5d5eb5` USING BTREE ON `setting_street_street`( `type_street_group_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "single_object_showsarendator_d3ac9630" ----
CREATE INDEX `single_object_showsarendator_d3ac9630` USING BTREE ON `single_object_showsarendator`( `array_cont_ower_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "single_obj_array_arendator_id_60b46730_fk_arendator_arendator_id" 
CREATE INDEX `single_obj_array_arendator_id_60b46730_fk_arendator_arendator_id` USING BTREE ON `single_object_showsarendator`( `array_arendator_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "s_type_shows_arendator_id_7ab11ee7_fk_single_object_typeshows_id" 
CREATE INDEX `s_type_shows_arendator_id_7ab11ee7_fk_single_object_typeshows_id` USING BTREE ON `single_object_showsarendator`( `type_shows_arendator_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "D46e55318e10725029269838c702b2d5" ---------
CREATE INDEX `D46e55318e10725029269838c702b2d5` USING BTREE ON `single_object_showsbuyer`( `array_cont_ower_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "single_object_showsbuye_array_buyer_id_2821354_fk_buyer_buyer_id" 
CREATE INDEX `single_object_showsbuye_array_buyer_id_2821354_fk_buyer_buyer_id` USING BTREE ON `single_object_showsbuyer`( `array_buyer_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "singl_type_shows_buyer_id_3b9bd4f3_fk_single_object_typeshows_id" 
CREATE INDEX `singl_type_shows_buyer_id_3b9bd4f3_fk_single_object_typeshows_id` USING BTREE ON `single_object_showsbuyer`( `type_shows_buyer_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "D846772484879773a0ccee0c444553a2" ---------
CREATE INDEX `D846772484879773a0ccee0c444553a2` USING BTREE ON `single_object_singleobjcomments`( `obj_comments_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "single_object_ti_arendator_id_4affdbcb_fk_arendator_arendator_id" 
CREATE INDEX `single_object_ti_arendator_id_4affdbcb_fk_arendator_arendator_id` USING BTREE ON `single_object_tie_tie_arenda`( `arendator_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "single_object_tiebuyer_tie_b_buyer_id_30fbc760_fk_buyer_buyer_id" 
CREATE INDEX `single_object_tiebuyer_tie_b_buyer_id_30fbc760_fk_buyer_buyer_id` USING BTREE ON `single_object_tiebuyer_tie_buye`( `buyer_id` );
-- ---------------------------------------------------------


-- CREATE LINK "a_number_of_persons_id_7a5d4ed_fk_facility_typenumberofperson_id" 
ALTER TABLE `arendator_arendator`
	ADD CONSTRAINT `a_number_of_persons_id_7a5d4ed_fk_facility_typenumberofperson_id` FOREIGN KEY ( `number_of_persons_id` )
	REFERENCES `facility_typenumberofperson`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_aren_type_client_id_3ea410b_fk_arendator_typeclient_id" 
ALTER TABLE `arendator_arendator`
	ADD CONSTRAINT `arendator_aren_type_client_id_3ea410b_fk_arendator_typeclient_id` FOREIGN KEY ( `type_client_id` )
	REFERENCES `arendator_typeclient`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arend_type_stage_id_7e672efb_fk_arendator_typestage_id" 
ALTER TABLE `arendator_arendator`
	ADD CONSTRAINT `arendator_arend_type_stage_id_7e672efb_fk_arendator_typestage_id` FOREIGN KEY ( `type_stage_id` )
	REFERENCES `arendator_typestage`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arend_type_state_id_6fa45370_fk_arendator_typestate_id" 
ALTER TABLE `arendator_arendator`
	ADD CONSTRAINT `arendator_arend_type_state_id_6fa45370_fk_arendator_typestate_id` FOREIGN KEY ( `type_state_id` )
	REFERENCES `arendator_typestate`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_aren_district_id_def96cc_fk_setting_street_district_id" 
ALTER TABLE `arendator_arendator_district_obj`
	ADD CONSTRAINT `arendator_aren_district_id_def96cc_fk_setting_street_district_id` FOREIGN KEY ( `district_id` )
	REFERENCES `setting_street_district`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arenda_arendator_id_58766c5b_fk_arendator_arendator_id" 
ALTER TABLE `arendator_arendator_district_obj`
	ADD CONSTRAINT `arendator_arenda_arendator_id_58766c5b_fk_arendator_arendator_id` FOREIGN KEY ( `arendator_id` )
	REFERENCES `arendator_arendator`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arendat_arendator_id_a1497ea_fk_arendator_arendator_id" 
ALTER TABLE `arendator_arendator_loyality`
	ADD CONSTRAINT `arendator_arendat_arendator_id_a1497ea_fk_arendator_arendator_id` FOREIGN KEY ( `arendator_id` )
	REFERENCES `arendator_arendator`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arendator_loy_userfullname_id_71a5b16c_fk_auth_user_id" 
ALTER TABLE `arendator_arendator_loyality`
	ADD CONSTRAINT `arendator_arendator_loy_userfullname_id_71a5b16c_fk_auth_user_id` FOREIGN KEY ( `userfullname_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_are_typerepairs_id_7ea0ed42_fk_facility_typerepairs_id" 
ALTER TABLE `arendator_arendator_repairs`
	ADD CONSTRAINT `arendator_are_typerepairs_id_7ea0ed42_fk_facility_typerepairs_id` FOREIGN KEY ( `typerepairs_id` )
	REFERENCES `facility_typerepairs`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arenda_arendator_id_681c881a_fk_arendator_arendator_id" 
ALTER TABLE `arendator_arendator_repairs`
	ADD CONSTRAINT `arendator_arenda_arendator_id_681c881a_fk_arendator_arendator_id` FOREIGN KEY ( `arendator_id` )
	REFERENCES `arendator_arendator`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arenda_arendator_id_5eb9cea5_fk_arendator_arendator_id" 
ALTER TABLE `arendator_arendator_rieltor`
	ADD CONSTRAINT `arendator_arenda_arendator_id_5eb9cea5_fk_arendator_arendator_id` FOREIGN KEY ( `arendator_id` )
	REFERENCES `arendator_arendator`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arendator_rie_userfullname_id_24eb85e7_fk_auth_user_id" 
ALTER TABLE `arendator_arendator_rieltor`
	ADD CONSTRAINT `arendator_arendator_rie_userfullname_id_24eb85e7_fk_auth_user_id` FOREIGN KEY ( `userfullname_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arenda_arendator_id_21e428f6_fk_arendator_arendator_id" 
ALTER TABLE `arendator_arendator_room`
	ADD CONSTRAINT `arendator_arenda_arendator_id_21e428f6_fk_arendator_arendator_id` FOREIGN KEY ( `arendator_id` )
	REFERENCES `arendator_arendator`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arendat_typerooms_id_212ff8c6_fk_facility_typerooms_id" 
ALTER TABLE `arendator_arendator_room`
	ADD CONSTRAINT `arendator_arendat_typerooms_id_212ff8c6_fk_facility_typerooms_id` FOREIGN KEY ( `typerooms_id` )
	REFERENCES `facility_typerooms`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_a_typefacility_id_2166b9a7_fk_facility_typefacility_id" 
ALTER TABLE `arendator_arendator_type_building_data`
	ADD CONSTRAINT `arendator_a_typefacility_id_2166b9a7_fk_facility_typefacility_id` FOREIGN KEY ( `typefacility_id` )
	REFERENCES `facility_typefacility`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "arendator_arendato_arendator_id_de3253_fk_arendator_arendator_id" 
ALTER TABLE `arendator_arendator_type_building_data`
	ADD CONSTRAINT `arendator_arendato_arendator_id_de3253_fk_arendator_arendator_id` FOREIGN KEY ( `arendator_id` )
	REFERENCES `arendator_arendator`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "auth_group_permissi_permission_id_23962d04_fk_auth_permission_id" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "auth_group_permissions_group_id_58c48ba9_fk_auth_group_id" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "auth_permissi_content_type_id_51277a81_fk_django_content_type_id" 
ALTER TABLE `auth_permission`
	ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "auth_user_groups_group_id_30a071c9_fk_auth_group_id" 
ALTER TABLE `auth_user_groups`
	ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "auth_user_groups_user_id_24702650_fk_auth_user_id" 
ALTER TABLE `auth_user_groups`
	ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id" 
ALTER TABLE `auth_user_user_permissions`
	ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id" 
ALTER TABLE `auth_user_user_permissions`
	ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_type_client_id_4e5ae1c9_fk_arendator_typeclient_id" 
ALTER TABLE `buyer_buyer`
	ADD CONSTRAINT `buyer_buyer_type_client_id_4e5ae1c9_fk_arendator_typeclient_id` FOREIGN KEY ( `type_client_id` )
	REFERENCES `arendator_typeclient`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_type_stage_id_4795eda7_fk_arendator_typestage_id" 
ALTER TABLE `buyer_buyer`
	ADD CONSTRAINT `buyer_buyer_type_stage_id_4795eda7_fk_arendator_typestage_id` FOREIGN KEY ( `type_stage_id` )
	REFERENCES `arendator_typestage`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_type_state_id_6f8e6d84_fk_arendator_typestate_id" 
ALTER TABLE `buyer_buyer`
	ADD CONSTRAINT `buyer_buyer_type_state_id_6f8e6d84_fk_arendator_typestate_id` FOREIGN KEY ( `type_state_id` )
	REFERENCES `arendator_typestate`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "number_of_persons_id_5bb826a7_fk_facility_typenumberofperson_id" 
ALTER TABLE `buyer_buyer`
	ADD CONSTRAINT `number_of_persons_id_5bb826a7_fk_facility_typenumberofperson_id` FOREIGN KEY ( `number_of_persons_id` )
	REFERENCES `facility_typenumberofperson`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_dis_district_id_15afc0_fk_setting_street_district_id" 
ALTER TABLE `buyer_buyer_district_obj`
	ADD CONSTRAINT `buyer_buyer_dis_district_id_15afc0_fk_setting_street_district_id` FOREIGN KEY ( `district_id` )
	REFERENCES `setting_street_district`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_district_obj_buyer_id_54369536_fk_buyer_buyer_id" 
ALTER TABLE `buyer_buyer_district_obj`
	ADD CONSTRAINT `buyer_buyer_district_obj_buyer_id_54369536_fk_buyer_buyer_id` FOREIGN KEY ( `buyer_id` )
	REFERENCES `buyer_buyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_loyality_buyer_id_308d2025_fk_buyer_buyer_id" 
ALTER TABLE `buyer_buyer_loyality`
	ADD CONSTRAINT `buyer_buyer_loyality_buyer_id_308d2025_fk_buyer_buyer_id` FOREIGN KEY ( `buyer_id` )
	REFERENCES `buyer_buyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_loyality_userfullname_id_6fdc4680_fk_auth_user_id" 
ALTER TABLE `buyer_buyer_loyality`
	ADD CONSTRAINT `buyer_buyer_loyality_userfullname_id_6fdc4680_fk_auth_user_id` FOREIGN KEY ( `userfullname_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_r_typerepairs_id_3dd5ef6e_fk_facility_typerepairs_id" 
ALTER TABLE `buyer_buyer_repairs`
	ADD CONSTRAINT `buyer_buyer_r_typerepairs_id_3dd5ef6e_fk_facility_typerepairs_id` FOREIGN KEY ( `typerepairs_id` )
	REFERENCES `facility_typerepairs`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_repairs_buyer_id_73e07083_fk_buyer_buyer_id" 
ALTER TABLE `buyer_buyer_repairs`
	ADD CONSTRAINT `buyer_buyer_repairs_buyer_id_73e07083_fk_buyer_buyer_id` FOREIGN KEY ( `buyer_id` )
	REFERENCES `buyer_buyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_rieltor_buyer_id_bdc5526_fk_buyer_buyer_id" 
ALTER TABLE `buyer_buyer_rieltor`
	ADD CONSTRAINT `buyer_buyer_rieltor_buyer_id_bdc5526_fk_buyer_buyer_id` FOREIGN KEY ( `buyer_id` )
	REFERENCES `buyer_buyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_rieltor_userfullname_id_7c374cf5_fk_auth_user_id" 
ALTER TABLE `buyer_buyer_rieltor`
	ADD CONSTRAINT `buyer_buyer_rieltor_userfullname_id_7c374cf5_fk_auth_user_id` FOREIGN KEY ( `userfullname_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_room_buyer_id_64040ae1_fk_buyer_buyer_id" 
ALTER TABLE `buyer_buyer_room`
	ADD CONSTRAINT `buyer_buyer_room_buyer_id_64040ae1_fk_buyer_buyer_id` FOREIGN KEY ( `buyer_id` )
	REFERENCES `buyer_buyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_room_typerooms_id_546a5ab6_fk_facility_typerooms_id" 
ALTER TABLE `buyer_buyer_room`
	ADD CONSTRAINT `buyer_buyer_room_typerooms_id_546a5ab6_fk_facility_typerooms_id` FOREIGN KEY ( `typerooms_id` )
	REFERENCES `facility_typerooms`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_type_building_da_buyer_id_24e05aca_fk_buyer_buyer_id" 
ALTER TABLE `buyer_buyer_type_building_data`
	ADD CONSTRAINT `buyer_buyer_type_building_da_buyer_id_24e05aca_fk_buyer_buyer_id` FOREIGN KEY ( `buyer_id` )
	REFERENCES `buyer_buyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "buyer_buyer_typefacility_id_59acec3d_fk_facility_typefacility_id" 
ALTER TABLE `buyer_buyer_type_building_data`
	ADD CONSTRAINT `buyer_buyer_typefacility_id_59acec3d_fk_facility_typefacility_id` FOREIGN KEY ( `typefacility_id` )
	REFERENCES `facility_typefacility`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "django_admin__content_type_id_5151027a_fk_django_content_type_id" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "django_admin_log_user_id_1c5f563_fk_auth_user_id" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "extuser_my_type_user_id_6b7d1273_fk_extuser_usersgroupextuser_id" 
ALTER TABLE `extuser_myuser`
	ADD CONSTRAINT `extuser_my_type_user_id_6b7d1273_fk_extuser_usersgroupextuser_id` FOREIGN KEY ( `type_user_id` )
	REFERENCES `extuser_usersgroupextuser`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "extuser_myuser_user_id_65e4f2d1_fk_auth_user_id" 
ALTER TABLE `extuser_myuser`
	ADD CONSTRAINT `extuser_myuser_user_id_65e4f2d1_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D49833ad90344a6165af7691ad0ccf88" ----------
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `D49833ad90344a6165af7691ad0ccf88` FOREIGN KEY ( `the_presence_of_hot_water_id` )
	REFERENCES `facility_typethepresenceofhotwater`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D4c1abf979224871c53459442c624dbc" ----------
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `D4c1abf979224871c53459442c624dbc` FOREIGN KEY ( `type_building_data_id` )
	REFERENCES `facility_typebuilding`( `type_building` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "fac_district_obj_id_778fcfcf_fk_setting_street_district_district" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `fac_district_obj_id_778fcfcf_fk_setting_street_district_district` FOREIGN KEY ( `district_obj_id` )
	REFERENCES `setting_street_district`( `district` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "faci_currency_id_1ca76d86_fk_setting_globall_nationalcarrency_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `faci_currency_id_1ca76d86_fk_setting_globall_nationalcarrency_id` FOREIGN KEY ( `currency_id` )
	REFERENCES `setting_globall_nationalcarrency`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "faci_street_obj_id_37e1d08a_fk_setting_street_street_full_street" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `faci_street_obj_id_37e1d08a_fk_setting_street_street_full_street` FOREIGN KEY ( `street_obj_id` )
	REFERENCES `setting_street_street`( `full_street` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facilit_repairs_id_2ec1adbe_fk_facility_typerepairs_type_repairs" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facilit_repairs_id_2ec1adbe_fk_facility_typerepairs_type_repairs` FOREIGN KEY ( `repairs_id` )
	REFERENCES `facility_typerepairs`( `type_repairs` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility__subway_obj_id_582c9b14_fk_setting_street_subway_subway" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility__subway_obj_id_582c9b14_fk_setting_street_subway_subway` FOREIGN KEY ( `subway_obj_id` )
	REFERENCES `setting_street_subway`( `subway` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_ad_prepayment_id_536f2dee_fk_facility_typeprepayment_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility_ad_prepayment_id_536f2dee_fk_facility_typeprepayment_id` FOREIGN KEY ( `prepayment_id` )
	REFERENCES `facility_typeprepayment`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addr_actuality_id_69961920_fk_facility_typeactuality_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility_addr_actuality_id_69961920_fk_facility_typeactuality_id` FOREIGN KEY ( `actuality_id` )
	REFERENCES `facility_typeactuality`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addr_condition_id_75a9069d_fk_facility_typecondition_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility_addr_condition_id_75a9069d_fk_facility_typecondition_id` FOREIGN KEY ( `condition_id` )
	REFERENCES `facility_typecondition`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addr_furniture_id_77acd4f4_fk_facility_typefurniture_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility_addr_furniture_id_77acd4f4_fk_facility_typefurniture_id` FOREIGN KEY ( `furniture_id` )
	REFERENCES `facility_typefurniture`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addres_lavatory_id_4dc276d9_fk_facility_typelavatory_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility_addres_lavatory_id_4dc276d9_fk_facility_typelavatory_id` FOREIGN KEY ( `lavatory_id` )
	REFERENCES `facility_typelavatory`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addressf_heating_id_7e29861a_fk_facility_typeheating_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility_addressf_heating_id_7e29861a_fk_facility_typeheating_id` FOREIGN KEY ( `heating_id` )
	REFERENCES `facility_typeheating`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addressf_windows_id_3660a5f1_fk_facility_typewindows_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility_addressf_windows_id_3660a5f1_fk_facility_typewindows_id` FOREIGN KEY ( `windows_id` )
	REFERENCES `facility_typewindows`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addressfacili_room_id_264fb0b2_fk_facility_typerooms_id" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `facility_addressfacili_room_id_264fb0b2_fk_facility_typerooms_id` FOREIGN KEY ( `room_id` )
	REFERENCES `facility_typerooms`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "type_facilit_id_17270684_fk_facility_typefacility_type_facility" 
ALTER TABLE `facility_addressfacilitydata`
	ADD CONSTRAINT `type_facilit_id_17270684_fk_facility_typefacility_type_facility` FOREIGN KEY ( `type_facilit_id` )
	REFERENCES `facility_typefacility`( `type_facility` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "e53d6c7739254b05a84223b25d3b34ec" ----------
ALTER TABLE `facility_addressfacilitydata_equipment`
	ADD CONSTRAINT `e53d6c7739254b05a84223b25d3b34ec` FOREIGN KEY ( `addressfacilitydata_id` )
	REFERENCES `facility_addressfacilitydata`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_a_typeequipment_id_78f3fa7_fk_facility_typeequipment_id" 
ALTER TABLE `facility_addressfacilitydata_equipment`
	ADD CONSTRAINT `facility_a_typeequipment_id_78f3fa7_fk_facility_typeequipment_id` FOREIGN KEY ( `typeequipment_id` )
	REFERENCES `facility_typeequipment`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "bdc49c947a77dd5bccccfde640b57612" ----------
ALTER TABLE `facility_addressfacilitydata_list_operations`
	ADD CONSTRAINT `bdc49c947a77dd5bccccfde640b57612` FOREIGN KEY ( `addressfacilitydata_id` )
	REFERENCES `facility_addressfacilitydata`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facilit_typeoperations_id_2f116a57_fk_facility_typeoperations_id" 
ALTER TABLE `facility_addressfacilitydata_list_operations`
	ADD CONSTRAINT `facilit_typeoperations_id_2f116a57_fk_facility_typeoperations_id` FOREIGN KEY ( `typeoperations_id` )
	REFERENCES `facility_typeoperations`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "b0ba45cef61bfbe5517a0522337d5e18" ----------
ALTER TABLE `facility_addressfacilitydata_loyality`
	ADD CONSTRAINT `b0ba45cef61bfbe5517a0522337d5e18` FOREIGN KEY ( `addressfacilitydata_id` )
	REFERENCES `facility_addressfacilitydata`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addressfacilit_userfullname_id_171914c7_fk_auth_user_id" 
ALTER TABLE `facility_addressfacilitydata_loyality`
	ADD CONSTRAINT `facility_addressfacilit_userfullname_id_171914c7_fk_auth_user_id` FOREIGN KEY ( `userfullname_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D0b4dbbf1edee5b153e1d7edd3556971" ----------
ALTER TABLE `facility_addressfacilitydata_number_of_persons`
	ADD CONSTRAINT `D0b4dbbf1edee5b153e1d7edd3556971` FOREIGN KEY ( `typenumberofperson_id` )
	REFERENCES `facility_typenumberofperson`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D370b83b7f9fce2ddc4710b828c97dfd" ----------
ALTER TABLE `facility_addressfacilitydata_number_of_persons`
	ADD CONSTRAINT `D370b83b7f9fce2ddc4710b828c97dfd` FOREIGN KEY ( `addressfacilitydata_id` )
	REFERENCES `facility_addressfacilitydata`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "c092fd70fcb74e1d7a075d1ce9e82a75" ----------
ALTER TABLE `facility_addressfacilitydata_rieltor`
	ADD CONSTRAINT `c092fd70fcb74e1d7a075d1ce9e82a75` FOREIGN KEY ( `addressfacilitydata_id` )
	REFERENCES `facility_addressfacilitydata`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_addressfacilit_userfullname_id_62adb38a_fk_auth_user_id" 
ALTER TABLE `facility_addressfacilitydata_rieltor`
	ADD CONSTRAINT `facility_addressfacilit_userfullname_id_62adb38a_fk_auth_user_id` FOREIGN KEY ( `userfullname_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D4471e5a2eee7feb15c71d78854478bb" ----------
ALTER TABLE `facility_addressfacilitydata_where_to_stay`
	ADD CONSTRAINT `D4471e5a2eee7feb15c71d78854478bb` FOREIGN KEY ( `addressfacilitydata_id` )
	REFERENCES `facility_addressfacilitydata`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facil_typewheretostay_id_38dbda49_fk_facility_typewheretostay_id" 
ALTER TABLE `facility_addressfacilitydata_where_to_stay`
	ADD CONSTRAINT `facil_typewheretostay_id_38dbda49_fk_facility_typewheretostay_id` FOREIGN KEY ( `typewheretostay_id` )
	REFERENCES `facility_typewheretostay`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D22f0c030fd97cefc2742e3dba96dffb" ----------
ALTER TABLE `facility_contactowner`
	ADD CONSTRAINT `D22f0c030fd97cefc2742e3dba96dffb` FOREIGN KEY ( `addressfacilitydata_ptr_id` )
	REFERENCES `facility_addressfacilitydata`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facili_contact_owner_id_4c12ae9b_fk_facility_typecontactowner_id" 
ALTER TABLE `facility_contactowner`
	ADD CONSTRAINT `facili_contact_owner_id_4c12ae9b_fk_facility_typecontactowner_id` FOREIGN KEY ( `contact_owner_id` )
	REFERENCES `facility_typecontactowner`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "facility_im_album_id_63b989de_fk_facility_addressfacilitydata_id" 
ALTER TABLE `facility_imagesfacility`
	ADD CONSTRAINT `facility_im_album_id_63b989de_fk_facility_addressfacilitydata_id` FOREIGN KEY ( `album_id` )
	REFERENCES `facility_addressfacilitydata`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "a47032be5f348ee869a7de602ee72a5f" ----------
ALTER TABLE `facility_phoneowner`
	ADD CONSTRAINT `a47032be5f348ee869a7de602ee72a5f` FOREIGN KEY ( `phone_id` )
	REFERENCES `facility_contactowner`( `addressfacilitydata_ptr_id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "makler_mak_cooperation_id_555cf4ba_fk_makler_typecooperations_id" 
ALTER TABLE `makler_makler`
	ADD CONSTRAINT `makler_mak_cooperation_id_555cf4ba_fk_makler_typecooperations_id` FOREIGN KEY ( `cooperation_id` )
	REFERENCES `makler_typecooperations`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "makler_makle_white_black_id_65fdd398_fk_makler_typewhiteblack_id" 
ALTER TABLE `makler_makler`
	ADD CONSTRAINT `makler_makle_white_black_id_65fdd398_fk_makler_typewhiteblack_id` FOREIGN KEY ( `white_black_id` )
	REFERENCES `makler_typewhiteblack`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "send_messege_use_from_user_id_44d5cd5d_fk_extuser_myuser_user_id" 
ALTER TABLE `send_messege_user_usermessage`
	ADD CONSTRAINT `send_messege_use_from_user_id_44d5cd5d_fk_extuser_myuser_user_id` FOREIGN KEY ( `from_user_id` )
	REFERENCES `extuser_myuser`( `user_id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "send_messege_user_userm_user_message_id_7d28ca11_fk_auth_user_id" 
ALTER TABLE `send_messege_user_usermessage`
	ADD CONSTRAINT `send_messege_user_userm_user_message_id_7d28ca11_fk_auth_user_id` FOREIGN KEY ( `user_message_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "s_type_street_group_id_5afed51c_fk_setting_street_typesstreet_id" 
ALTER TABLE `setting_street_street`
	ADD CONSTRAINT `s_type_street_group_id_5afed51c_fk_setting_street_typesstreet_id` FOREIGN KEY ( `type_street_group_id` )
	REFERENCES `setting_street_typesstreet`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "a512109d10e6c943b643af01c8ca2af7" ----------
ALTER TABLE `single_object_showsarendator`
	ADD CONSTRAINT `a512109d10e6c943b643af01c8ca2af7` FOREIGN KEY ( `array_cont_ower_id` )
	REFERENCES `facility_contactowner`( `addressfacilitydata_ptr_id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "s_type_shows_arendator_id_7ab11ee7_fk_single_object_typeshows_id" 
ALTER TABLE `single_object_showsarendator`
	ADD CONSTRAINT `s_type_shows_arendator_id_7ab11ee7_fk_single_object_typeshows_id` FOREIGN KEY ( `type_shows_arendator_id` )
	REFERENCES `single_object_typeshows`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "single_obj_array_arendator_id_60b46730_fk_arendator_arendator_id" 
ALTER TABLE `single_object_showsarendator`
	ADD CONSTRAINT `single_obj_array_arendator_id_60b46730_fk_arendator_arendator_id` FOREIGN KEY ( `array_arendator_id` )
	REFERENCES `arendator_arendator`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D46e55318e10725029269838c702b2d5" ----------
ALTER TABLE `single_object_showsbuyer`
	ADD CONSTRAINT `D46e55318e10725029269838c702b2d5` FOREIGN KEY ( `array_cont_ower_id` )
	REFERENCES `facility_contactowner`( `addressfacilitydata_ptr_id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "singl_type_shows_buyer_id_3b9bd4f3_fk_single_object_typeshows_id" 
ALTER TABLE `single_object_showsbuyer`
	ADD CONSTRAINT `singl_type_shows_buyer_id_3b9bd4f3_fk_single_object_typeshows_id` FOREIGN KEY ( `type_shows_buyer_id` )
	REFERENCES `single_object_typeshows`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "single_object_showsbuye_array_buyer_id_2821354_fk_buyer_buyer_id" 
ALTER TABLE `single_object_showsbuyer`
	ADD CONSTRAINT `single_object_showsbuye_array_buyer_id_2821354_fk_buyer_buyer_id` FOREIGN KEY ( `array_buyer_id` )
	REFERENCES `buyer_buyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D846772484879773a0ccee0c444553a2" ----------
ALTER TABLE `single_object_singleobjcomments`
	ADD CONSTRAINT `D846772484879773a0ccee0c444553a2` FOREIGN KEY ( `obj_comments_id` )
	REFERENCES `facility_contactowner`( `addressfacilitydata_ptr_id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "D77bd36c224856e3b9f45e2693318e12" ----------
ALTER TABLE `single_object_tie`
	ADD CONSTRAINT `D77bd36c224856e3b9f45e2693318e12` FOREIGN KEY ( `tie_cont_owner_id` )
	REFERENCES `facility_contactowner`( `addressfacilitydata_ptr_id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "single_object_ti_arendator_id_4affdbcb_fk_arendator_arendator_id" 
ALTER TABLE `single_object_tie_tie_arenda`
	ADD CONSTRAINT `single_object_ti_arendator_id_4affdbcb_fk_arendator_arendator_id` FOREIGN KEY ( `arendator_id` )
	REFERENCES `arendator_arendator`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "single_object_tie_tie_ar_tie_id_50fc8619_fk_single_object_tie_id" 
ALTER TABLE `single_object_tie_tie_arenda`
	ADD CONSTRAINT `single_object_tie_tie_ar_tie_id_50fc8619_fk_single_object_tie_id` FOREIGN KEY ( `tie_id` )
	REFERENCES `single_object_tie`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "a00ab6beeea41c41e99323dd58b7f33a" ----------
ALTER TABLE `single_object_tiebuyer`
	ADD CONSTRAINT `a00ab6beeea41c41e99323dd58b7f33a` FOREIGN KEY ( `tie_cont_owner_id` )
	REFERENCES `facility_contactowner`( `addressfacilitydata_ptr_id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "single_object__tiebuyer_id_5eb51093_fk_single_object_tiebuyer_id" 
ALTER TABLE `single_object_tiebuyer_tie_buye`
	ADD CONSTRAINT `single_object__tiebuyer_id_5eb51093_fk_single_object_tiebuyer_id` FOREIGN KEY ( `tiebuyer_id` )
	REFERENCES `single_object_tiebuyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


-- CREATE LINK "single_object_tiebuyer_tie_b_buyer_id_30fbc760_fk_buyer_buyer_id" 
ALTER TABLE `single_object_tiebuyer_tie_buye`
	ADD CONSTRAINT `single_object_tiebuyer_tie_b_buyer_id_30fbc760_fk_buyer_buyer_id` FOREIGN KEY ( `buyer_id` )
	REFERENCES `buyer_buyer`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


