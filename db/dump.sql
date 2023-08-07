BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "followers" (
	"id"	integer NOT NULL,
	"author_id"	integer DEFAULT NULL,
	"follower_id"	integer DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT "fk_rails_2fc597daa1" FOREIGN KEY("author_id") REFERENCES "users"("id"),
	CONSTRAINT "fk_rails_5b83ba9503" FOREIGN KEY("follower_id") REFERENCES "users"("id")
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
CREATE TABLE IF NOT EXISTS "likes" (
	"id"	integer NOT NULL,
	"post_id"	integer DEFAULT NULL,
	"user_id"	integer DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	CONSTRAINT "fk_rails_87a8aac469" FOREIGN KEY("post_id") REFERENCES "posts"("id"),
	PRIMARY KEY("id"),
	CONSTRAINT "fk_rails_1e09b5dabf" FOREIGN KEY("user_id") REFERENCES "users"("id")
);
CREATE TABLE IF NOT EXISTS "comments" (
	"id"	integer NOT NULL,
	"user_id"	integer DEFAULT NULL,
	"post_id"	integer DEFAULT NULL,
	"text"	varchar DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	CONSTRAINT "fk_rails_2fd19c0db7" FOREIGN KEY("post_id") REFERENCES "posts"("id"),
	PRIMARY KEY("id"),
	CONSTRAINT "fk_rails_03de2dc08c" FOREIGN KEY("user_id") REFERENCES "users"("id")
);
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
	"img"	varchar DEFAULT '/uploads/user.jpg',
	"closed"	boolean DEFAULT 0,
	"description"	varchar,
	"realname"	varchar,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "notice_types" (
	"id"	integer NOT NULL,
	"typename"	varchar,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "notices" (
	"id"	integer NOT NULL,
	"author_id"	integer DEFAULT NULL,
	"notice_type_id"	integer DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	"users_id"	integer DEFAULT NULL,
	"posts_id"	integer DEFAULT NULL,
	"comments_id"	integer DEFAULT NULL,
	CONSTRAINT "fk_rails_36aaed3048" FOREIGN KEY("comments_id") REFERENCES "comments"("id"),
	CONSTRAINT "fk_rails_24908b6a0e" FOREIGN KEY("users_id") REFERENCES "users"("id"),
	CONSTRAINT "fk_rails_7aaf6ba05c" FOREIGN KEY("notice_type_id") REFERENCES "notice_types"("id"),
	PRIMARY KEY("id"),
	CONSTRAINT "fk_rails_dbe226384c" FOREIGN KEY("posts_id") REFERENCES "posts"("id"),
	CONSTRAINT "fk_rails_cb245e893e" FOREIGN KEY("author_id") REFERENCES "users"("id")
);
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (1,1,5,'2023-07-06 08:44:04.806906','2023-07-06 08:44:04.806906');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (2,2,5,'2023-07-06 08:44:11.294975','2023-07-06 08:44:11.294975');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (6,1,6,'2023-07-06 12:29:07.844331','2023-07-06 12:29:07.844331');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (7,3,6,'2023-07-06 12:29:26.536964','2023-07-06 12:29:26.536964');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (10,3,5,'2023-07-06 13:29:38.870604','2023-07-06 13:29:38.870604');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (20,4,2,'2023-07-13 14:14:25.221323','2023-07-13 14:14:25.221323');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (22,5,2,'2023-07-13 14:15:32.657411','2023-07-13 14:15:32.657411');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (33,12,11,'2023-07-14 07:28:42.036069','2023-07-14 07:28:42.036069');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (39,4,6,'2023-07-14 07:28:42.084069','2023-07-14 07:28:42.084069');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (41,11,4,'2023-07-14 07:28:42.099307','2023-07-14 07:28:42.099307');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (42,5,3,'2023-07-14 07:28:42.107177','2023-07-14 07:28:42.107177');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (55,12,2,'2023-07-24 10:22:46.291892','2023-07-24 10:22:46.291892');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (56,1,38,'2023-07-24 10:26:51.096171','2023-07-24 10:26:51.096171');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (57,2,38,'2023-07-24 10:26:54.660584','2023-07-24 10:26:54.660584');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (59,26,1,'2023-07-24 12:45:42.736704','2023-07-24 12:45:42.736704');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (65,27,1,'2023-08-01 17:13:25.947060','2023-08-01 17:13:25.947060');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (67,3,1,'2023-08-01 17:15:03.214337','2023-08-01 17:15:03.214337');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (68,28,1,'2023-08-01 17:15:37.259201','2023-08-01 17:15:37.259201');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (69,4,1,'2023-08-01 17:19:27.676379','2023-08-01 17:19:27.676379');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (70,1,2,'2023-08-04 13:31:59.813322','2023-08-04 13:31:59.813322');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (71,2,1,'2023-08-05 10:42:44.590541','2023-08-05 10:42:44.590541');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (72,38,2,'2023-08-06 12:49:14.987452','2023-08-06 12:49:14.987452');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (1,5,'Iam Artyom','2023-07-06 08:43:07.363410','2023-07-06 08:43:07.363410','lemedoit.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (2,5,'car','2023-07-06 08:45:11.770767','2023-07-06 08:45:11.770767','gmc.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (4,1,'some things','2023-07-06 08:46:40.687581','2023-08-07 17:59:57.487858','exm1.jpeg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (7,6,'new post','2023-07-06 11:57:44.900920','2023-07-06 11:57:44.900920','exm1.jpeg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (21,12,'Et eveniet sequi assumenda.','2023-07-14 07:45:27.360108','2023-07-14 07:45:27.360108','exm1.jpeg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (22,12,'Nisi a debitis accusamus.','2023-07-14 07:45:38.471158','2023-07-14 07:45:38.471158','vitamin-d-tablets.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (23,12,'Aperiam dignissimos et dolore.','2023-07-14 07:45:52.585656','2023-07-14 07:45:52.585656','exm1.jpeg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (32,2,'pepe','2023-07-20 12:36:50.476028','2023-07-20 12:36:50.476028','pepe.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (33,2,'lemee','2023-07-20 12:52:26.986800','2023-07-22 15:13:59.796069','gmc.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (34,21,'qwerqwer','2023-07-22 14:55:41.766873','2023-07-22 14:55:41.766873','gmc.jpg');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (3,4,5,'2023-07-06 10:38:01.600655','2023-07-06 10:38:01.600655');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (6,4,6,'2023-07-06 11:58:14.694139','2023-07-06 11:58:14.694139');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (10,1,1,'2023-07-12 15:31:34.574557','2023-07-12 15:31:34.574557');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (11,2,1,'2023-07-12 19:29:09.965888','2023-07-12 19:29:09.965888');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (18,2,12,'2023-07-14 07:25:35.667745','2023-07-14 07:25:35.667745');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (26,21,11,'2023-07-14 07:53:21.051819','2023-07-14 07:53:21.051819');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (41,2,9,'2023-07-14 07:55:22.124735','2023-07-14 07:55:22.124735');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (62,4,11,'2023-07-14 07:55:25.439158','2023-07-14 07:55:25.439158');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (65,1,6,'2023-07-14 07:55:25.468685','2023-07-14 07:55:25.468685');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (74,1,11,'2023-07-14 07:55:30.110244','2023-07-14 07:55:30.110244');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (80,22,12,'2023-07-14 07:55:30.168878','2023-07-14 07:55:30.168878');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (96,4,2,'2023-08-04 13:32:23.440952','2023-08-04 13:32:23.440952');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (97,23,2,'2023-08-05 10:12:10.788991','2023-08-05 10:12:10.788991');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (98,22,2,'2023-08-05 10:13:20.962265','2023-08-05 10:13:20.962265');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (101,33,1,'2023-08-05 13:24:51.252902','2023-08-05 13:24:51.252902');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (103,33,2,'2023-08-05 18:59:19.784722','2023-08-05 18:59:19.784722');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (104,32,2,'2023-08-05 18:59:25.212535','2023-08-05 18:59:25.212535');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (1,1,2,'good car','2023-07-06 13:22:58.436716','2023-07-06 13:22:58.436716');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (8,1,1,'iam emily','2023-07-06 13:43:07.287337','2023-07-06 13:43:07.287337');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (23,1,2,'like it','2023-07-13 09:50:25.731826','2023-07-13 09:50:25.731826');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (40,9,4,'Architecto hic blanditiis accusamus.','2023-07-14 07:53:53.570932','2023-07-14 07:53:53.570932');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (48,2,23,'what??? covid?','2023-07-22 15:29:00.299414','2023-07-22 15:29:00.299414');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (49,2,33,'cool car','2023-08-04 12:25:31.093467','2023-08-04 12:25:31.093467');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (50,2,33,'yeah','2023-08-04 12:25:50.091820','2023-08-04 12:25:50.091820');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (51,2,33,'thick','2023-08-04 13:30:17.291013','2023-08-04 13:30:17.291013');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (52,2,33,'uuu','2023-08-04 13:30:56.894160','2023-08-04 13:30:56.894160');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (53,2,23,'sec','2023-08-05 10:12:24.751056','2023-08-05 10:12:24.751056');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (54,2,33,'try','2023-08-05 11:06:27.379706','2023-08-05 11:06:27.379706');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (55,2,33,'tru','2023-08-05 11:06:51.943132','2023-08-05 11:06:51.943132');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (56,2,33,'tre','2023-08-05 11:10:32.304390','2023-08-05 11:10:32.304390');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (57,2,33,'asdgiuyasdigyu asdiuygasoiu ygsai dugyasigy asigd uyasidu gyaisudgy aiuyg aisdu ygio','2023-08-05 11:11:35.749988','2023-08-05 11:11:35.749988');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (58,2,33,'qqq','2023-08-05 11:11:51.236284','2023-08-05 11:11:51.236284');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (59,2,33,'good','2023-08-05 12:21:11.575892','2023-08-05 12:21:11.575892');
INSERT INTO "comments" ("id","user_id","post_id","text","created_at","updated_at") VALUES (60,1,33,'qwerqrw','2023-08-07 17:28:13.837242','2023-08-07 17:28:13.837242');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (1,'email@mail.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde','83010d58339cd7e5148228fc2e1ca300fd13c26f6ab225c91e0a61fb63e6e03d','2023-07-23 13:03:54.711219',NULL,'2023-07-06 08:33:59.654888','2023-08-07 18:01:02.743882','Emilia','Unicode_0x0045.svg.png',1,'Photographer','Emilia Waterson Jr.');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (2,'mail@mail.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde','d19857f14ff42daf3dfc6b7e73c45b5e4feb8baccd3240f5c09cffad544abe30','2023-07-23 12:59:09.537793',NULL,'2023-07-06 08:33:59.654888','2023-07-24 10:17:26.081473','Georgy','pepe.jpg',0,'Cool guy from Kavkaz😈😈😈😈','Georgy Chatchatyran');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (3,'mail@com.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Sasha','/uploads/user.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (4,'mail@mmm.mmm','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Nikolai','/uploads/user.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (5,'artyom@mail.com','$2a$12$UAJBbcNpFnrXd7oXu9Y5eeq8y.vVi773DBMNdpmTIXL0nPGEArrCS',NULL,NULL,NULL,'2023-07-06 08:37:46.783310','2023-07-06 08:37:46.783310','Artyom','/uploads/user.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (6,'ee@mail.com','$2a$12$EyzFTQEpZDfybLLfYTnbg.HT2Qu/a5K2hlP58vhS9rmJXsnKZPIOy',NULL,NULL,NULL,'2023-07-06 11:57:27.309964','2023-07-06 11:57:27.309964','Name','/uploads/user.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (9,'rosamond.sanford@rohan.example','$2a$12$bHchlsz.wg6OJ1jMXzIiFuZ7ZBV7GHgqgMiIfTaX7wmRd9.EP0gpu',NULL,NULL,NULL,'2023-07-14 07:25:36.249429','2023-07-14 07:25:36.249429','Judy','/uploads/user.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (11,'florencio.greenfelder@zemlak.example','$2a$12$ij/Zy4NoFIvuN3k1gOnMB.KBtimmnu5ZH7jdQWbzijb3Ei2f.UVR2',NULL,NULL,NULL,'2023-07-14 07:25:36.841876','2023-07-14 07:25:36.841876','Marine','/uploads/user.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (12,'rupert_gottlieb@champlin.example','$2a$12$1Z4HKby9Pg5iDy3OSiPy..mHb85.3CSFJFi3aTe3k3DE.TTzH54M.',NULL,NULL,NULL,'2023-07-14 07:25:37.118940','2023-07-14 07:25:37.118940','Russel','/uploads/user.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (19,'q@mail.m','$2a$12$CHSxXAenyMDRoG9M9X9hGOCLZD8gI7znpfmPLcG7poNr0NJOkhLTC',NULL,NULL,NULL,'2023-07-22 13:28:56.765758','2023-07-22 13:30:53.528673','qerqwer','lemedoit.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (20,'r@r.r','$2a$12$ngK8J642z/cOBGTqeVaF6.5nq/UlgC7KjpJHiaK0Z57m/qj1bHZFO',NULL,NULL,NULL,'2023-07-22 13:31:13.533962','2023-07-22 13:31:28.343390','qrrrrrr','gmc.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (21,'q@q.q','$2a$12$5c7d.N4Zt4eh5lgM6NoSiuzq3URcsSRYcRkqczQm6AedALw42lLLG',NULL,NULL,NULL,'2023-07-22 13:32:03.132519','2023-07-22 13:32:03.132519','rrrrrr','240z.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (26,'anette.stehr@mann.test','$2a$12$fj4kylxObvaozjPS7LcBHeOpS56F5ZJ69aupaXdVJp0dwABwujRYi',NULL,NULL,NULL,'2023-07-23 11:26:45.201201','2023-07-23 11:26:45.201201','Graham','1.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (27,'kevin.armstrong@mckenzie.example','$2a$12$105BQSLoQa4vNd/ipXmLReb6C2joX1ozpGamkXipP953ZvF6owIAG',NULL,NULL,NULL,'2023-07-23 11:29:42.941177','2023-07-23 11:29:42.941177','Vernice','2.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (28,'jacob_koch@collins-oconnell.example','$2a$12$2JxEOq2XtOV9hnYWVRRwV.WoGhJYA2C4n5oz4APR1PDdyinC6mOZu',NULL,NULL,NULL,'2023-07-23 11:31:03.630620','2023-07-23 11:31:03.630620','Benedict','3.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (29,'tyrone_dietrich@emmerich-grimes.test','$2a$12$AE4xGgx7vVUfM9dVDEiPR.cwWUkIcsUsyte9TjSrWsXf28NPasqpG',NULL,NULL,NULL,'2023-07-23 11:31:15.560577','2023-07-23 11:31:15.560577','Lawrence','4.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (30,'harmony@oconnell-bailey.example','$2a$12$Kz1lc91o6GsgtK9WoM.O3.5LL/t.kq4E7xQ4luilt2nT13BNQnQeS',NULL,NULL,NULL,'2023-07-23 11:31:41.007899','2023-07-23 11:31:41.007899','Nubia','5.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (31,'rolando@lehner-marvin.test','$2a$12$aVXhp.siERYGYbARGO3tROhyNcuuFANLCFCwzzouMY05V6H8i0Ukm',NULL,NULL,NULL,'2023-07-23 11:32:11.700925','2023-07-23 11:32:11.700925','Thi','6.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (32,'carmen.braun@zieme.test','$2a$12$Tcrv/.sIzvRCV5ofreXVAetcnzje/rpw1KzzMhqriK0a29FNMWcmq',NULL,NULL,NULL,'2023-07-23 11:32:16.681821','2023-07-23 11:32:16.681821','Krissy','7.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (33,'tommy@wiegand.example','$2a$12$qb0BS6Wms2SR7aEMZefubu5GV4PzUBthNcKbiBspDUzoEhQoJkn1m',NULL,NULL,NULL,'2023-07-23 11:32:20.670189','2023-07-23 11:32:20.670189','Marcella','8.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (34,'truman.homenick@kuhn-wiza.example','$2a$12$yVnopfZF31KZvitsD3MNvODWrkP/SZcrz8v9mbWlduOa/cBDnuy/.',NULL,NULL,NULL,'2023-07-23 11:32:25.167083','2023-07-23 11:32:25.167083','Norris','9.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (35,'alayna@macejkovic.example','$2a$12$WtY7cKRwcRExfYWM08HyheSRuBctb6eL/NJEQDNpv2gw.Qa2dlGZu',NULL,NULL,NULL,'2023-07-23 11:32:29.937662','2023-07-23 11:32:29.937662','Carmelo','10.jpg',0,NULL,NULL);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name","img","closed","description","realname") VALUES (38,'saulg@mail.com','$2a$12$cdlJF96.mrlseGBy3MGuD.6EuEb8FFQ9sdj3ZKNSHLl4KVCTnxa9y',NULL,NULL,NULL,'2023-07-24 10:26:15.105377','2023-07-24 10:26:15.105377','Better call me','saul.jpg',0,'Best layer in country','Saul Goodman');
INSERT INTO "notice_types" ("id","typename","created_at","updated_at") VALUES (1,'subscribe','2023-08-02 11:27:21.890741','2023-08-02 11:27:21.890741');
INSERT INTO "notice_types" ("id","typename","created_at","updated_at") VALUES (2,'like','2023-08-02 11:27:21.900098','2023-08-02 11:27:21.900098');
INSERT INTO "notice_types" ("id","typename","created_at","updated_at") VALUES (3,'comment','2023-08-02 11:27:21.908031','2023-08-02 11:27:21.908031');
INSERT INTO "notices" ("id","author_id","notice_type_id","created_at","updated_at","users_id","posts_id","comments_id") VALUES (1,2,2,'2023-08-05 18:59:19.848316','2023-08-05 18:59:19.848316',2,33,NULL);
INSERT INTO "notices" ("id","author_id","notice_type_id","created_at","updated_at","users_id","posts_id","comments_id") VALUES (2,2,2,'2023-08-05 18:59:25.228455','2023-08-05 18:59:25.228455',2,32,NULL);
INSERT INTO "notices" ("id","author_id","notice_type_id","created_at","updated_at","users_id","posts_id","comments_id") VALUES (3,38,1,'2023-08-06 12:49:15.259156','2023-08-06 12:49:15.259156',2,NULL,NULL);
INSERT INTO "notices" ("id","author_id","notice_type_id","created_at","updated_at","users_id","posts_id","comments_id") VALUES (5,2,3,'2023-08-07 17:28:13.944232','2023-08-07 17:28:13.944232',1,33,60);
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_email" ON "users" (
	"email"
);
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_reset_password_token" ON "users" (
	"reset_password_token"
);
COMMIT;
