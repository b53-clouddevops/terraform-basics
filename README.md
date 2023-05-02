# terraform-basics

This repository contains all the basics needed to start learning and implementing GitHub.

```
This repo contains examples keeping the latest version of terraform available in terraform.io.

version : 1.4.5
```

### How to install terraform ?

```
        https://developer.hashicorp.com/terraform/downloads
```

### Points to be remembered in terraform 

```
    1) Terraform is case sensitive 
    2) There is no concept of single quotes and usage of it is strictly prohibited
    3) By defatult terraform picks the file with the name terraform.tfvars and any varible that's declared outside of terraform.tfvars needs to be        explicitly mentioned
    4) How to pass a SHELL variable in terraform : export TF_VAR_STATE=AP
    5) Datasource in Terraform helps us in querying the information that is already available on Provider and this eliminates the need of hardcoding the values

```

### Provisioners 

Provisioner in terraform helps us to achieve executing tasks on the local machine or on the remote machine.

```

        1) File Provisioner        : To copy the file to the destination machine 
        2) Connection Provisioner  : This is to establish connection to the remote machine with authentication
        3) Local Provisioner       : This is to execute some task on the top of the machine where we run terraform
        4) Remote Provisioner      : This is to execute some task on the top of the machine where we run terraform

```

### Use case using provisoners :

```
    1) First I want to create a EC2 Instance along with a security group

    2) Once the Ec2 is created, on the top of the EC2, I'd like to create run the ansible-pull command and run the ansible playbook so that my server will be opereationally ready.

    3) For the second step to happen, we need to ensure first, connection-provisoner has to be executed, so that  conenction will be established and then we can run the `remote-exec` provisioner to run the ansible-pull command.

    4) Provisioners by default are `create-time` provisioners, that means provisioners by default will only run during the creation of the resource, not all the time you run the `terraform-apply`

    5) There are also a type of provisioners called `destroy-time` provsioners which will only be executed during the deletion of the resource.


```

### The very step of any project is `Network Creation` 



```
1) We need to design the network and then we will provision the infra 

2) The design should include the size of the network and also future demands of growth in mind.

3) Network has to be designed in such a way that only the needed infra should be PUBLIC Facing, rest of them should be 100% private.

4) When I say private, none of them should be accessible directly from the internet.

5) In AWS, we have a service called VPC : `Virtual Private Cloud` , using this we will design and provision our network.

6) In each and every region of AWS, we have a default network where all the infra will be created on that network by default. But, in reality, every organziaiton creates their own network as per their needs.

```


# What is Network Peering  ?

By default, one network cannot communicate with another network directly. In order to establish direct / private communication, we need to perform peering between the networks, then only they can talk to each other.



# Public IP Address vs Private IP Address ?

```
    Public IP Address is issued by the ISP and is unique across the globe.

    Private IP Adress is unique only with in the Infranet vs Corporate Network 
```

IP Address as classified in to classes based on their usage :

```
    1) Class A
    2) Class B
    3) Class C
    4) Class D
    5) Class E

```


### Networking Goals to learn network :

```
    What are my goals ?

    1) I'd like to create a network 
    2) I'd like to break that network in to 2 piece ( subnets )
    3) One should public subnet  ( should have a public ip and access to internet )
    4) One should private subnet ( should only have private ip and no direct access to internet )
    5) Also my ws from default network should be able to talk to Public / Private network, using private IP.

    Network CIDR        : 10.0.0.0/24 
    Public Subnet CIDR  : 10.0.0.0/25
    Private Subnet CIDR : 10.0.0.128/25

    6) Machines in the public network should have access to network and should be accessible from the internet.
    7) Machines in the private network should not be accessible directly from the network.
    8) If the private server, wants to talk to the internet, it should be do-able. ( using NAT Gateway )

```


### Points to remember 

```

    1) If a machine is not having a public ip, you cannot access it from the Internet Directly.
    2) Router is a device which helps in estbalishing connectivity between two different networks. In AWS, we call the similar device as IGW which is a software component and we can attach one IGW per VPC.
    3) Network peering is used to establish private communication between 2 differnt VPC with in the region / other-region, with in the account or outsode the account.
    
    PS : In order to achieve Network Peering, ensure both the VPC CIDR's are unique, if not peering will not work.

```


### How to install Terrafile 


```
Ref : https://github.com/coretech/terrafile

Terrafile is going to clone the backend module repo from the mentioned branch and keeps it local to the machine where you're executing the terraform commands

```

### How to created infra by supplying the backend config from a separate folder 

```
terraform init -backend-config=env-dev/dev-backend.tfvars 
terraform plan -var-file=env-dev/dev.tfvars
terraform apply -var-file=env-dev/dev.tfvars -auto-approve

```


### Loop in terraform

Whenever you want to executre some block of terraform code n number of times, you can use `count` , count is like a for looop which is going to execute the same block n-number of times.