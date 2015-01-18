PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL,
    "content_type_id" integer,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
INSERT INTO "django_admin_log" VALUES(1,'2014-03-01 22:04:30.960744',1,8,'14','CatData object',3,'');
INSERT INTO "django_admin_log" VALUES(2,'2014-03-01 22:04:49.596192',1,8,'13','CatData object',3,'');
INSERT INTO "django_admin_log" VALUES(3,'2014-03-01 22:05:15.966304',1,8,'12','CatData object',3,'');
INSERT INTO "django_admin_log" VALUES(4,'2014-03-01 22:05:51.502469',1,8,'9','CatData object',2,'Changed story.');
INSERT INTO "django_admin_log" VALUES(5,'2014-03-01 22:06:11.473103',1,8,'8','CatData object',3,'');
INSERT INTO "django_admin_log" VALUES(6,'2014-03-01 22:06:23.150301',1,8,'7','CatData object',3,'');
INSERT INTO "django_admin_log" VALUES(7,'2014-03-01 22:06:59.233587',1,8,'11','CatData object',3,'');
INSERT INTO "django_admin_log" VALUES(8,'2014-03-01 22:15:07.064769',1,8,'3','CatData object',2,'Changed story.');
INSERT INTO "django_admin_log" VALUES(9,'2014-03-01 22:15:33.554476',1,8,'2','CatData object',2,'Changed story.');
INSERT INTO "django_admin_log" VALUES(10,'2014-03-01 23:17:03.326449',1,8,'11','CatData object',1,'');
CREATE TABLE "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
INSERT INTO "auth_permission" VALUES(1,'Can add log entry',1,'add_logentry');
INSERT INTO "auth_permission" VALUES(2,'Can change log entry',1,'change_logentry');
INSERT INTO "auth_permission" VALUES(3,'Can delete log entry',1,'delete_logentry');
INSERT INTO "auth_permission" VALUES(4,'Can add permission',2,'add_permission');
INSERT INTO "auth_permission" VALUES(5,'Can change permission',2,'change_permission');
INSERT INTO "auth_permission" VALUES(6,'Can delete permission',2,'delete_permission');
INSERT INTO "auth_permission" VALUES(7,'Can add group',3,'add_group');
INSERT INTO "auth_permission" VALUES(8,'Can change group',3,'change_group');
INSERT INTO "auth_permission" VALUES(9,'Can delete group',3,'delete_group');
INSERT INTO "auth_permission" VALUES(10,'Can add user',4,'add_user');
INSERT INTO "auth_permission" VALUES(11,'Can change user',4,'change_user');
INSERT INTO "auth_permission" VALUES(12,'Can delete user',4,'delete_user');
INSERT INTO "auth_permission" VALUES(13,'Can add content type',5,'add_contenttype');
INSERT INTO "auth_permission" VALUES(14,'Can change content type',5,'change_contenttype');
INSERT INTO "auth_permission" VALUES(15,'Can delete content type',5,'delete_contenttype');
INSERT INTO "auth_permission" VALUES(16,'Can add session',6,'add_session');
INSERT INTO "auth_permission" VALUES(17,'Can change session',6,'change_session');
INSERT INTO "auth_permission" VALUES(18,'Can delete session',6,'delete_session');
INSERT INTO "auth_permission" VALUES(19,'Can add cat',7,'add_cat');
INSERT INTO "auth_permission" VALUES(20,'Can change cat',7,'change_cat');
INSERT INTO "auth_permission" VALUES(21,'Can delete cat',7,'delete_cat');
INSERT INTO "auth_permission" VALUES(22,'Can add cat data',8,'add_catdata');
INSERT INTO "auth_permission" VALUES(23,'Can change cat data',8,'change_catdata');
INSERT INTO "auth_permission" VALUES(24,'Can delete cat data',8,'delete_catdata');
INSERT INTO "auth_permission" VALUES(25,'Can add vote',9,'add_vote');
INSERT INTO "auth_permission" VALUES(26,'Can change vote',9,'change_vote');
INSERT INTO "auth_permission" VALUES(27,'Can delete vote',9,'delete_vote');
CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
CREATE TABLE "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NOT NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$12000$uobvPG2S0QpO$3g2jIJDnf7ag0sO48HJOCMTA/W9RWm8CPzXojN3M3ms=','2014-03-01 00:28:47.500825',1,'donna','','','forsythia@gmail.com',1,1,'2014-02-18 01:01:08.679044');
CREATE TABLE "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
INSERT INTO "django_content_type" VALUES(1,'log entry','admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'permission','auth','permission');
INSERT INTO "django_content_type" VALUES(3,'group','auth','group');
INSERT INTO "django_content_type" VALUES(4,'user','auth','user');
INSERT INTO "django_content_type" VALUES(5,'content type','contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'session','sessions','session');
INSERT INTO "django_content_type" VALUES(7,'cat','cats','cat');
INSERT INTO "django_content_type" VALUES(8,'cat data','cats','catdata');
INSERT INTO "django_content_type" VALUES(9,'vote','cats','vote');
CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
INSERT INTO "django_session" VALUES('dgdeg44mdyftv8baq3nn0avj0ry0d6g0','NThlMjdkZjQzN2RmMjQzMmVlZDU3ZjIxMTc5MzQzNDQzZDMwZDg0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-03-05 23:31:41.746845');
INSERT INTO "django_session" VALUES('ioqajltf8senr4of3i8tqomejnv1hllj','NThlMjdkZjQzN2RmMjQzMmVlZDU3ZjIxMTc5MzQzNDQzZDMwZDg0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-03-15 00:28:47.528353');
CREATE TABLE "cats_cat" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(150) NOT NULL,
    "created" datetime NOT NULL
);
INSERT INTO "cats_cat" VALUES(1,'Max','2014-02-18 04:39:11.878993');
INSERT INTO "cats_cat" VALUES(2,'Bramble','2014-02-18 04:41:38.064039');
INSERT INTO "cats_cat" VALUES(3,'Foo','2014-03-01 04:57:32.212868');
INSERT INTO "cats_cat" VALUES(4,'Torbie','2014-03-02 03:13:39.472006');
INSERT INTO "cats_cat" VALUES(5,'Zank','2014-03-02 06:05:50.078038');
INSERT INTO "cats_cat" VALUES(6,'Kenard','2014-03-02 06:07:09.841999');
INSERT INTO "cats_cat" VALUES(7,'Burt','2014-03-02 06:08:17.275726');
INSERT INTO "cats_cat" VALUES(8,'Zyla','2014-03-02 06:11:40.820200');
INSERT INTO "cats_cat" VALUES(9,'Polly','2014-03-02 06:12:34.721373');
CREATE TABLE "cats_catdata" (
    "id" integer NOT NULL PRIMARY KEY,
    "cat_id" integer NOT NULL REFERENCES "cats_cat" ("id"),
    "photo" varchar(100) NOT NULL,
    "story" text NOT NULL,
    "created" datetime NOT NULL
);
INSERT INTO "cats_catdata" VALUES(1,1,'catimages/max1_1.jpg','One day Max took a nap on the game.','2014-02-19 23:01:44.926907');
INSERT INTO "cats_catdata" VALUES(2,2,'catimages/bramble1.jpg','Mixmaster Bramble$','2014-02-19 23:08:36.966779');
INSERT INTO "cats_catdata" VALUES(3,1,'catimages/max2.jpg','Max thinks the chair is comfortable.','2014-02-19 23:14:02.480979');
INSERT INTO "cats_catdata" VALUES(4,2,'catimages/bramble2.jpg','Bramble and Max have a snug.','2014-02-19 23:16:07.864499');
INSERT INTO "cats_catdata" VALUES(5,1,'catimages/max3.jpg','Max says, ''Hey, ladies!'' after he came home from the hospital.','2014-02-19 23:18:19.930321');
INSERT INTO "cats_catdata" VALUES(6,2,'catimages/bramble3_1.jpg','Bramble meows at snow.','2014-02-19 23:19:55.033757');
INSERT INTO "cats_catdata" VALUES(9,3,'catimages/9.jpg','Foo decided she was the mom.','2014-03-01 05:34:34.424844');
INSERT INTO "cats_catdata" VALUES(10,1,'catimages/10.jpg','Max got huge!','2014-03-01 05:51:44.518193');
INSERT INTO "cats_catdata" VALUES(11,3,'catimages/0998_foo_just_woke_up.jpg','Foo just woke up from a nap on top of some cabinets.','2014-03-01 23:17:03.324441');
INSERT INTO "cats_catdata" VALUES(12,4,'catimages/12_1.jpg','Just a little baby <3','2014-03-02 03:13:39.518386');
INSERT INTO "cats_catdata" VALUES(13,5,'catimages/13_1.jpg','Zank wants to be your valentine.','2014-03-02 06:05:50.154906');
INSERT INTO "cats_catdata" VALUES(14,6,'catimages/14_1.jpg','Kenard helps with the laundry.','2014-03-02 06:07:09.853709');
INSERT INTO "cats_catdata" VALUES(15,7,'catimages/15.jpg','Burt poses with a plant.','2014-03-02 06:08:17.291162');
INSERT INTO "cats_catdata" VALUES(16,1,'catimages/16.jpg','Max has a secret hideout.','2014-03-02 06:09:39.945773');
INSERT INTO "cats_catdata" VALUES(17,2,'catimages/17.jpg','Bramble keeps it complicated.','2014-03-02 06:10:38.857370');
INSERT INTO "cats_catdata" VALUES(18,8,'catimages/18.jpg','Zyla was a cute kitten.','2014-03-02 06:11:40.838806');
INSERT INTO "cats_catdata" VALUES(19,9,'catimages/19.jpg','Polly stole my cellphone.','2014-03-02 06:12:34.739122');
INSERT INTO "cats_catdata" VALUES(20,3,'catimages/20.jpg','Foo is a baby and a snug.','2014-03-02 06:14:02.851691');
INSERT INTO "cats_catdata" VALUES(21,5,'catimages/21.jpg','Zank was a tubby little kitten.','2014-03-03 00:37:49.381637');
INSERT INTO "cats_catdata" VALUES(22,5,'catimages/22.jpg','Zank grew very large indeed.','2014-03-03 00:39:05.081838');
INSERT INTO "cats_catdata" VALUES(23,3,'catimages/23.jpg','<3','2014-03-03 00:40:49.922829');
CREATE TABLE "cats_vote" (
    "id" integer NOT NULL PRIMARY KEY,
    "cat_data_id" integer NOT NULL REFERENCES "cats_catdata" ("id"),
    "cuteness" integer unsigned NOT NULL,
    "votes" integer NOT NULL
);
CREATE INDEX "django_admin_log_6340c63c" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_37ef4eb4" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_37ef4eb4" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_5f412f9a" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_83d7f98b" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_6340c63c" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_5f412f9a" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_6340c63c" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_83d7f98b" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_session_b7b81f0c" ON "django_session" ("expire_date");
CREATE INDEX "cats_catdata_8a612a9c" ON "cats_catdata" ("cat_id");
CREATE INDEX "cats_vote_0a7d003f" ON "cats_vote" ("cat_data_id");
COMMIT;
