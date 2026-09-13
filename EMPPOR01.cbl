000100******************************************************************
000200*                  EMPPOR01                                      *
000300*                                                                *
000400* Employee Portal - CICS/DB2 API program                         *
000500*                                                                *
000600*----------*                                                     *
000700* Purpose: *                                                     *
000800*----------*                                                     *
000900*   1. Receive Employee ID & DOB through DFHCOMMAREA.            *
001000*   2. Validate credentials in EMP_LOGIN.                        *
001100*   3. Retrieve personal data from EMP_DETAILS.                  *
001200*   4. Update editable employee profile fields in EMP_DETAILS.   *
001300*   5. Retrieve employment data from EMP_EMPLOYMENT.             *
001400*   6. Return the result in DFHCOMMAREA for z/OS Connect.        *
001500*                                                                *
001600*---------------*                                                *
001700* Tables Used : *                                                *
001800*---------------*                                                *
001900*   1. EMP_LOGIN.                                                *
002000*   2. EMP_DETAILS.                                              *
002100*   3. EMP_EMPLOYMENT.                                           *
002200*                                                                *
002300*---------------*                                                *
002400* Operations  : *                                                *
002500*---------------*                                                *
002600*   1. View the Table.                                           *
002700*   2. Update the table.                                         *
002800*                                                                *
002900******************************************************************
003000*------------------------*
003100 IDENTIFICATION DIVISION.
003200*------------------------*
003300*
003400 PROGRAM-ID. EMPPOR01.
003500*
003600*--------------*
003700 DATA DIVISION.
003800*--------------*
003900*
004000 WORKING-STORAGE SECTION.
004100*
004200     EXEC SQL
004300            INCLUDE SQLCA
004400     END-EXEC.
004500*
004600 01  WS-LOGIN.
004700*
004800     03  WS-EMP-ID               PIC X(06)   VALUE SPACES.
004900     03  WS-DOB                  PIC X(10)   VALUE SPACE.
005000*
005100 01  WS-DETAILS.
005200*
005300     03  WS-FIRST-NAME           PIC X(30)   VALUE SPACES.
005400     03  WS-LAST-NAME            PIC X(30)   VALUE SPACES.
005500     03  WS-DOB-OUT              PIC X(10)   VALUE SPACES.
005600     03  WS-GENDER               PIC X(01)   VALUE SPACES.
005700     03  WS-BLOOD-GROUP          PIC X(05)   VALUE SPACES.
005800     03  WS-NATIONALITY          PIC X(30)   VALUE SPACES.
005900     03  WS-MARITAL-STATUS       PIC X(15)   VALUE SPACES.
006000     03  WS-PER-EMAIL            PIC X(100)  VALUE SPACES.
006100     03  WS-WORK-EMAIL           PIC X(100)  VALUE SPACES.
006200     03  WS-MOBILE               PIC X(15)   VALUE SPACES.
006300     03  WS-EMERGENCY-CONTACT    PIC X(100)  VALUE SPACES.
006400     03  WS-OFFICE-LOCATION      PIC X(100)  VALUE SPACES.
006500     03  WS-ADDRESS              PIC X(200)  VALUE SPACES.
006600*
006700 01  WS-EMPLOYMENT.
006800*
006900     03  WS-DESIGNATION          PIC X(50)   VALUE SPACES.
007000     03  WS-DEPARTMENT           PIC X(50)   VALUE SPACES.
007100     03  WS-DIVISION             PIC X(50)   VALUE SPACES.
007200     03  WS-EMPLOYMENT-TYPE      PIC X(20)   VALUE SPACES.
007300     03  WS-DATE-OF-JOINING      PIC X(10)   VALUE SPACES.
007400     03  WS-PROBATION-STATUS     PIC X(20)   VALUE SPACES.
007500     03  WS-REPORTING-MANAGER    PIC X(60)   VALUE SPACES.
007600     03  WS-WORK-LOCATION        PIC X(100)  VALUE SPACES.
007700     03  WS-GRADE                PIC X(10)   VALUE SPACES.
007800     03  WS-TENURE-YEARS         PIC X(03)   VALUE SPACES.
007900
008000 01  WS-FUNDAMENTALS.
008100*
008200     03  WS-AUTH-EMP-ID          PIC X(06)   VALUE SPACES.
008300     03  WS-DATE-NUMERIC         PIC X(10)   VALUE SPACES.
008400     03  WS-SQL-ERROR            PIC X(10)   VALUE SPACES.
008500*
008600 01  WS-UPDATE-EMP-DETAILS.
008700*
008800     03  WS-OPERATION            PIC X(10)   VALUE SPACES.
008900     03  WS-UPDATE-EMAIL         PIC X(100)  VALUE SPACES.
009000     03  WS-UPDATE-MOBILE        PIC X(15)   VALUE SPACES.
009100     03  WS-UPDATE-EMERGENCY     PIC X(100)  VALUE SPACES.
009200     03  WS-UPDATE-ADDRESS       PIC X(200)  VALUE SPACES.
009300*
009400 LINKAGE SECTION.
009500*
009600 01  DFHCOMMAREA.
009700*
009800     03  CA-EMP-ID               PIC X(06).
009900     03  CA-DOB                  PIC X(10).
010000     03  CA-STATUS               PIC X(10).
010100     03  CA-MESSAGE              PIC X(50).
010200     03  CA-FIRST-NAME           PIC X(30).
010300     03  CA-LAST-NAME            PIC X(30).
010400     03  CA-DOB-OUT              PIC X(10).
010500     03  CA-GENDER               PIC X(01).
010600     03  CA-BLOOD-GROUP          PIC X(05).
010700     03  CA-NATIONALITY          PIC X(30).
010800     03  CA-MARITAL-STATUS       PIC X(15).
010900     03  CA-PER-EMAIL            PIC X(100).
011000     03  CA-WORK-EMAIL           PIC X(100).
011100     03  CA-MOBILE               PIC X(15).
011200     03  CA-EMERGENCY-CONTACT    PIC X(100).
011300     03  CA-OFFICE-LOCATION      PIC X(100).
011400     03  CA-ADDRESS              PIC X(200).
011500     03  CA-DESIGNATION          PIC X(50).
011600     03  CA-DEPARTMENT           PIC X(50).
011700     03  CA-DIVISION             PIC X(50).
011800     03  CA-EMPLOYMENT-TYPE      PIC X(20).
011900     03  CA-DATE-OF-JOINING      PIC X(10).
012000     03  CA-PROBATION-STATUS     PIC X(20).
012100     03  CA-REPORTING-MANAGER    PIC X(60).
012200     03  CA-WORK-LOCATION        PIC X(100).
012300     03  CA-GRADE                PIC X(10).
012400     03  CA-TENURE-YEARS         PIC X(03).
012500*
012600*    Fields Can be updated in EMP_DETAILS.
012700*
012800     03  CA-OPERATION            PIC X(10).
012900     03  CA-UPDATE-PER-EMAIL     PIC X(100).
013000     03  CA-UPDATE-MOBILE        PIC X(15).
013100     03  CA-UPDATE-EMERGENCY     PIC X(100).
013200     03  CA-UPDATE-ADDRESS       PIC X(200).
013300*
013400*-------------------*
013500 PROCEDURE DIVISION.
013600*-------------------*
013700*
013800     MOVE CA-EMP-ID              TO WS-EMP-ID
013900     MOVE CA-DOB                 TO WS-DOB
014000     MOVE CA-OPERATION           TO WS-OPERATION
014100*
014200     MOVE SPACES                 TO CA-STATUS
014300                                    CA-MESSAGE
014400*
014500*    Blank operation is treated as READ for backward compatibility
014600*
014700     IF  WS-OPERATION = 'UPDATE'
014800         GO TO PROCESS-UPDATE
014900     END-IF.
015000
015100*---------------------------------*
015200* READ / LOGIN + EMPLOYEE DETAILS *
015300*---------------------------------*
015400*
015500 EMP-ID-READ.
015600*
015700     EXEC SQL
015800             SELECT EMP_ID INTO :WS-AUTH-EMP-ID
015900             FROM EMP_LOGIN
016000             WHERE EMP_ID = :WS-EMP-ID
016100             AND DOB      = :WS-DOB
016200     END-EXEC
016300*
016400     EVALUATE TRUE
016500*
016600     WHEN SQLCODE IS EQUAL TO ZEROS
016700          CONTINUE
016800*
016900     WHEN SQLCODE IS EQUAL TO 100
017000          MOVE 'FAILED'          TO CA-STATUS
017100          MOVE 'Invalid Employee ID or Date of Birth'
017200                                 TO CA-MESSAGE
017300          GO TO RETURN-RESPONSE
017400*
017500     WHEN OTHER
017600          MOVE 'ERROR'           TO CA-STATUS
017700          MOVE 'LOGIN DB ERROR'  TO CA-MESSAGE
017800*
017900          GO TO RETURN-RESPONSE
018000
018100     END-EVALUATE.
018200*
018300     EXEC SQL
018400             SELECT FIRST_NAME,
018500             LAST_NAME,
018600             CHAR(DOB),
018700             GENDER,
018800             BLOOD_GROUP,
018900             NATIONALITY,
019000             MARITAL_STATUS,
019100             PERSONAL_EMAIL,
019200             WORK_EMAIL,
019300             MOBILE,
019400             EMERGENCY_CONTACT,
019500             OFFICE_LOCATION,
019600             ADDRESS  INTO
019700             :WS-FIRST-NAME,
019800             :WS-LAST-NAME,
019900             :WS-DOB-OUT,
020000             :WS-GENDER,
020100             :WS-BLOOD-GROUP,
020200             :WS-NATIONALITY,
020300             :WS-MARITAL-STATUS,
020400             :WS-PER-EMAIL,
020500             :WS-WORK-EMAIL,
020600             :WS-MOBILE,
020700             :WS-EMERGENCY-CONTACT,
020800             :WS-OFFICE-LOCATION,
020900             :WS-ADDRESS
021000              FROM EMP_DETAILS
021100              WHERE EMP_ID = :WS-EMP-ID
021200     END-EXEC
021300
021400     IF  SQLCODE IS NOT EQUAL TO ZEROS
021500         MOVE 'ERROR'            TO CA-STATUS
021600         MOVE 'Employee details not found'
021700                                 TO CA-MESSAGE
021800         GO TO RETURN-RESPONSE
021900     END-IF
022000*
022100     EXEC SQL
022200              SELECT DESIGNATION,
022300              DEPARTMENT,
022400              DIVISION,
022500              EMPLOYMENT_TYPE,
022600              CHAR(DATE_OF_JOINING),
022700              PROBATION_STATUS,
022800              REPORTING_MANAGER,
022900              WORK_LOCATION,
023000              GRADE,
023100              DIGITS(TENURE_YEARS) INTO
023200              :WS-DESIGNATION,
023300              :WS-DEPARTMENT,
023400              :WS-DIVISION,
023500              :WS-EMPLOYMENT-TYPE,
023600              :WS-DATE-OF-JOINING,
023700              :WS-PROBATION-STATUS,
023800              :WS-REPORTING-MANAGER,
023900              :WS-WORK-LOCATION,
024000              :WS-GRADE,
024100              :WS-TENURE-YEARS
024200               FROM EMP_EMPLOYMENT
024300               WHERE EMP_ID = :WS-EMP-ID
024400     END-EXEC
024500
024600     IF  SQLCODE IS NOT EQUAL TO ZEROS
024700         MOVE 'ERROR'            TO CA-STATUS
024800         MOVE 'Employment details not found'
024900                                 TO CA-MESSAGE
025000         GO TO RETURN-RESPONSE
025100     END-IF
025200*
025300     MOVE 'SUCCESS'              TO CA-STATUS
025400     MOVE 'Employee details retrieved'
025500                                 TO CA-MESSAGE
025600     MOVE WS-FIRST-NAME          TO CA-FIRST-NAME
025700     MOVE WS-LAST-NAME           TO CA-LAST-NAME
025800     MOVE WS-DOB-OUT             TO CA-DOB-OUT
025900     MOVE WS-GENDER              TO CA-GENDER
026000     MOVE WS-BLOOD-GROUP         TO CA-BLOOD-GROUP
026100     MOVE WS-NATIONALITY         TO CA-NATIONALITY
026200     MOVE WS-MARITAL-STATUS      TO CA-MARITAL-STATUS
026300     MOVE WS-PER-EMAIL           TO CA-PER-EMAIL
026400     MOVE WS-WORK-EMAIL          TO CA-WORK-EMAIL
026500     MOVE WS-MOBILE              TO CA-MOBILE
026600     MOVE WS-EMERGENCY-CONTACT   TO CA-EMERGENCY-CONTACT
026700     MOVE WS-OFFICE-LOCATION     TO CA-OFFICE-LOCATION
026800     MOVE WS-ADDRESS             TO CA-ADDRESS
026900     MOVE WS-DESIGNATION         TO CA-DESIGNATION
027000     MOVE WS-DEPARTMENT          TO CA-DEPARTMENT
027100     MOVE WS-DIVISION            TO CA-DIVISION
027200     MOVE WS-EMPLOYMENT-TYPE     TO CA-EMPLOYMENT-TYPE
027300     MOVE WS-DATE-OF-JOINING     TO CA-DATE-OF-JOINING
027400     MOVE WS-PROBATION-STATUS    TO CA-PROBATION-STATUS
027500     MOVE WS-REPORTING-MANAGER   TO CA-REPORTING-MANAGER
027600     MOVE WS-WORK-LOCATION       TO CA-WORK-LOCATION
027700     MOVE WS-GRADE               TO CA-GRADE
027800     MOVE WS-TENURE-YEARS        TO CA-TENURE-YEARS
027900*
028000     GO TO RETURN-RESPONSE.
028100*
028200******************************************************************
028300*                  UPDATE EMP_DETAILS                            *
028400*                                                                *
028500* The request supplies the new values. A blank value means keep  *
028600* the current DB2 value, so the frontend can update any subset   *
028700* of fields.                                                     *
028800******************************************************************
028900
029000*---------------*
029100 PROCESS-UPDATE.
029200*---------------*
029300
029400* * * Validate that the employee exists * * *
029500
029600     EXEC SQL
029700             SELECT EMP_ID INTO :WS-AUTH-EMP-ID
029800             FROM EMP_LOGIN
029900             WHERE EMP_ID = :WS-EMP-ID
030000     END-EXEC
030100
030200     EVALUATE TRUE
030300*
030400     WHEN SQLCODE IS EQUAL TO ZEROS
030500          CONTINUE
030600*
030700     WHEN SQLCODE IS EQUAL TO 100
030800          MOVE 'FAILED'          TO CA-STATUS
030900          MOVE 'Employee ID not found'
031000                                 TO CA-MESSAGE
031100          GO TO RETURN-RESPONSE
031200*
031300     WHEN OTHER
031400          MOVE 'ERROR'           TO CA-STATUS
031500          MOVE 'LOGIN DB ERROR'  TO CA-MESSAGE
031600          GO TO RETURN-RESPONSE
031700*
031800     END-EVALUATE
031900
032000*  *  *  Copy request values to host variables *  *  *
032100
032200     MOVE CA-UPDATE-PER-EMAIL    TO WS-UPDATE-EMAIL
032300     MOVE CA-UPDATE-MOBILE       TO WS-UPDATE-MOBILE
032400     MOVE CA-UPDATE-EMERGENCY    TO WS-UPDATE-EMERGENCY
032500     MOVE CA-UPDATE-ADDRESS      TO WS-UPDATE-ADDRESS
032600
032700*  *  *  Do not allow an empty update request *  *  *
032800
032900     IF  WS-UPDATE-EMAIL IS EQUAL TO SPACES
033000     AND WS-UPDATE-MOBILE IS EQUAL TO SPACES
033100     AND WS-UPDATE-EMERGENCY IS EQUAL TO SPACES
033200     AND WS-UPDATE-ADDRESS IS EQUAL TO SPACES
033300         MOVE 'FAILED'           TO CA-STATUS
033400         MOVE 'No profile changes supplied'
033500                                 TO CA-MESSAGE
033600         GO TO RETURN-RESPONSE
033700     END-IF
033800
033900*  *  *  Update only fields supplied by the caller  *  *  *
034000*
034100     EXEC SQL
034200         UPDATE EMP_DETAILS
034300            SET PERSONAL_EMAIL =
034400                CASE
034500                    WHEN LENGTH(RTRIM(:WS-UPDATE-EMAIL)) > 0
034600                    THEN :WS-UPDATE-EMAIL
034700                    ELSE PERSONAL_EMAIL
034800                END,
034900                MOBILE =
035000                CASE
035100                    WHEN LENGTH(RTRIM(:WS-UPDATE-MOBILE)) > 0
035200                    THEN :WS-UPDATE-MOBILE
035300                    ELSE MOBILE
035400                END,
035500                EMERGENCY_CONTACT =
035600                CASE
035700                    WHEN LENGTH(RTRIM(:WS-UPDATE-EMERGENCY)) > 0
035800                    THEN :WS-UPDATE-EMERGENCY
035900                    ELSE EMERGENCY_CONTACT
036000                END,
036100                ADDRESS =
036200                CASE
036300                    WHEN LENGTH(RTRIM(:WS-UPDATE-ADDRESS)) > 0
036400                    THEN :WS-UPDATE-ADDRESS
036500                    ELSE ADDRESS
036600                        END
036700                  WHERE EMP_ID = :WS-EMP-ID
036800     END-EXEC
036900*
037000     IF  SQLCODE IS NOT EQUAL TO ZEROS
037100         MOVE 'ERROR'            TO CA-STATUS
037200         MOVE 'DB2 profile update failed'
037300                                 TO CA-MESSAGE
037400         GO TO RETURN-RESPONSE
037500     END-IF
037600*
037700******************************************************************
037800*                                                                *
037900*  CICS controls the DB2 unit of work. Do not issue SQL COMMIT,  *
038000*  EXEC CICS RETURN provides the normal end-of-task syncpoint.   *
038100*                                                                *
038200******************************************************************
038300     MOVE 'SUCCESS'              TO CA-STATUS
038400     MOVE 'Employee profile updated'
038500                                 TO CA-MESSAGE
038600     GO TO RETURN-RESPONSE.
038700*
038800***********************************
038900* RETURN TO Z/OS CONNECT / CICS   *
039000***********************************
039100*
039200 RETURN-RESPONSE.
039300*
039400     EXEC CICS
039500              RETURN
039600     END-EXEC.
039700*
039800     GOBACK.
