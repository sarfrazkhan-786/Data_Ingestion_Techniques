sqoop job --create INC_LOAD_PAYMENT_CLIENT_VOUCHERDATA \
--meta-connect jdbc:hsqldb:hsql://devbded01.dm.ae:16000/sqoop \
-- import --connect 'jdbc:oracle:thin:@//hostname:1521/schema_name' \
--username 'SAKHAN_RO' --password-file '/user/raw_dmdata/investment/investment_service.passwrd' \
--table 'db_name.table_name' \
--map-column-hive 'ID=Bigint,SYSTEM$CHANGEDBY=Bigint,SYSTEM$OWNER=Bigint,CHANGEDDATE=Timestamp,CREATEDDATE=Timestamp' \
--target-dir 'hdfs://nameservice1/user/hive/warehouse/db_name.db/payment_client_voucherdata' \
--append \
-m 4 \
--hive-delims-replacement "anything" \
--null-string '\\N' --null-non-string '\\N' \
--fields-terminated-by "^" \
--check-column 'CREATEDDATE' \
--incremental lastmodified --last-value '2011-07-28' \
--verbose


################------List the Sqoop Job -----################
sqoop job --meta-connect jdbc:hsqldb:hsql://sqoop_host_name:16000/sqoop -list


#############------To Execute the Sqoop Job ---------###########

sqoop job --exec INC_LOAD_PAYMENT_CLIENT_VOUCHERDATA --meta-connect jdbc:hsqldb:hsql://sqoop_host_name:16000/sqoop


###delete job  #################

sqoop job --delete INC_LOAD_PAYMENT_CLIENT_VOUCHERDATA --meta-connect jdbc:hsqldb:hsql://sqoop_host_name:16000/sqoop
