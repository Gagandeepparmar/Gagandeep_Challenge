# comcast_project

# Terraform 
  aws.tf file is to spinup VM in AWS

# Ansible command to provision VM
    ansible-playbook webserver.yml -i /etc/ansible/hosts --private-key ~/.ssh/id_rsa -u root --ask-vault-pass

# Please add following to the /etc/hosts file to view the website.
    54.89.240.33  www.Mycomcastdemo.com Mycomcastdemo.com 