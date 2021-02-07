nohup sqoop import-all-tables "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" --connect 'jdbc:sqlserver://Hostname;database=db_name' \
--username 'user_name' --password 'passwd' \
--exclude-tables "table_1,Table_3,Table_10" \
--hive-delims-replacement "anything" --as-parquetfile --null-string '\\N' --null-non-string '\\N' --fields-terminated-by "^" --hive-import \
--hive-database 'db_name' --hive-overwrite --autoreset-to-one-mapper \
--verbose &
