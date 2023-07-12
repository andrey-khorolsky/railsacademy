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
CREATE TABLE IF NOT EXISTS "comments" (
	"id"	integer NOT NULL,
	"user_id"	integer DEFAULT NULL,
	"post_id"	integer DEFAULT NULL,
	"text"	varchar DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	CONSTRAINT "fk_rails_2fd19c0db7" FOREIGN KEY("post_id") REFERENCES "posts"("id"),
	CONSTRAINT "fk_rails_03de2dc08c" FOREIGN KEY("user_id") REFERENCES "users"("id"),
	PRIMARY KEY("id")
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
CREATE TABLE IF NOT EXISTS "likes" (
	"id"	integer NOT NULL,
	"post_id"	integer DEFAULT NULL,
	"user_id"	integer DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	CONSTRAINT "fk_rails_1e09b5dabf" FOREIGN KEY("user_id") REFERENCES "users"("id"),
	CONSTRAINT "fk_rails_87a8aac469" FOREIGN KEY("post_id") REFERENCES "posts"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "posts" (
	"id"	integer NOT NULL,
	"user_id"	integer DEFAULT NULL,
	"text"	text DEFAULT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	"img"	varchar DEFAULT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT "fk_rails_5b5ddfd518" FOREIGN KEY("user_id") REFERENCES "users"("id")
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
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (1,'email@mail.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Emilia');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (2,'mail@mail.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Georgy');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (3,'mail@com.com','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Sasha');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (4,'mail@mmm.mmm','$2a$12$TUYuKizR9gynEM8vwEhqjOS/N35y1brPIFSy1DWpkQ/DN0P5Pttde',NULL,NULL,NULL,'2023-07-06 08:33:59.654888','2023-07-06 08:33:59.654888','Nikolai');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (5,'artyom@mail.com','$2a$12$UAJBbcNpFnrXd7oXu9Y5eeq8y.vVi773DBMNdpmTIXL0nPGEArrCS',NULL,NULL,NULL,'2023-07-06 08:37:46.783310','2023-07-06 08:37:46.783310','Artyom');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (6,'ee@mail.com','$2a$12$EyzFTQEpZDfybLLfYTnbg.HT2Qu/a5K2hlP58vhS9rmJXsnKZPIOy',NULL,NULL,NULL,'2023-07-06 11:57:27.309964','2023-07-06 11:57:27.309964','Name');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (8,'wendy.brown@oconnell-swaniawski.example','$2a$04$XeScR.nu4N6OnROdts9VR.g7Rv49qB//VOsSCUzRNG16ZpX3wdh7m',NULL,NULL,NULL,'2023-07-10 15:28:33.950263','2023-07-10 15:28:33.950263','Rudy');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (9,'monica@connelly.example','$2a$04$tjUTcOGdMV1qXmyobeXySuQutUCTAgK4Qs08CPvSU4DyKG.wJBeTK',NULL,NULL,NULL,'2023-07-11 08:21:14.713286','2023-07-11 08:21:14.713286','Freeman');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (10,'ranae_schaden@kreiger.test','$2a$04$32wGiDxoAqkO/9kjsLtp6..DmcCrFitKgCw7Kjng.A0MsYcNOC97O',NULL,NULL,NULL,'2023-07-11 08:22:00.540523','2023-07-11 08:22:00.540523','Darrick');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (11,'lynn_green@kassulke.example','$2a$04$kMaCNm0CrPwakW3N9q9SOuCPX.qjTaUUWhrpVdJUGwRdS.UMC8.pO',NULL,NULL,NULL,'2023-07-11 08:22:12.483369','2023-07-11 08:22:12.483369','Galen');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (12,'pia_abshire@marquardt-steuber.test','$2a$04$E/6BVzEyP8sp.m7mujUtTe3vb9x2Ow0LGEGTSbI1GnTofGpuawrky',NULL,NULL,NULL,'2023-07-11 08:32:50.201149','2023-07-11 08:32:50.201149','Salvador');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (13,'andrea@rath-hettinger.test','$2a$04$IH91rBtQJkxHV0oLW7gc4ePudP7IFmoVNbq0FMSkgx4urfILUFFSO',NULL,NULL,NULL,'2023-07-11 08:34:04.644978','2023-07-11 08:34:04.644978','Yuonne');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (14,'carmen@mayer.test','$2a$04$3Po5tJdtX7zzf7xrhajAx.QWhE8xWeDao0XSswCpOS/84UwbzYr8G',NULL,NULL,NULL,'2023-07-11 08:34:45.195278','2023-07-11 08:34:45.195278','Lida');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (15,'faustina@boehm.test','$2a$04$vW76KF90q6pxNXYPQxG2GuLPoCSDabzmux8SVhBfhZuepJEU2kf1i',NULL,NULL,NULL,'2023-07-11 08:35:01.478917','2023-07-11 08:35:01.478917','Howard');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (16,'bob@sawayn.test','$2a$04$nuZPyv8XULYf251a12SO.e25Cl9vBaKiukmGJH/MISuCSvk.srXK6',NULL,NULL,NULL,'2023-07-11 08:35:31.099664','2023-07-11 08:35:31.099664','Mary');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (17,'adelle.nicolas@bergnaum-goldner.test','$2a$04$E0cWNTbTP5pqpCO5C7TGJuDxn7hzXTiIk33UlYS180AOKeBwwc7rC',NULL,NULL,NULL,'2023-07-11 08:36:08.846264','2023-07-11 08:36:08.846264','Williams');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (18,'lonna@waters-sipes.test','$2a$04$4Feb.HLxhaWqc.YQlwif6OPRBpsoxGBYDGjdhsd3FRmpDk2j3fy4e',NULL,NULL,NULL,'2023-07-11 08:36:54.526189','2023-07-11 08:36:54.526189','Akilah');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (19,'lee.romaguera@damore-mills.example','$2a$04$JSd1g0mw7HxMrbAL/mqXNOENseG2.Dsbj8hlPzBSfWMbRn6Eh66A.',NULL,NULL,NULL,'2023-07-11 08:37:18.541223','2023-07-11 08:37:18.541223','Aleta');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (20,'sanora@hilpert-pacocha.example','$2a$04$CtgNRvu3QDDklJ/lB0sq0.EcK0bywSyHqY4mvZC9see2lcp7P7Dk.',NULL,NULL,NULL,'2023-07-11 08:41:06.832734','2023-07-11 08:41:06.832734','Shantell');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (21,'sirena_konopelski@zemlak.example','$2a$04$ut3xcMfVpiPNuhlsaZ.TBOKjNmeGbFoQA9/VCMjbKpnezJTRXPvRi',NULL,NULL,NULL,'2023-07-11 08:41:51.101568','2023-07-11 08:41:51.101568','Royce');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (22,'jin@runolfsdottir.example','$2a$04$PJQIqhq57q.VYVNEmnwSpuYd/5Daum/oaF1VKZ2F8FS9T1yx0aVUS',NULL,NULL,NULL,'2023-07-11 08:42:03.620154','2023-07-11 08:42:03.620154','Rosenda');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (23,'julian@turner-bernier.example','$2a$04$TtoZrFHtfonuktuQulIM9OPWgDwNlviR1C.eG0HS2f2J9JVZC4z8.',NULL,NULL,NULL,'2023-07-11 08:42:17.926179','2023-07-11 08:42:17.926179','Albert');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (24,'bari.jacobson@emmerich.example','$2a$04$lsezMQDna3a6fEBKSNAX3OVpumc.Ec0dEIK.erhzRu9vLlOZQBZhK',NULL,NULL,NULL,'2023-07-11 08:42:37.348431','2023-07-11 08:42:37.348431','Charlette');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (25,'christian@marvin.test','$2a$04$AVvYmJiGMQgK5SCQhF.HZeikExgcsW0kIHtZPZqOxdA5gwoefmZEy',NULL,NULL,NULL,'2023-07-11 08:43:39.727458','2023-07-11 08:43:39.727458','Clement');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (26,'cruz@white-schoen.example','$2a$04$jQLjH8xlP09oR./y5lY7buUYcE.pbNW9dRAndT4btjZ1b7ABpiznC',NULL,NULL,NULL,'2023-07-11 08:44:05.610965','2023-07-11 08:44:05.610965','Avril');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (27,'lauren@harber.test','$2a$04$8Qcqyptg.0S4yhCqigfYLO3ly3Sc3FDvd14KdJeMuBmJZ60q8Dxqe',NULL,NULL,NULL,'2023-07-11 08:44:46.343271','2023-07-11 08:44:46.343271','Arnita');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (28,'steve@langosh.test','$2a$04$34E9P114UY/MyttQnLUXneyqCTFp4JlRSeF1LgH4fWcWAejfwGTnm',NULL,NULL,NULL,'2023-07-11 08:45:12.087861','2023-07-11 08:45:12.087861','Nigel');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (29,'aline@bayer-schneider.test','$2a$04$hdq3IVva8kXVgfm4wFMiq.eJsWVRlkUgF55lVwgLtqTSqek0hCkOu',NULL,NULL,NULL,'2023-07-11 09:22:20.088525','2023-07-11 09:22:20.088525','Jewel');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (30,'leif@goldner.test','$2a$04$ZFV97K.N3TQzjzCps0nefuvZTS/ud2diDC9tVRw0Ik2yh.vS3F.vu',NULL,NULL,NULL,'2023-07-11 09:22:37.632554','2023-07-11 09:22:37.632554','Vella');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (31,'martin@farrell-becker.test','$2a$04$Bh4qcTLM7bHHBG10GmV4hOP4N/cC3GDEpP/LDlkNUKqRuh9vmScVu',NULL,NULL,NULL,'2023-07-11 09:22:56.854483','2023-07-11 09:22:56.854483','Nguyet');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (32,'dennise@gerlach-homenick.test','$2a$04$j3iOSG0SWT32ZqkjCboiSelaiyMSbVY1cdVZPNd/F0EyzyFaFyzxy',NULL,NULL,NULL,'2023-07-11 09:23:03.176191','2023-07-11 09:23:03.176191','Al');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (33,'elvis.beer@macejkovic.example','$2a$04$3VNK5GM.Aq284sj5WCODE.GHl7CZtR59ExTPebdaSoigRob5vK366',NULL,NULL,NULL,'2023-07-11 09:23:20.973366','2023-07-11 09:23:20.973366','Shalon');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (34,'murray@dicki.example','$2a$04$GPwTsJQsTaGw2BY4RBoCe.v84firttqRq7.U93eqZXYZKOO7MhF2O',NULL,NULL,NULL,'2023-07-11 09:24:29.930775','2023-07-11 09:24:29.930775','Micki');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (35,'art@barrows.example','$2a$04$HOxpXXcdZLL5wXd1r6AjSOAHpCiHaQE5qmQPQ3sVEm94Ae7Ku1Doa',NULL,NULL,NULL,'2023-07-11 09:26:24.941138','2023-07-11 09:26:24.941138','Felecia');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (36,'ted@auer-huels.test','$2a$04$cS8ZMORQjRkAgyg/Kf3FB.j4XyPRxta9eEfpJEuMMRL5gsy/0VNJm',NULL,NULL,NULL,'2023-07-11 09:26:50.474781','2023-07-11 09:26:50.474781','Henry');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (37,'kathryne@funk.example','$2a$04$zSR4p3Vx.ShsoO7Un4Z4/OAB1MCAsZ1.laT8gYip6EVnxVTIE4omi',NULL,NULL,NULL,'2023-07-11 09:26:55.675465','2023-07-11 09:26:55.675465','Graig');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (38,'dong@ondricka-champlin.test','$2a$04$IobKRn72Fr6coEuEpMdbZuqACHRVyAupV5U8NM2IEvtXPjpGa3/s6',NULL,NULL,NULL,'2023-07-11 09:27:15.194474','2023-07-11 09:27:15.194474','Isaac');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (39,'roosevelt.walker@green.example','$2a$04$VP06QF5g2mLlgnQxDbi0wuRxJTGHJFQ2tXG5tW97yolV4AIhdajLy',NULL,NULL,NULL,'2023-07-11 15:00:13.186598','2023-07-11 15:00:13.186598','Nestor');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (40,'carey.blanda@davis.example','$2a$04$74LVNWAzaFMb1fBspgYv7OXZsVAyOTx3hUglWJF3y4FnoD8Hfwrne',NULL,NULL,NULL,'2023-07-11 15:00:43.112918','2023-07-11 15:00:43.112918','Cicely');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (41,'martine_nicolas@fay.test','$2a$04$PDTn7ZPYbAAXcqiW3P0yaeA9vSIc3cP2FRIEu/7ye1E7ZZlF6lUVC',NULL,NULL,NULL,'2023-07-11 15:01:39.613594','2023-07-11 15:01:39.613594','Martin');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (42,'whitley_franecki@kuhlman.test','$2a$04$FxedoHGX02Fgw4UHgq3L7OyJZIIir2isZ09jZ.XjDZOW06dPCCCZi',NULL,NULL,NULL,'2023-07-11 15:02:55.338135','2023-07-11 15:02:55.338135','Leandro');
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","name") VALUES (43,'ingeborg@ward.test','$2a$04$VU1LqVtVP3H03rRq9zsJQuNDal9D/k0NhnfCcG.FSOEF7WKcpNaL.',NULL,NULL,NULL,'2023-07-11 15:07:06.610330','2023-07-11 15:07:06.610330','Noel');
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
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (1,1,5,'2023-07-06 08:44:04.806906','2023-07-06 08:44:04.806906');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (2,2,5,'2023-07-06 08:44:11.294975','2023-07-06 08:44:11.294975');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (6,1,6,'2023-07-06 12:29:07.844331','2023-07-06 12:29:07.844331');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (7,3,6,'2023-07-06 12:29:26.536964','2023-07-06 12:29:26.536964');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (10,3,5,'2023-07-06 13:29:38.870604','2023-07-06 13:29:38.870604');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (12,2,1,'2023-07-06 15:42:30.277034','2023-07-06 15:42:30.277034');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (13,3,1,'2023-07-07 12:56:40.355154','2023-07-07 12:56:40.355154');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (14,6,1,'2023-07-07 14:18:12.543779','2023-07-07 14:18:12.543779');
INSERT INTO "followers" ("id","author_id","follower_id","created_at","updated_at") VALUES (15,5,1,'2023-07-07 14:18:20.265555','2023-07-07 14:18:20.265555');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (3,4,5,'2023-07-06 10:38:01.600655','2023-07-06 10:38:01.600655');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (4,3,5,'2023-07-06 10:38:19.665121','2023-07-06 10:38:19.665121');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (6,4,6,'2023-07-06 11:58:14.694139','2023-07-06 11:58:14.694139');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (8,8,5,'2023-07-06 14:05:47.515635','2023-07-06 14:05:47.515635');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (9,3,1,'2023-07-07 14:28:25.229854','2023-07-07 14:28:25.229854');
INSERT INTO "likes" ("id","post_id","user_id","created_at","updated_at") VALUES (10,7,1,'2023-07-07 15:16:42.997257','2023-07-07 15:16:42.997257');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (1,5,'Iam Artyom','2023-07-06 08:43:07.363410','2023-07-06 08:43:07.363410','lemedoit.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (2,5,'car','2023-07-06 08:45:11.770767','2023-07-06 08:45:11.770767','gmc.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (3,3,'blablablablabla','2023-07-06 08:46:16.362620','2023-07-06 08:46:16.362620',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (4,1,'some things','2023-07-06 08:46:40.687581','2023-07-06 08:46:40.687581','exm1.jpeg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (5,1,'qwer','2023-07-06 11:53:19.645319','2023-07-06 11:53:19.645319','lemedoit.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (6,1,'boba','2023-07-06 11:55:07.236442','2023-07-06 11:55:07.236442','gmc.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (7,6,'new post','2023-07-06 11:57:44.900920','2023-07-06 11:57:44.900920','exm1.jpeg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (8,1,'done','2023-07-06 14:03:41.813731','2023-07-06 14:03:41.813731','vitamin-d-tablets.jpg');
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (9,3,'Occaecati ut sed. Quia amet aperiam. Vero sint ea.','2023-07-11 09:22:20.120866','2023-07-11 09:22:20.120866',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (10,2,'Quibusdam harum aut. Et tempora officia. In est at.','2023-07-11 09:22:37.681328','2023-07-11 09:22:37.686834',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (11,2,'Maiores enim vel. Veritatis voluptas saepe. Minus consequatur ipsam.','2023-07-11 09:22:56.887919','2023-07-11 09:22:56.887919',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (12,2,'Modi nihil fuga. Est quis autem. Sapiente voluptas nesciunt.','2023-07-11 09:23:03.211283','2023-07-11 09:23:03.217405',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (13,2,'Quis atque nam. Facere expedita laboriosam. Et sint totam.','2023-07-11 09:23:21.011809','2023-07-11 09:23:21.018573',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (14,2,'Porro ipsum sunt. Praesentium rerum et. Velit voluptate deserunt.','2023-07-11 09:24:29.971648','2023-07-11 09:24:29.976916',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (15,2,'Voluptas vero aut. Sed dolores illo. Numquam voluptas rerum.','2023-07-11 09:24:29.982279','2023-07-11 09:24:29.986861',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (16,2,'Occaecati molestias et. Voluptatum consectetur omnis. Rerum molestias voluptas.','2023-07-11 09:26:24.970863','2023-07-11 09:26:24.976051',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (17,2,'Voluptas sit molestias. Aspernatur quas ut. Assumenda quibusdam laboriosam.','2023-07-11 09:26:24.981761','2023-07-11 09:26:24.986737',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (18,2,'Tempora facere qui. Voluptatem voluptatem dolorem. Ut quod quia.','2023-07-11 09:26:50.517312','2023-07-11 09:26:50.522733',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (19,2,'Ullam laborum accusamus. Ab id sequi. Sed voluptatem sequi.','2023-07-11 09:26:50.528475','2023-07-11 09:26:50.528475',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (20,2,'Aut vitae sit. Ipsum doloribus et. Quia adipisci dolores.','2023-07-11 09:26:55.707103','2023-07-11 09:26:55.713562',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (21,2,'Facere nemo consectetur. Perferendis qui ratione. Velit dolores deleniti.','2023-07-11 09:26:55.719233','2023-07-11 09:26:55.724294',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (22,2,'At repudiandae dolorem. Et distinctio ratione. Consequatur consequatur voluptas.','2023-07-11 09:27:15.250507','2023-07-11 09:27:15.257306',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (23,2,'Error temporibus dolorem. Rerum unde et. Fugiat corporis delectus.','2023-07-11 09:27:15.263189','2023-07-11 09:27:15.268062',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (24,2,'Quae quas cum. Quo ut saepe. Non magni sint.','2023-07-11 15:00:13.226672','2023-07-11 15:00:13.233429',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (25,2,'Consequatur et est. Et rerum et. Ipsum rerum dolorem.','2023-07-11 15:00:13.239842','2023-07-11 15:00:13.244330',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (26,2,'Quo voluptas laborum. Culpa minima ut. Ex cumque magni.','2023-07-11 15:00:43.147843','2023-07-11 15:00:43.153762',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (27,2,'Ea facilis voluptate. Aut cupiditate et. Consequatur illo magnam.','2023-07-11 15:00:43.160093','2023-07-11 15:00:43.165265',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (28,2,'Sit aut laudantium. Aperiam a explicabo. Dolorem ipsum velit.','2023-07-11 15:01:39.657932','2023-07-11 15:01:39.664913',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (29,2,'Culpa reiciendis quo. Sed ipsum enim. Cumque doloribus numquam.','2023-07-11 15:01:39.672559','2023-07-11 15:01:39.678074',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (30,2,'Omnis reprehenderit cum. Nulla est ut. Recusandae voluptas optio.','2023-07-11 15:02:55.383546','2023-07-11 15:02:55.389610',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (31,2,'Eum magnam saepe. Voluptas nisi dolorem. Libero cumque labore.','2023-07-11 15:02:55.396349','2023-07-11 15:02:55.396349',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (32,2,'Soluta assumenda consectetur. Aperiam quas et. Eum iste et.','2023-07-11 15:07:06.646421','2023-07-11 15:07:06.654256',NULL);
INSERT INTO "posts" ("id","user_id","text","created_at","updated_at","img") VALUES (33,2,'Dolore ad reiciendis. Maxime voluptatibus excepturi. Consequuntur sequi quisquam.','2023-07-11 15:07:06.661269','2023-07-11 15:07:06.692274',NULL);
INSERT INTO "schema_migrations" ("version") VALUES ('20230706124852');
INSERT INTO "schema_migrations" ("version") VALUES ('20230704151812');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705084100');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705101249');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705141651');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705145839');
INSERT INTO "schema_migrations" ("version") VALUES ('20230705192449');
INSERT INTO "schema_migrations" ("version") VALUES ('20230706082422');
INSERT INTO "schema_migrations" ("version") VALUES ('20230706082123');
INSERT INTO "ar_internal_metadata" ("key","value","created_at","updated_at") VALUES ('environment','test','2023-07-07 14:58:10.323563','2023-07-07 14:58:10.331921');
INSERT INTO "ar_internal_metadata" ("key","value","created_at","updated_at") VALUES ('schema_sha1','f8c8e26eb40d430a276728b73af01037f5267c36','2023-07-07 14:58:10.340363','2023-07-07 14:58:10.340363');
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_email" ON "users" (
	"email"
);
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_reset_password_token" ON "users" (
	"reset_password_token"
);
COMMIT;
