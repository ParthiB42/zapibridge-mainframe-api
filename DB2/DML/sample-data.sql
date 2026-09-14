-- *===========================================================*
-- *         ZapiBridge - Sample Employee Data                 *  
-- *===========================================================*

-- *---------------------------*
-- *         EMP_LOGIN         *                                  
-- *---------------------------*

INSERT INTO EMP_LOGIN(EMP_ID, DOB)
VALUES ('EMP101', DATE '1990-05-15');

INSERT INTO EMP_LOGIN (EMP_ID, DOB)
VALUES ('EMP201', DATE '1985-08-22');

INSERT INTO EMP_LOGIN(EMP_ID, DOB)
VALUES('EMP301', DATE '1992-03-10');


-- *---------------------------*
-- *         EMP_DETAILS       *                                               
-- *---------------------------*

INSERT INTO EMP_DETAILS
(   EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    DOB,
    GENDER,
    BLOOD_GROUP,
    NATIONALITY,
    MARITAL_STATUS,
    PERSONAL_EMAIL,
    WORK_EMAIL,
    MOBILE,
    EMERGENCY_CONTACT,
    OFFICE_LOCATION,
    ADDRESS 
)

VALUES
(   'EMP101',
    'ARUN',
    'KUMAR',
    DATE '1990-05-15',
    'M',
    'O+',
    'INDIAN',
    'MARRIED',
    'ARUN.KUMAR@GMAIL.COM',
    'ARUN.KUMAR@CORPTECH.IN',
    '9876543210',
    'PRIYA KUMAR - 9876500001',
    'TEXES,USA',
    '12 ANNA NAGAR, CHENNAI - 600040'
);

INSERT INTO EMP_DETAILS
(   EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    DOB,
    GENDER,
    BLOOD_GROUP,
    NATIONALITY,
    MARITAL_STATUS,
    PERSONAL_EMAIL,
    WORK_EMAIL,
    MOBILE,
    EMERGENCY_CONTACT,
    OFFICE_LOCATION,
    ADDRESS
)

VALUES
(   'EMP201',
    'SUNITA',
    'RAGHAVAN NAIR',
    DATE '1985-08-22',
    'F',
    'O+',
    'INDIAN',
    'SINGLE',
    'SUNITA.NAIR@GMAIL.COM',
    'SUNITA.NAIR@CORPTECH.IN',
    '9876543211',
    'RAHUL NAIR - 9876500002',
    'MUMBAI, INDIA',
    '24 ANDHERI WEST, MUMBAI - 400053'
);

INSERT INTO EMP_DETAILS
(   EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    DOB,
    GENDER,
    BLOOD_GROUP,
    NATIONALITY,
    MARITAL_STATUS,
    PERSONAL_EMAIL,
    WORK_EMAIL,
    MOBILE,
    EMERGENCY_CONTACT,
    OFFICE_LOCATION,
    ADDRESS
)

VALUES
(   'EMP301',
    'RAHUL',
    'SHARMA',
    DATE '1992-03-10',
    'M',
    'B+',
    'INDIAN',
    'MARRIED',
    'RAHUL.SHARMA@GMAIL.COM',
    'RAHUL.SHARMA@CORPTECH.IN',
    '9876543212',
    'MEENA SHARMA - 9876500003',
    'BANGALORE, INDIA',
    '18 WHITEFIELD, BANGALORE - 560066'
);

-- *-----------------------------*
-- *         EMP_EMPLOYMENT      *                                               
-- *-----------------------------*

INSERT INTO EMP_EMPLOYMENT
(   EMP_ID,
    DESIGNATION,
    DEPARTMENT,
    DIVISION,
    EMPLOYMENT_TYPE,
    DATE_OF_JOINING,
    PROBATION_STATUS,
    REPORTING_MANAGER,
    WORK_LOCATION,
    GRADE,
    TENURE_YEARS
)

VALUES
(   'EMP101',
    'SENIOR SOFTWARE ENGINEER',
    'TECHNOLOGY',
    'APPLICATION DEVELOPMENT',
    'PERMANENT',
    DATE '2018-06-11',
    'COMPLETED',
    'RAJESH KUMAR',
    'CHENNAI, TAMIL NADU',
    'L3',
    8
);

INSERT INTO EMP_EMPLOYMENT
(   EMP_ID,
    DESIGNATION,
    DEPARTMENT,
    DIVISION,
    EMPLOYMENT_TYPE,
    DATE_OF_JOINING,
    PROBATION_STATUS,
    REPORTING_MANAGER,
    WORK_LOCATION,
    GRADE,
    TENURE_YEARS
)

VALUES
(   'EMP201',
    'MARKETING MANAGER',
    'BRAND & MARKETING',
    'CORPORATE COMMUNICATIONS',
    'PERMANENT',
    DATE '2015-07-01',
    'COMPLETED',
    'DEEPAK PILLAI',
    'MUMBAI, MAHARASHTRA',
    'L2',
    11
);

INSERT INTO EMP_EMPLOYMENT
(   EMP_ID,
    DESIGNATION,
    DEPARTMENT,
    DIVISION,
    EMPLOYMENT_TYPE,
    DATE_OF_JOINING,
    PROBATION_STATUS,
    REPORTING_MANAGER,
    WORK_LOCATION,
    GRADE,
    TENURE_YEARS
)

VALUES
(   'EMP301',
    'BUSINESS ANALYST',
    'FINANCE',
    'BUSINESS OPERATIONS',
    'PERMANENT',
    DATE '2020-03-16',
    'COMPLETED',
    'MEENA SHARMA',
    'BANGALORE, KARNATAKA',
    'L2',
    6
);

COMMIT;