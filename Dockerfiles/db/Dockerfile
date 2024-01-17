FROM mysql:latest
# WORKDIR /db
# # here db_grp is group and using -g to add db_usr to db_grp
# RUN groupadd -r db_grp && useradd -g db_usr db_grp
# RUN chown -R db_usr:db_grp /db
# USER db_usr
ENV MYSQL_ROOT_PASSWORD=Yfsdhjkrtfgw789ryq89057y205yu
ENV MYSQL_DATABASE=accounts
ADD db_backup.sql /docker-entrypoint-initdb.d/db_backup.sql
EXPOSE 3306
