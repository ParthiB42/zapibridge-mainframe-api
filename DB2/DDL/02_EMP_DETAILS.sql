-- ============================================================
-- ZapiBridge - EMP_DETAILS
-- Employee personal and contact information
-- ============================================================

CREATE TABLE EMP_DETAILS
(
    EMP_ID             CHAR(6)   NOT NULL,
    FIRST_NAME         CHAR(30)  NOT NULL,
    LAST_NAME          CHAR(30)  NOT NULL,
    DOB                DATE      NOT NULL,
    GENDER             CHAR(1)   NOT NULL,
    BLOOD_GROUP        CHAR(5)   NOT NULL,
    NATIONALITY        CHAR(30)  NOT NULL,
    MARITAL_STATUS     CHAR(15)  NOT NULL,
    PERSONAL_EMAIL     CHAR(100) NOT NULL,
    WORK_EMAIL         CHAR(100) NOT NULL,
    MOBILE             CHAR(15)  NOT NULL,
    EMERGENCY_CONTACT  CHAR(100) NOT NULL,
    OFFICE_LOCATION    CHAR(100) NOT NULL,
    ADDRESS            CHAR(200) NOT NULL,

    CONSTRAINT PK_EMP_DETAILS
        PRIMARY KEY (EMP_ID),

    CONSTRAINT FK_EMP_DETAILS_LOGIN
        FOREIGN KEY (EMP_ID)
        REFERENCES EMP_LOGIN (EMP_ID)
);