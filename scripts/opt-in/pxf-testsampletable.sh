log "Query: select * from pxf_jdbc_sampletable2 limit 10"
psql -U gpadmin -d postgres -c "select * from pxf_jdbc_sampletable2 limit 10" 


log "Query: select * from pxf_jdbc_sampletable1 limit 10"
psql -U gpadmin -d postgres -c "select * from pxf_jdbc_sampletable1 limit 10" 

