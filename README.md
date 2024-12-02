# Confluent Kafka in KRaft + RBAC & Ansible

## Starts 
- osixia/openldap
- osixia/phpldapadmin
- Confluent 7.7.2
- alpine/ansible

## Commands

 1. > docker-compose up -d
 1. > docker-compose exec -w /etc/data bastion bash
 1. > ansible-galaxy collection install confluent.platform
 1. > ansible -i hosts.yml all -m ping
 1. > ansible-playbook -i hosts.yml confluent.platform.validate_hosts
 1. > ansible-playbook -i hosts.yml confluent.platform.all
 
 After playbooks've been installed
 
 1. > docker-compose exec openldap ldapsearch -x -h localhost -b dc=mimacomdemo,dc=com -D "cn=admin,dc=mimacomdemo,dc=com" -w admin
 1. > docker-compose exec tools bash
 1. > curl -u mds:mds http://con2:8090/security/1.0/roles
 1. > curl -u mds:mds http://con2:8090/security/1.0/roleNames | jq
 1. > curl -u mds:mds http://con2:8090/security/1.0/activenodes/http | jq
 1. > confluent login --url con2:8090 
 1. > admin:admin
 1. > confluent cluster describe --url http://con6:8088
 1. > confluent cluster describe --url http://con3:8081
 1. > confluent cluster describe --url http://con4:8083
 1. > confluent iam rbac role-binding list --kafka-cluster-id <cluster_id> --role SystemAdmin
 1. > confluent iam rbac role-binding create --principal User:mds  --kafka-cluster-id <cluster_id> --role SystemAdmin 
 1. > confluent iam rbac role-binding create --principal User:superUser --role SystemAdmin --kafka-cluster-id <cluster_id>
 
 
 ## Control Center reachable on http://localhost:9021 (controlcenterAdmin: controlcenterAdmin)
 ## openLdap UI (phpldapadmin) on http://localhost:8010  (cn=admin,dc=mimacomdemo,dc=com: admin)

