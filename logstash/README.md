# logstash configurations

In this directory there is some logstash configuration files used by EXEHDA-ISSA in its evaluation scenario. 

In the conf.d directory are presented some files that is normaly alocated in /etc/logstash/conf.d/, including files used to fetch events from different databases (mysql, db2) that are used by different systems (osticket - http://osticket.com/, tracmor - https://github.com/tracmor/tracmor, and legacy). So, there is also present in this directory the drivers used (jdbc_sqlj and mysql-connector-java-5.1.41) to facilitate the replication of the scenario

The patterns file presents the logstash grok patterns used in the "Preprocessing" module for several log formats from different applications like:
- Postgrey
- Dovecot
- OSSEC HIDS
- Squid
- BroIDS
- IPTables and Shorewall
- Postfix
- Apache
- Syslog
- Roundcube Webmail
- ModSecurity
- and others...

The ap_client_info.py is a personalized script use to collect statistics from a specific access point.

The iana_services.yaml is a file that can be used to map network ports to services.
