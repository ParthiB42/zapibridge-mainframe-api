-- ============================================================
-- ZapiBridge - EMP_EMPLOYMENT
-- Employee employment information
-- ============================================================

CREATE TABLE EMP_EMPLOYMENT
(
    EMP_ID              CHAR(6)  NOT NULL,
    DESIGNATION         CHAR(50) NOT NULL,
    DEPARTMENT          CHAR(50) NOT NULL,
    DIVISION            CHAR(50) NOT NULL,
    EMPLOYMENT_TYPE     CHAR(20) NOT NULL,
    DATE_OF_JOINING     DATE     NOT NULL,
    PROBATION_STATUS    CHAR(20) NOT NULL,
    REPORTING_MANAGER   CHAR(60) NOT NULL,
    WORK_LOCATION       CHAR(100) NOT NULL,
    GRADE               CHAR(10) NOT NULL,
    TENURE_YEARS        INTEGER  NOT NULL,

    CONSTRAINT PK_EMP_EMPLOYMENT
        PRIMARY KEY (EMP_ID),

    CONSTRAINT FK_EMP_EMPLOYMENT_LOGIN
        FOREIGN KEY (EMP_ID)
        REFERENCES EMP_LOGIN (EMP_ID)
);