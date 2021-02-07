sqoop import  --connect 'jdbc:sqlserver://$Hostname;database=db_name' \
--username 'user_name' --password 'passwd' \
--table 'table_name' \
--hive-delims-replacement "anything" \
--null-string '\\N' --null-non-string '\\N' \
--fields-terminated-by "^" \
--hive-import \
--hive-overwrite \
--hive-table 'db_name.table_name' \
-m 1
