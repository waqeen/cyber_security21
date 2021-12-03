![logo](loogo.png)

-------------------------
This repository contains a set of vulnerable Docker images for attacking the container environment compiled for Cyber_Security hackathon 2021.

Requirements
===
The sweep procedure was performed on **Centos 8** with the **latest** kernel version and with necessary libraries defined below.

Clone this repository:
```console
[root@localhost]# sudo yum -y install git
[root@localhost]# git clone https://github.com/frizzymonsta/cyber_security21.git
```
Run script for installing Docker and Docker-compose.
```console
[root@localhost]# cd cyber_security21
[root@localhost]# chmod +x docker.install.centos.redhat.sh
[root@localhost]# ./docker.install.centos.redhat.sh
```

To install images, you need to be authorized on [Docker Hub](https://hub.docker.com).

```console
[root@localhost]# docker login
```

Scripts explanation
===

The repository contains the following images:

Container|Bash for starting image
---|---
Kali linux container.| bash/kali_container.sh 
Simple mail form imitation.| bash/cve-2016-10033.sh 
Nginx server that hosts a simple two-page website.| bash/website_sql_start.sh
Redis database.| bash/website_sql_start.sh 
Simple FTPd imitation.| bash/cve-2015-3306.sh
Elastic search.| bash/cve-2015-1427.sh 
Tomcat image.|bash/tomcat.sh
Ubuntu image.|bash/cve-2019-5736.sh

Sources of images are contained in the *images* directory.

To run all images:
```console
[root@localhost falco]# chmod +x start_all.sh
[root@localhost falco]# ./start_all.sh
```
To stop all images:
```console
[root@localhost falco]# docker kill $(docker ps -q)
```
All images running in silent mode. Remove **-d** flag in scripts to avoid it.

Exploits
===

[**cve-2015-1427**](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-1427)
---

**Image**: bash/cve-2015-1427.sh 

**To do**: Bypass the sandbox protection mechanism and execute arbitrary shell commands via a crafted script. Access by default: **localhost:9200**.

[**cve-2015-3306**](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3306)
---

**Image**: bash/cve-2015-3306.sh

**To do**: Read and write to arbitrary files via the site CPFR and site CPTO commands. Port by default: **21**.

[**cve-2016-10033**](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-10033)
---

**Image**: bash/cve-2016-10033.sh 

**To do**: Pass extra parameters to the mail command and consequently execute arbitrary code via a \" (backslash double quote) in a crafted Sender property. Access by default: **localhost:8383**

![example](images/cve-2016-10033/defaced.png)

[**cve-2019-5736**](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
---

**Image**: bash/cve-2019-5736.sh

**To do**: Overwrite the host runc binary (and consequently obtain host root access) by leveraging the ability to execute a command as root within one of these types of containers: (1) a new container with an attacker-controlled image, or (2) an existing container, to which the attacker previously had write access, that can be attached with docker exec. This occurs because of file-descriptor mishandling, related to /proc/self/exe.

Win condition
---
Get unauthorized access to images described earlier and other containers in this repository (Kali, tomcat, portfolio website(redis and nginx, localhost:8080 by default).

**Good luck!**
