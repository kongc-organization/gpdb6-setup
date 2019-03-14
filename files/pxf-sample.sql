DROP TABLE IF EXISTS  sampletable1;
create table sampletable1 as select id from generate_Series(1,10000) id;


DROP TABLE IF EXISTS  sampletable2;
create table sampletable2 as select generate_Series(1,10000) as a,  md5(random()::text) AS b;



CREATE EXTENSION pxf;
GRANT SELECT ON PROTOCOL pxf TO gpadmin;
GRANT INSERT ON PROTOCOL pxf TO gpadmin;

DROP EXTERNAL TABLE IF EXISTS  pxf_jdbc_sampletable1;
CREATE EXTERNAL TABLE pxf_jdbc_sampletable1(id int)
            LOCATION ('pxf://postgres_table1?PROFILE=JDBC&JDBC_DRIVER=org.postgresql.Driver&DB_URL=jdbc:postgresql://localhost:5432/postgres&USER=gpadmin&PASS=pivotal')
            FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



DROP EXTERNAL TABLE IF EXISTS  pxf_jdbc_sampletable2;
CREATE EXTERNAL TABLE pxf_jdbc_sampletable2(a int, b text)
                        LOCATION ('pxf://sampletable2?PROFILE=JDBC&JDBC_DRIVER=org.postgresql.Driver&DB_URL=jdbc:postgresql://localhost:5432/postgres&USER=gpadmin&PASS=pivotal')
                        FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');
                        