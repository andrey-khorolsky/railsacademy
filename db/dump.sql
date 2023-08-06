BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "users" (
	"id"	integer NOT NULL,
	"email"	varchar NOT NULL DEFAULT '',
	"encrypted_password"	varchar NOT NULL DEFAULT '',
	"reset_password_token"	varchar,
	"reset_password_sent_at"	datetime(6),
	"remember_created_at"	datetime(6),
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	"name"	varchar,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "followers" (
	"id"	integer NOT NULL,
	"author_id"	integer DEFAULT NULL,
	"follower_id"	integer DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	CONSTRAINT "fk_rails_5b83ba9503" FOREIGN KEY("follower_id") REFERENCES "users"("id"),
	PRIMARY KEY("id"),
	CONSTRAINT "fk_rails_2fc597daa1" FOREIGN KEY("author_id") REFERENCES "users"("id")
);
CREATE TABLE IF NOT EXISTS "posts" (
	"id"	integer NOT NULL,
	"user_id"	integer DEFAULT NULL,
	"text"	text DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	"img"	varchar DEFAULT NULL,
	CONSTRAINT "fk_rails_5b5ddfd518" FOREIGN KEY("user_id") REFERENCES "users"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "schema_migrations" (
	"version"	varchar NOT NULL,
	PRIMARY KEY("version")
);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" (
	"key"	varchar NOT NULL,
	"value"	varchar,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	PRIMARY KEY("key")
);
CREATE TABLE IF NOT EXISTS "likes" (
	"id"	integer NOT NULL,
	"post_id"	integer DEFAULT NULL,
	"user_id"	integer DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT "fk_rails_1e09b5dabf" FOREIGN KEY("user_id") REFERENCES "users"("id"),
	CONSTRAINT "fk_rails_87a8aac469" FOREIGN KEY("post_id") REFERENCES "posts"("id")
);
CREATE TABLE IF NOT EXISTS "comments" (
	"id"	integer NOT NULL,
	"user_id"	integer DEFAULT NULL,
	"post_id"	integer DEFAULT NULL,
	"text"	varchar DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	CONSTRAINT "fk_rails_03de2dc08c" FOREIGN KEY("user_id") REFERENCES "users"("id"),
	PRIMARY KEY("id"),
	CONSTRAINT "fk_rails_2fd19c0db7" FOREIGN KEY("post_id") REFERENCES "posts"("id")
);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (1,'email@mail.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Emilia');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (2,'mail@mail.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Georgy');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (3,'mail@com.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Sasha');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (4,'mail@mmm.mmm','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Nikolai');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (5,'artyom@mail.com','$2a$12$UAJBbcNpFnrXd7oXu9Y5eeq8y.vVi773DBMNdpmTIXL0nPGEArrCS',NULL,NULL,NULL,'2023-07-06 08:37:46.783310','2023-07-06 08:37:46.783310','Artyom');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (6,'ee@mail.com','$2a$12$EyzFTQEpZDfybLLfYTnbg.HT2Qu/a5K2hlP58vhS9rmJXsnKZPIOy',NULL,NULL,NULL,'2023-07-06 11:57:27.309964','2023-07-06 11:57:27.309964','Name');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (1,1,5,'2023-07-06 08:44:04.806906','2023-07-06 08:44:04.806906');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (2,2,5,'2023-07-06 08:44:11.294975','2023-07-06 08:44:11.294975');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (6,1,6,'2023-07-06 12:29:07.844331','2023-07-06 12:29:07.844331');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (7,3,6,'2023-07-06 12:29:26.536964','2023-07-06 12:29:26.536964');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (10,3,5,'2023-07-06 13:29:38.870604','2023-07-06 13:29:38.870604');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (12,2,1,'2023-07-06 15:42:30.277034','2023-07-06 15:42:30.277034');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (13,3,1,'2023-07-07 12:56:40.355154','2023-07-07 12:56:40.355154');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (14,6,1,'2023-07-07 14:18:12.543779','2023-07-07 14:18:12.543779');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (15,5,1,'2023-07-07 14:18:20.265555','2023-07-07 14:18:20.265555');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (1,5,'Iam Artyom','2023-07-06 08:43:07.363410','2023-07-06 08:43:07.363410','lemedoit.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (2,5,'car','2023-07-06 08:45:11.770767','2023-07-06 08:45:11.770767','gmc.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (3,3,'blablablablabla','2023-07-06 08:46:16.362620','2023-07-06 08:46:16.362620',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (4,1,'some things','2023-07-06 08:46:40.687581','2023-07-06 08:46:40.687581','exm1.jpeg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (5,1,'qwer','2023-07-06 11:53:19.645319','2023-07-06 11:53:19.645319','lemedoit.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (6,1,'boba','2023-07-06 11:55:07.236442','2023-07-06 11:55:07.236442','gmc.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (7,6,'new post','2023-07-06 11:57:44.900920','2023-07-06 11:57:44.900920','exm1.jpeg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (8,1,'done','2023-07-06 14:03:41.813731','2023-07-06 14:03:41.813731','vitamin-d-tablets.jpg');
INSERT INTO "schema_migrations" ("version") VALUES ('20230706082123');
INSERT INTO "schema_migrations" ("version") VALUES ('20230704151812');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705084100');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705101249');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705141651');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705145839');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705192449');
INSERT INTO "schema_migrations" ("version") VALUES ('20230706082422');
INSERT INTO "schema_migrations" ("version") VALUES ('20230706124852');
INSERT INTO "ar_internal_metadata" ("key","value","created_at","updated_at") VALUES ('environment','development','2023-07-06 08:27:07.062505','2023-07-06 08:27:07.062505');
INSERT INTO "ar_internal_metadata" ("key","value","created_at","updated_at") VALUES ('schema_sha1','57af603f5bd703e6da38c128d7dcf548d55c3469','2023-07-06 08:27:07.073875','2023-07-06 08:27:07.073875');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (3,4,5,'2023-07-06 10:38:01.600655','2023-07-06 10:38:01.600655');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (4,3,5,'2023-07-06 10:38:19.665121','2023-07-06 10:38:19.665121');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (6,4,6,'2023-07-06 11:58:14.694139','2023-07-06 11:58:14.694139');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (8,8,5,'2023-07-06 14:05:47.515635','2023-07-06 14:05:47.515635');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (9,3,1,'2023-07-07 14:28:25.229854','2023-07-07 14:28:25.229854');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (1,1,2,'good car','2023-07-06 13:22:58.436716','2023-07-06 13:22:58.436716');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (2,1,2,'too low for me(((((((','2023-07-06 13:23:43.776354','2023-07-06 13:23:43.776354');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (3,1,2,'third comm','2023-07-06 13:23:53.617756','2023-07-06 13:23:53.617756');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (4,1,2,'four 4','2023-07-06 13:24:01.722513','2023-07-06 13:24:01.722513');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (5,1,3,'balballblablalb','2023-07-06 13:27:19.910484','2023-07-06 13:27:19.910484');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (6,5,6,'i know this place','2023-07-06 13:29:17.026865','2023-07-06 13:29:17.026865');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (7,5,3,'lalalalal','2023-07-06 13:30:38.770069','2023-07-06 13:30:38.770069');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (8,1,1,'iam emily','2023-07-06 13:43:07.287337','2023-07-06 13:43:07.287337');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (9,5,8,'i like it picasso','2023-07-06 14:06:00.949972','2023-07-06 14:06:00.949972');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (10,1,2,'another comment','2023-07-06 14:39:26.035457','2023-07-06 14:39:26.035457');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (11,1,3,'qweqwe','2023-07-06 14:44:17.043919','2023-07-06 14:44:17.043919');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (12,1,2,'qwe','2023-07-06 14:44:30.901225','2023-07-06 14:44:30.901225');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (13,1,3,'12345','2023-07-06 15:06:29.635934','2023-07-06 15:06:29.635934');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (14,1,3,'123456','2023-07-06 15:07:01.146642','2023-07-06 15:07:01.146642');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (15,1,3,'123','2023-07-06 15:37:43.340564','2023-07-06 15:37:43.340564');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (16,1,3,'1234','2023-07-06 15:37:58.073126','2023-07-06 15:37:58.073126');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (17,1,3,'1','2023-07-06 15:39:24.275071','2023-07-06 15:39:24.275071');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (18,1,3,'qewr','2023-07-07 12:52:34.911885','2023-07-07 12:52:34.911885');
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_email" ON "users" (
	"email"
);
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_reset_password_token" ON "users" (
	"reset_password_token"
);
COMMIT;
