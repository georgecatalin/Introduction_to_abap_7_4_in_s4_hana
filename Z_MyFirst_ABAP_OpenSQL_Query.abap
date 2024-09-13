*&------------------------------------------------------------------------------------------------------*
*& Report Z_FIRST_ABAP_QUERY
*&-------------------------------------------------------------------------------------------------------*
*& USE transaction id BC_DATA_GEN to generate data in the dummy tables to study OPEN-SQL with ABAP
*& USE SE80 Object Navigator transaction on Local Packages to create ABAP Programs for learning
*&-------------------------------------------------------------------------------------------------------*
REPORT z_first_abap_query.


" How to read a single column from database using SELECT SINGLE
* SELECT SINGLE planetype FROM sflight INTO @DATA(aircraft_type).
* cl_demo_output=>display( aircraft_type ).

ULINE.

" How to use a work area to read into memory
* SELECT SINGLE carrid, connid, fldate FROM sflight INTO @DATA(flight).
* cl_demo_output=>display( flight-carrid ).

" How to read multiple columns in a field list
* SELECT SINGLE planetype, seatsocc, paymentsum
*  FROM sflight
*  INTO @DATA(flight).

* cl_demo_output=>display( flight ).

" How to read all columns from a row using the wildcard (*)
* SELECT SINGLE * FROM sflight INTO @DATA(flight).
* cl_demo_output=>display( flight ).

" How to read multiple rows from a database table in an internal table
* SELECT carrid, connid, fldate FROM sflight INTO TABLE @DATA(flights).

* WRITE:/ flights[ 1 ]-carrid. " to read the carrid of the first element of the internal table
* WRITE: / flights[ 2 ]-carrid. " to read the carrid of the second element of the internal table
* WRITE: / flights[ 3 ]-carrid. " " to read the carrid of the thirds element of the internal table

" How to read multiple rows of a database table into an internal table
* SELECT * FROM sflight INTO TABLE @DATA(flights).
* cl_demo_output=>display( flights ).


" How to use the WHERE clause
SELECT carrid, connid, fldate FROM sflight WHERE carrid = 'AA' INTO TABLE @DATA(sflights).

WRITE: / sflights[ 2 ]-connid. " display the connid of the second row in the results table
