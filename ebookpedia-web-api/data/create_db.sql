drop table USER_ACCOUNT_USER_PROFILE;
drop table USER_PROFILE_PERMISSION;
drop table PERMISSIONS;
drop table USER_PROFILES;
drop table USER_ACCOUNTS;


CREATE TABLE USER_ACCOUNTS (
    ID SERIAL PRIMARY KEY,
    SSO_ID VARCHAR(100) NOT NULL,
    PASSWORD VARCHAR(100) NOT NULL,
    FIRST_NAME VARCHAR(100) NOT NULL,
    LAST_NAME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    AVATAR VARCHAR(100),
    WEBSITE VARCHAR(100),
    BIRTH_DATE TIMESTAMP WITH TIME ZONE,
    LAST_ACTIVITY TIMESTAMP WITH TIME ZONE,
    MEMBER_FROM TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE UNIQUE INDEX IDX_USER_ACCOUNTS_EMAIL ON USER_ACCOUNTS(EMAIL);
CREATE UNIQUE INDEX IDX_USER_ACCOUNTS_SSO_ID ON USER_ACCOUNTS(SSO_ID);


CREATE TABLE USER_PROFILES (
    ID SERIAL PRIMARY KEY,
    TYPE VARCHAR(100) NOT NULL
);

CREATE TABLE USER_ACCOUNT_USER_PROFILE (
  USER_ACCOUNT_ID INTEGER NOT NULL,
  USER_PROFILE_ID INTEGER NOT NULL,
  PRIMARY KEY (USER_ACCOUNT_ID, USER_PROFILE_ID),
  CONSTRAINT USER_ACCOUNT_USER_PROFILE_FK_1 FOREIGN KEY (USER_ACCOUNT_ID) REFERENCES USER_PROFILES(ID),
  CONSTRAINT USER_ACCOUNT_USER_PROFILE_FK_2 FOREIGN KEY (USER_PROFILE_ID) REFERENCES USER_PROFILES(ID)
);


CREATE TABLE PERMISSIONS (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(45) NOT NULL,
    DESCRIPTION VARCHAR(100) NOT NULL
);

CREATE TABLE USER_PROFILE_PERMISSION (
  USER_PROFILE_ID INTEGER NOT NULL,
  PERMISSION_ID INTEGER NOT NULL,
  PRIMARY KEY (USER_PROFILE_ID, PERMISSION_ID),
  CONSTRAINT PERMISSION_USER_PROFILE_FK_1 FOREIGN KEY (USER_PROFILE_ID) REFERENCES USER_PROFILES (ID),
  CONSTRAINT PERMISSION_USER_PROFILE_FK_2 FOREIGN KEY (PERMISSION_ID) REFERENCES PERMISSIONS (ID)
);


INSERT INTO USER_PROFILES VALUES (nextval('user_profiles_id_seq'), 'ADMIN');
INSERT INTO USER_PROFILES VALUES (nextval('user_profiles_id_seq'), 'POSTER');
INSERT INTO USER_PROFILES VALUES (nextval('user_profiles_id_seq'), 'GUEST');



INSERT INTO PERMISSIONS VALUES (nextval('permissions_id_seq'), 'MANAGE USERS', 'Allow manage users in the system');
INSERT INTO PERMISSIONS VALUES (nextval('permissions_id_seq'), 'MANAGE POSTS', 'Allow manage post in the system');
INSERT INTO PERMISSIONS VALUES (nextval('permissions_id_seq'), 'VIEW POSTS', 'Allow only view post in the system');

INSERT INTO USER_ACCOUNTS VALUES (nextval('user_accounts_id_seq'), 'jdyanquen', '123', 'Jesus', 'Yanquen', 'jdyanquen@yopmail.com', null, null, '1988-03-09', now(), now());
INSERT INTO USER_ACCOUNTS VALUES (nextval('user_accounts_id_seq'), 'dacorrea', '123', 'David', 'Correa', 'dacorrea@yopmail.com', null, null, '1988-03-09', now(), now());
INSERT INTO USER_ACCOUNTS VALUES (nextval('user_accounts_id_seq'), 'latorres', '123', 'Laura', 'Torres', 'latorres@yopmail.com', null, null, '1988-03-09', now(), now());


select * from USER_ACCOUNTS;
select * from USER_PROFILES;

INSERT INTO USER_ACCOUNT_USER_PROFILE VALUES (1,1);
INSERT INTO USER_ACCOUNT_USER_PROFILE VALUES (2,2);
INSERT INTO USER_ACCOUNT_USER_PROFILE VALUES (3,3);

INSERT INTO USER_PROFILE_PERMISSION VALUES (1,1);
INSERT INTO USER_PROFILE_PERMISSION VALUES (1,2);
INSERT INTO USER_PROFILE_PERMISSION VALUES (2,2);
INSERT INTO USER_PROFILE_PERMISSION VALUES (3,3);


truncate table USER_PROFILES;
