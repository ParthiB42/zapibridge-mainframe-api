-- ============================================================
-- ZapiBridge - EMP_LOGIN
-- Employee authentication table
-- ============================================================

CREATE TABLE EMP_LOGIN
(
    EMP_ID CHAR(6) NOT NULL,
    DOB    DATE    NOT NULL,

    CONSTRAINT PK_EMP_LOGIN
        PRIMARY KEY (EMP_ID)
);