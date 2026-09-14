      ******************************************************************
      * EMPPOR01-COMMAREA.cpy                                          *
      *                                                                *   
      * Purpose:                                                       *   
      *   CICS DFHCOMMAREA layout used by EMPPOR01.                    *
      *                                                                *
      * Application:                                                   *   
      *   ZapiBridge - Employee Portal API                             *
      *                                                                *
      * Operations:                                                    *  
      *   READ   - CA-OPERATION blank                                  *
      *   UPDATE - CA-OPERATION = 'UPDATE'                             *
      *                                                                *   
      * Total Length:                                                  *            
      *   1610 bytes                                                   *
      ******************************************************************

       01  EMPPOR01-COMMAREA.

           03  CA-EMP-ID                 PIC X(06).
           03  CA-DOB                    PIC X(10).
           03  CA-STATUS                 PIC X(10).
           03  CA-MESSAGE                PIC X(50).
      *
           03  CA-FIRST-NAME             PIC X(30).
           03  CA-LAST-NAME              PIC X(30).
           03  CA-DOB-OUT                PIC X(10).
           03  CA-GENDER                 PIC X(01).
           03  CA-BLOOD-GROUP            PIC X(05).
           03  CA-NATIONALITY            PIC X(30).
           03  CA-MARITAL-STATUS         PIC X(15).
           03  CA-PERSONAL-EMAIL         PIC X(100).
           03  CA-WORK-EMAIL             PIC X(100).
           03  CA-MOBILE                 PIC X(15).
           03  CA-EMERGENCY-CONTACT      PIC X(100).
           03  CA-OFFICE-LOCATION        PIC X(100).
           03  CA-ADDRESS                PIC X(200).
      *
           03  CA-DESIGNATION            PIC X(50).
           03  CA-DEPARTMENT             PIC X(50).
           03  CA-DIVISION               PIC X(50).
           03  CA-EMPLOYMENT-TYPE        PIC X(20).
           03  CA-DATE-OF-JOINING        PIC X(10).
           03  CA-PROBATION-STATUS       PIC X(20).
           03  CA-REPORTING-MANAGER      PIC X(60).
           03  CA-WORK-LOCATION          PIC X(100).
           03  CA-GRADE                  PIC X(10).
           03  CA-TENURE-YEARS           PIC X(03).

      *----------------------------------------------------------------*
      *    UPDATE REQUEST FIELDS                                       *
      *----------------------------------------------------------------* 
           03  CA-OPERATION              PIC X(10).
           03  CA-UPDATE-PERSONAL-EMAIL  PIC X(100).
           03  CA-UPDATE-MOBILE          PIC X(15).
           03  CA-UPDATE-EMERGENCY       PIC X(100).
           03  CA-UPDATE-ADDRESS         PIC X(200).