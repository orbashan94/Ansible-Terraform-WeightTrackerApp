# Ansible-Terraform-WeightTrackerApp

## Goals
- Use Terraform to provision the infrastructure
- Use Ansible to deploy the NodeWeightTracker application
- Create two environments: Staging and Production
![App Screenshot](https://bootcamp.rhinops.io/images/week-6-envs.png)

## Requirements

- Terraform
- Azure account
- Azure CLI

## Configuration

- Use azurerm as a provider.
- Azure CLI.
- Create staging.tfvars for your variables on staging environment.
- Create production.tfvars for your variables on production environment.

## How to run and deploy application
### Clone the project and open with your prefer IDE:
    
     $ git clone https://github.com/orbashan94/Ansible-Terraform-WeightTrackerApp
### Create Production environment:
```
$ terraform workspace new production
$ terraform apply -var-file production.tfvars
```    
### Enter controller VM via SSH and run the following commands to install Ansible and create ssh-key:
```
$ sudo apt install
$ sudo apt upgrade -y
$ sudo apt install ansible
$ ssh-keygen
```
### Repeat follow commands on every VM you want to deploy the app on:
```
$ ssh-copy-id -i username@<host_ip>
Connect VM via SSH and run: $ sudo nano /etc/ssh/sshd_config
Uncomment row: `PubkeyAuthentication yes`
```

### Back to controller VM and Add app servers Ip's to hosts file:
`$ sudo nano /etc/ansible/hosts`

Add on the end of the file:`
```
[appservers]
<ip_vm_1>
<ip_vm_2>
etc..
```

### Ensure connection to App servers
`ansible -m ping all`

### create vars.yml for ansible variables: 
`sudo nano vars.yml`

copy into the file and enter your details:
```
---
deploy_directory: <deploy_directory>
host_url: http://<load_balancer_ip>
pg_host: <pg_host>
pg_username: postgres
pg_database: pg_database
pg_password: <your_postgres_password>
okta_org_url: <your_okta_org_url>
okta_client_id: <your_okta_client_id>
okta_client_secret: <your_okta_client_secret>
```

### Run application 
`ansible-playbook playbook.yml`

to ensure the app is running enter on web browser: `<load_balancer_ip>:8080`

#### These steps refer to BOTH environments and should be executed on each environment.
