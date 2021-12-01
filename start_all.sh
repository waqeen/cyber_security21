#! /bin/bash

systemctl start docker
cd bash
chmod +x cve-2015-1427.sh cve-2015-3306.sh cve-2016-10033.sh cve-2019-5736.sh website_sql_start.sh tomcat.sh kali_container.sh
./cve-2015-1427.sh
./cve-2015-3306.sh
./cve-2016-10033.sh
./cve-2019-5736.sh
./website_sql_start.sh
./tomcat.sh
./kali_container.sh
docker ps
cd ../../